<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RolesTableSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('roles')->insert([
            [
                'name' => 'Customer',
                'slug' => 'customer',
                'description' => 'Regular customer who can browse and place orders',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Manager',
                'slug' => 'manager',
                'description' => 'Restaurant manager who can manage orders and view reports',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'Admin',
                'slug' => 'admin',
                'description' => 'Super admin with full system access',
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);
    }
}