<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('order_items', function (Blueprint $table) {
            $table->id();
            $table->foreignId('order_id')->constrained('orders')->onDelete('cascade');
            $table->foreignId('food_id')->constrained('foods')->onDelete('cascade');
            $table->integer('quantity');
            $table->decimal('price_kes', 10, 2);
            $table->decimal('price_usd', 10, 2);
            $table->decimal('price_eur', 10, 2);
            $table->decimal('subtotal_kes', 10, 2);
            $table->decimal('subtotal_usd', 10, 2);
            $table->decimal('subtotal_eur', 10, 2);
            $table->text('special_instructions')->nullable();
            $table->timestamps();
            
            // Indexes
            $table->index('order_id');
            $table->index('food_id');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('order_items');
    }
};
