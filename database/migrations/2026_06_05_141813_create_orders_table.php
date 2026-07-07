<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('table_id')->constrained('tables')->onDelete('cascade');
            $table->string('order_number')->unique();
            $table->decimal('total_amount_kes', 10, 2);
            $table->decimal('total_amount_usd', 10, 2);
            $table->decimal('total_amount_eur', 10, 2);
            $table->enum('status', ['pending', 'approved', 'preparing', 'ready', 'delivered', 'cancelled'])->default('pending');
            $table->text('special_instructions')->nullable();
            $table->timestamp('approved_at')->nullable();
            $table->timestamp('delivered_at')->nullable();
            $table->timestamps();
            
            // Indexes for better performance
            $table->index('order_number');
            $table->index('status');
            $table->index('created_at');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
