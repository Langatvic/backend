<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('foods', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->text('description');
            $table->decimal('price_kes', 10, 2);
            $table->decimal('price_usd', 10, 2);
            $table->decimal('price_eur', 10, 2);
            $table->string('category');
            $table->string('image_url');
            $table->boolean('is_available')->default(true);
            $table->integer('preparation_time')->comment('in minutes');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('foods');
    }
};