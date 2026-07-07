<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Food extends Model
{
    use HasFactory;

    protected $table = 'foods';
     
    protected $fillable = [
        'name', 
        'description', 
        'price_kes', 
        'price_usd', 
        'price_eur',
        'category', 
        'image_url', 
        'is_available', 
        'preparation_time'
    ];

    protected $casts = [
        'is_available' => 'boolean',
        'price_kes' => 'decimal:2',
        'price_usd' => 'decimal:2',
        'price_eur' => 'decimal:2',
        'preparation_time' => 'integer',
    ];

    // ============ ADD THIS ACCESSOR ============
    // This ensures image URLs are always fully qualified
    public function getImageUrlAttribute($value)
    {
        // If value is null or empty, return default image
        if (empty($value)) {
            return asset('images/default-food.jpg');
        }
        
        // If it's already a full URL (starts with http or https), return it
        if (filter_var($value, FILTER_VALIDATE_URL)) {
            return $value;
        }
        
        // If it's a path starting with 'storage/', prepend the asset URL
        if (strpos($value, 'storage/') === 0) {
            return asset($value);
        }
        
        // If it's a local path, prepend the storage URL
        if (strpos($value, '/storage/') === 0) {
            return asset($value);
        }
        
        // Default: return as is (assuming it's a URL)
        return $value;
    }

    public function orderItems()
    {
        return $this->hasMany(OrderItem::class);
    }

    public function ratings()
    {
        return $this->hasMany(Rating::class);
    }

    public function getAverageRatingAttribute()
    {
        return $this->ratings()->avg('food_rating') ?? 0;
    }
}