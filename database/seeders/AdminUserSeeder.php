<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Role;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class AdminUserSeeder extends Seeder
{
    public function run(): void
    {
        // Get or create roles (this prevents duplicate errors)
        $adminRole = Role::firstOrCreate(
            ['slug' => 'admin'],
            [
                'name' => 'Admin',
                'description' => 'Super admin with full system access',
            ]
        );
        
        $managerRole = Role::firstOrCreate(
            ['slug' => 'manager'],
            [
                'name' => 'Manager',
                'description' => 'Restaurant manager who can manage orders and view reports',
            ]
        );
        
        $customerRole = Role::firstOrCreate(
            ['slug' => 'customer'],
            [
                'name' => 'Customer',
                'description' => 'Regular customer who can browse and place orders',
            ]
        );

        // Create Admin User
        User::updateOrCreate(
            ['email' => 'admin@restaurant.com'],
            [
                'name' => 'Super Admin',
                'password' => Hash::make('admin123'),
                'role_id' => $adminRole->id,
                'phone' => '0700000000',
            ]
        );
        
        // Create Manager User
        User::updateOrCreate(
            ['email' => 'manager@restaurant.com'],
            [
                'name' => 'Restaurant Manager',
                'password' => Hash::make('manager123'),
                'role_id' => $managerRole->id,
                'phone' => '0711111111',
            ]
        );
        
        // Create Sample Customer
        User::updateOrCreate(
            ['email' => 'customer@restaurant.com'],
            [
                'name' => 'Test Customer',
                'password' => Hash::make('customer123'),
                'role_id' => $customerRole->id,
                'phone' => '0722222222',
            ]
        );
    }
}