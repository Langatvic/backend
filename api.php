<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\FoodController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\RatingController;
use App\Http\Controllers\TableController;
use App\Http\Controllers\UserController;


// Auth
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

// Foods
Route::get('/foods', [FoodController::class, 'index']);
Route::get('/foods/{id}', [FoodController::class, 'show']);
Route::get('/categories', [FoodController::class, 'getCategories']);
Route::get('/categories/{category}', [FoodController::class, 'getByCategory']);

// Tables (public)
Route::get('/available-tables', [TableController::class, 'getAvailableTables']);

// This route should be PUBLIC (no authentication required)
Route::get('/public-ratings', [RatingController::class, 'getPublicRatings']);


Route::middleware('auth:sanctum')->group(function () {
    // Auth routes
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/me', [AuthController::class, 'me']);
    Route::put('/profile', [AuthController::class, 'updateProfile']);
    Route::get('/profile', [AuthController::class, 'getProfile']);
    
    // Order routes for customers
    Route::post('/orders', [OrderController::class, 'createOrder']);
    Route::get('/my-orders', [OrderController::class, 'getCustomerOrders']);
    Route::patch('/orders/{id}/cancel', [OrderController::class, 'cancelOrder']);
    
    // Rating routes (authenticated users can submit ratings)
    Route::post('/ratings', [RatingController::class, 'submitRating']);
    Route::get('/foods/{foodId}/ratings', [RatingController::class, 'getFoodRatings']);
    
    // Manager routes (role: manager, admin)
    Route::middleware('role:manager,admin')->group(function () {
        Route::get('/manager/orders', [OrderController::class, 'getManagerOrders']);
        Route::patch('/orders/{id}/approve', [OrderController::class, 'approveOrder']);
        Route::patch('/orders/{id}/status', [OrderController::class, 'updateOrderStatus']);
        Route::get('/all-ratings', [RatingController::class, 'getRatings']);
    });

    // Admin routes (role: admin)
    Route::middleware('role:admin')->group(function () {
        // Food and Table management
        Route::apiResource('foods', FoodController::class)->except(['index', 'show']);
        Route::apiResource('tables', TableController::class);
        
        // User Management
        Route::get('/users', [UserController::class, 'index']);
        Route::delete('/users/{id}', [UserController::class, 'destroy']);
        Route::put('/users/{id}/role', [UserController::class, 'updateRole']);
        
        // Image Upload
        Route::post('/upload-image', [FoodController::class, 'uploadImage']);
    });
});