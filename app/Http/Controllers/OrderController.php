<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Food;
use App\Models\Table;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class OrderController extends Controller
{
    public function createOrder(Request $request)
    {
        $validator = validator($request->all(), [
            'table_id' => 'required|exists:tables,id',
            'items' => 'required|array',
            'items.*.food_id' => 'required|exists:foods,id',
            'items.*.quantity' => 'required|integer|min:1',
            'special_instructions' => 'nullable|string'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $user = $request->user();
        $table = Table::find($request->table_id);

        // Calculate totals
        $total_kes = 0;
        $total_usd = 0;
        $total_eur = 0;
        $orderItems = [];

        foreach ($request->items as $item) {
            $food = Food::find($item['food_id']);
            $quantity = $item['quantity'];
            
            $subtotal_kes = $food->price_kes * $quantity;
            $subtotal_usd = $food->price_usd * $quantity;
            $subtotal_eur = $food->price_eur * $quantity;
            
            $total_kes += $subtotal_kes;
            $total_usd += $subtotal_usd;
            $total_eur += $subtotal_eur;
            
            $orderItems[] = [
                'food_id' => $food->id,
                'quantity' => $quantity,
                'price_kes' => $food->price_kes,
                'price_usd' => $food->price_usd,
                'price_eur' => $food->price_eur,
                'subtotal_kes' => $subtotal_kes,
                'subtotal_usd' => $subtotal_usd,
                'subtotal_eur' => $subtotal_eur,
                'special_instructions' => $item['special_instructions'] ?? null,
            ];
        }

        // Create order
        $order = Order::create([
            'user_id' => $user->id,
            'table_id' => $request->table_id,
            'order_number' => 'ORD-' . Str::random(10),
            'total_amount_kes' => $total_kes,
            'total_amount_usd' => $total_usd,
            'total_amount_eur' => $total_eur,
            'status' => 'pending',
            'special_instructions' => $request->special_instructions,
        ]);

        // Create order items
        foreach ($orderItems as $item) {
            $item['order_id'] = $order->id;
            OrderItem::create($item);
        }

        // Update table status
        $table->occupy();

        return response()->json([
            'order' => $order->load('items.food'),
            'message' => 'Order created successfully'
        ], 201);
    }

    public function getCustomerOrders(Request $request)
    {
        $orders = Order::where('user_id', $request->user()->id)
            ->with(['items.food', 'table'])
            ->orderBy('created_at', 'desc')
            ->get();
        
        return response()->json($orders);
    }

    public function getManagerOrders(Request $request)
    {
        $orders = Order::with(['user', 'table', 'items.food'])
            ->orderBy('created_at', 'desc')
            ->get();
        
        return response()->json($orders);
    }

    public function approveOrder($id)
    {
        $order = Order::findOrFail($id);
        $order->approve();
        
        return response()->json([
            'order' => $order,
            'message' => 'Order approved successfully'
        ]);
    }

    public function updateOrderStatus(Request $request, $id)
    {
        $validator = validator($request->all(), [
            'status' => 'required|in:preparing,ready,delivered,cancelled'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $order = Order::findOrFail($id);
        
        switch($request->status) {
            case 'preparing':
                $order->startPreparing();
                break;
            case 'ready':
                $order->markAsReady();
                break;
            case 'delivered':
                $order->deliver();
                // Free the table when order is delivered
                if ($order->table) {
                    $order->table->free();
                }
                break;
            case 'cancelled':
                // ============ FIXED: Use the cancel() method ============
                // This ensures is_cancelled is set to 2 automatically
                $order->cancel();
                break;
        }

        return response()->json([
            'order' => $order->fresh()->load('items.food', 'table'),
            'message' => 'Order status updated successfully'
        ]);
    }

    /**
     * Cancel an order and free the table
     */
    public function cancelOrder($id)
    {
        $order = Order::findOrFail($id);
        $user = auth()->user();
        
        // Check if user owns the order or is admin/manager
        if ($user->id !== $order->user_id && !in_array($user->role, ['admin', 'manager'])) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }
        
        // Check if order is already cancelled
        if ($order->isCancelled()) {
            return response()->json(['message' => 'Order is already cancelled'], 400);
        }
        
        // Check if order can be cancelled
        if (!$order->canBeCancelled()) {
            return response()->json([
                'message' => 'Order cannot be cancelled. Current status: ' . $order->status
            ], 400);
        }
        
        // Check if order was delivered (for refund messaging)
        $wasDelivered = $order->isDelivered();
        
        // ============ CANCEL THE ORDER ============
        // This automatically sets:
        // - status = 'cancelled'
        // - is_cancelled = 2
        // - frees the table
        $order->cancel();
        
        // ============ EXTRA SAFETY: Ensure table is freed ============
        if ($order->table_id) {
            $table = Table::find($order->table_id);
            if ($table && $table->status !== 'available') {
                $table->status = 'available';
                $table->save();
            }
        }
        
        $message = $wasDelivered 
            ? 'Order cancelled. A refund will be processed within 24 hours.'
            : 'Order cancelled successfully';
        
        return response()->json([
            'message' => $message,
            'order' => $order->fresh()->load('items.food', 'table'),
            'refund_required' => $wasDelivered,
        ]);
    }
}