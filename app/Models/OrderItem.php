<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    use HasFactory;

    protected $fillable = [
        'order_id',
        'food_id',
        'quantity',
        'price_kes',
        'price_usd',
        'price_eur',
        'subtotal_kes',
        'subtotal_usd',
        'subtotal_eur',
        'special_instructions'
    ];

    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    public function food()
    {
        return $this->belongsTo(Food::class);
    }
}