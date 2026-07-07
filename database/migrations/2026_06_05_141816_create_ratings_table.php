<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('ratings', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('order_id')->constrained('orders')->onDelete('cascade');
            $table->foreignId('food_id')->constrained('foods')->onDelete('cascade');
            $table->integer('food_rating')->comment('1-5 stars');
            $table->integer('service_rating')->comment('1-5 stars');
            $table->text('comment')->nullable();
            $table->timestamps();
            
            // Ensure one rating per order item
            $table->unique(['order_id', 'food_id']);
            
            // Indexes
            $table->index('user_id');
            $table->index('food_id');
            $table->index('created_at');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('ratings');
    }
};
