<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Food;
use App\Models\User;
use App\Models\Rating;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function adminStats()
    {
        return response()->json([
            'total_orders' => Order::count(),
            'total_users' => User::count(),
            'total_foods' => Food::count(),
            'average_rating' => Rating::avg('food_rating') ?? 0,
            'revenue_kes' => Order::where('status', 'delivered')->sum('total_amount_kes'),
        ]);
    }

    public function managerStats()
    {
        return response()->json([
            'pending_orders' => Order::where('status', 'pending')->count(),
            'preparing_orders' => Order::where('status', 'preparing')->count(),
            'ready_orders' => Order::where('status', 'ready')->count(),
            'today_orders' => Order::whereDate('created_at', today())->count(),
        ]);
    }
}