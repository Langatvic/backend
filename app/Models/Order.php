<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id', 
        'table_id', 
        'order_number', 
        'total_amount_kes',
        'total_amount_usd', 
        'total_amount_eur', 
        'status',
        'is_delivered',      // ✅ ADD THIS
        'is_cancelled',      // ✅ ADD THIS
        'special_instructions', 
        'approved_at', 
        'delivered_at'
    ];

    protected $casts = [
        'approved_at' => 'datetime',
        'delivered_at' => 'datetime',
        'is_delivered' => 'integer',      // ✅ ADD THIS
        'is_cancelled' => 'integer',      // ✅ ADD THIS
        'total_amount_kes' => 'decimal:2',
        'total_amount_usd' => 'decimal:2',
        'total_amount_eur' => 'decimal:2',
    ];

    // ============ AUTO-SYNC BOOLEAN FIELDS ============
    protected static function booted()
    {
        static::saving(function ($order) {
            // Auto-update is_delivered: 1 = delivered, 0 = not delivered
            $order->is_delivered = $order->status === 'delivered' ? 1 : 0;
            
            // Auto-update is_cancelled: 2 = cancelled, 0 = not cancelled
            $order->is_cancelled = $order->status === 'cancelled' ? 2 : 0;
        });
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function table()
    {
        return $this->belongsTo(Table::class);
    }

    public function items()
    {
        return $this->hasMany(OrderItem::class);
    }

    public function rating()
    {
        return $this->hasOne(Rating::class);
    }

    // Status Methods
    public function approve()
    {
        $this->status = 'approved';
        $this->approved_at = now();
        $this->save();
    }

    public function startPreparing()
    {
        $this->status = 'preparing';
        $this->save();
    }

    public function markAsReady()
    {
        $this->status = 'ready';
        $this->save();
    }

    public function deliver()
    {
        $this->status = 'delivered';
        $this->delivered_at = now();
        $this->save();
        
        // Free the table when delivered
        if ($this->table_id) {
            $table = Table::find($this->table_id);
            if ($table) {
                $table->free();
            }
        }
    }

    // Cancellation Methods
    public function canBeCancelled(): bool
    {
        if ($this->status === null) {
            return false;
        }
        return !in_array($this->status, ['cancelled', 'delivered']);
    }

    // ============ UPDATED BOOLEAN CHECK METHODS ============
    public function isCancelled(): bool
    {
        return $this->status === 'cancelled' || $this->is_cancelled === 2;
    }

    public function isDelivered(): bool
    {
        return $this->status === 'delivered' || $this->is_delivered === 1;
    }

    public function isPending(): bool
    {
        return $this->status === 'pending';
    }

    public function isActive(): bool
    {
        return !in_array($this->status, ['cancelled', 'delivered']);
    }

    /**
     * Cancel the order and free the table
     */
    public function cancel(): void
    {
        // Only cancel if not already cancelled
        if ($this->status !== 'cancelled') {
            $this->status = 'cancelled';
            $this->save(); // This triggers booted() which sets is_cancelled = 2
            
            // Free the table
            if ($this->table_id) {
                $table = Table::find($this->table_id);
                if ($table) {
                    $table->status = 'available';
                    $table->save();
                }
            }
        }
    }

    /**
     * Free the table manually
     */
    public function freeTable(): void
    {
        if ($this->table_id) {
            $table = Table::find($this->table_id);
            if ($table) {
                $table->status = 'available';
                $table->save();
            }
        }
    }

    // ============ SCOPES FOR EASY QUERYING ============
    public function scopeDelivered($query)
    {
        return $query->where('is_delivered', 1);
    }

    public function scopeCancelled($query)
    {
        return $query->where('is_cancelled', 2);
    }

    public function scopeActive($query)
    {
        return $query->where('is_delivered', 0)
                     ->where('is_cancelled', 0);
    }

    public function getStatusText(): string
    {
        $statusMap = [
            'pending' => 'Pending',
            'approved' => 'Approved',
            'preparing' => 'Preparing',
            'ready' => 'Ready',
            'delivered' => 'Delivered',
            'cancelled' => 'Cancelled',
        ];
        return $statusMap[$this->status] ?? $this->status;
    }

    public function getStatusColor(): string
    {
        $colorMap = [
            'pending' => 'warning',
            'approved' => 'info',
            'preparing' => 'primary',
            'ready' => 'success',
            'delivered' => 'success',
            'cancelled' => 'danger',
        ];
        return $colorMap[$this->status] ?? 'secondary';
    }

    public function getTotalInCurrency(string $currency): float
    {
        switch ($currency) {
            case 'USD':
                return $this->total_amount_usd;
            case 'EUR':
                return $this->total_amount_eur;
            default:
                return $this->total_amount_kes;
        }
    }

    public function getCurrencySymbol(string $currency): string
    {
        switch ($currency) {
            case 'USD':
                return '$';
            case 'EUR':
                return '€';
            default:
                return 'KES';
        }
    }

    public function wasCancelledAfterDelivery(): bool
    {
        return $this->isCancelled() && $this->delivered_at !== null;
    }
}