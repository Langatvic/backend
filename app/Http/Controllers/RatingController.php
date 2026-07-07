<?php

namespace App\Http\Controllers;

use App\Models\Rating;
use App\Models\Order;
use Illuminate\Http\Request;

class RatingController extends Controller
{
    /**
     * Submit a new rating (requires authentication)
     */
    public function submitRating(Request $request)
    {
        $validator = validator($request->all(), [
            'order_id' => 'required|exists:orders,id',
            'food_id' => 'required|exists:foods,id',
            'food_rating' => 'required|integer|min:1|max:5',
            'service_rating' => 'required|integer|min:1|max:5',
            'comment' => 'nullable|string',
            'is_public' => 'boolean', // Add this validation
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $user = $request->user();
        $order = Order::find($request->order_id);

        // Check if order belongs to user and is delivered
        if ($order->user_id !== $user->id) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        if ($order->status !== 'delivered') {
            return response()->json(['message' => 'Can only rate delivered orders'], 400);
        }

        // Check if already rated
        $existingRating = Rating::where('order_id', $request->order_id)
            ->where('food_id', $request->food_id)
            ->first();

        if ($existingRating) {
            return response()->json(['message' => 'Already rated this item'], 400);
        }

        $rating = Rating::create([
            'user_id' => $user->id,
            'order_id' => $request->order_id,
            'food_id' => $request->food_id,
            'food_rating' => $request->food_rating,
            'service_rating' => $request->service_rating,
            'comment' => $request->comment,
            'is_public' => $request->is_public ?? true, // Default to true
        ]);

        return response()->json([
            'rating' => $rating,
            'message' => 'Rating submitted successfully'
        ], 201);
    }

    /**
     * Get all ratings (for managers/admins)
     */
    public function getRatings(Request $request)
    {
        $ratings = Rating::with(['user', 'food'])
            ->orderBy('created_at', 'desc')
            ->get();
        
        // Calculate average ratings
        $totalRatings = $ratings->count();
        $totalFoodRating = 0;
        $totalServiceRating = 0;
        
        foreach ($ratings as $rating) {
            $totalFoodRating += $rating->food_rating;
            $totalServiceRating += $rating->service_rating;
        }
        
        $averageFoodRating = $totalRatings > 0 ? $totalFoodRating / $totalRatings : 0;
        $averageServiceRating = $totalRatings > 0 ? $totalServiceRating / $totalRatings : 0;
        $averageOverallRating = $totalRatings > 0 
            ? ($totalFoodRating + $totalServiceRating) / ($totalRatings * 2) 
            : 0;
        
        return response()->json([
            'ratings' => $ratings,
            'average_food_rating' => round($averageFoodRating, 1),
            'average_service_rating' => round($averageServiceRating, 1),
            'average_overall_rating' => round($averageOverallRating, 1),
            'total_ratings' => $totalRatings,
        ]);
    }

    /**
     * Get ratings for a specific food
     */
    public function getFoodRatings($foodId)
    {
        $ratings = Rating::where('food_id', $foodId)
            ->where('is_public', true) // Only show public ratings
            ->with('user')
            ->orderBy('created_at', 'desc')
            ->get();
        
        $averageRating = $ratings->avg('food_rating');
        
        return response()->json([
            'ratings' => $ratings,
            'average_rating' => round($averageRating, 1),
            'total_ratings' => $ratings->count()
        ]);
    }

    // ============ NEW: GET PUBLIC RATINGS ============
    /**
     * Get all public ratings (no authentication required)
     * This endpoint is accessible to everyone
     */
    public function getPublicRatings()
    {
        try {
            // Get all public ratings with user and food relationships
            $ratings = Rating::with(['user', 'food'])
                ->where('is_public', true)
                ->orderBy('created_at', 'desc')
                ->get();

            // Format the response
            $formattedRatings = $ratings->map(function ($rating) {
                return [
                    'id' => $rating->id,
                    'user_id' => $rating->user_id,
                    'food_id' => $rating->food_id,
                    'order_id' => $rating->order_id,
                    'food_rating' => $rating->food_rating,
                    'service_rating' => $rating->service_rating,
                    'comment' => $rating->comment,
                    'is_public' => $rating->is_public,
                    'created_at' => $rating->created_at,
                    'user_name' => $rating->user ? $rating->user->name : 'Anonymous',
                    'food_name' => $rating->food ? $rating->food->name : null,
                ];
            });

            // Calculate averages
            $totalRatings = $ratings->count();
            $avgFoodRating = $ratings->avg('food_rating') ?? 0;
            $avgServiceRating = $ratings->avg('service_rating') ?? 0;
            $avgOverallRating = $ratings->avg(function ($rating) {
                return ($rating->food_rating + $rating->service_rating) / 2;
            }) ?? 0;

            return response()->json([
                'ratings' => $formattedRatings,
                'total' => $totalRatings,
                'average_food_rating' => round($avgFoodRating, 1),
                'average_service_rating' => round($avgServiceRating, 1),
                'average_overall_rating' => round($avgOverallRating, 1),
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Error fetching public ratings',
                'error' => $e->getMessage(),
            ], 500);
        }
    }
}