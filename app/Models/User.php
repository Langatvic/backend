<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $fillable = [
        'name',
        'email',
        'password',
        'role_id',
        'phone',
        'profile_image',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    // Relationship with Role
    public function role()
    {
        return $this->belongsTo(Role::class);
    }

    // ============ ADD THIS RELATIONSHIP ============
    public function orders()
    {
        return $this->hasMany(Order::class);
    }

    // ============ OR if you want to use a different name ============
    public function customerOrders()
    {
        return $this->hasMany(Order::class);
    }

    // Helper methods
    public function isAdmin(): bool
    {
        if ($this->relationLoaded('role') && $this->role) {
            return $this->role->slug === 'admin';
        }
        return $this->role_id === 3;
    }

    public function isManager(): bool
    {
        if ($this->relationLoaded('role') && $this->role) {
            return $this->role->slug === 'manager';
        }
        return $this->role_id === 2;
    }

    public function isCustomer(): bool
    {
        if ($this->relationLoaded('role') && $this->role) {
            return $this->role->slug === 'customer';
        }
        return $this->role_id === 1;
    }

    public function hasRole(string $roleSlug): bool
    {
        if ($this->relationLoaded('role') && $this->role) {
            return $this->role->slug === $roleSlug;
        }
        
        $roleMap = [
            1 => 'customer',
            2 => 'manager',
            3 => 'admin',
        ];
        
        return ($roleMap[$this->role_id] ?? null) === $roleSlug;
    }

     public function getRoleNameAttribute()
    {
        if ($this->relationLoaded('role') && $this->role) {
            return $this->role->slug;
        }

        $roleMap = [
            1 => 'customer',
            2 => 'manager',
            3 => 'admin',
        ];

        return $roleMap[$this->role_id] ?? 'customer';
    }
}