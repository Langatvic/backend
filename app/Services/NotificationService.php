<?php

namespace App\Services;

use App\Models\User;
use Illuminate\Support\Facades\Log;

class NotificationService
{
    public static function sendOrderStatusUpdate($userId, $orderNumber, $status)
    {
        // Placeholder – integrate Firebase Cloud Messaging or Pusher
        Log::info("Notification to user {$userId}: Order {$orderNumber} is now {$status}");
    }
}