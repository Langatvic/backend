<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Table extends Model
{
    use HasFactory;

    protected $fillable = [
        'table_number', 'capacity', 'status', 'qr_code'
    ];

    public function orders()
    {
        return $this->hasMany(Order::class);
    }

    public function isAvailable()
    {
        return $this->status === 'available';
    }

    public function isOccupied()
    {
        return $this->status === 'occupied';
    }

    public function occupy()
    {
        $this->status = 'occupied';
        $this->save();
    }

    public function free()
    {
        $this->status = 'available';
        $this->save();
    }

    /**
     * Force free the table regardless of current status
     */
    public function forceFree()
    {
        $this->status = 'available';
        $this->save();
    }
}