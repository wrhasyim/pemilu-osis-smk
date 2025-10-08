<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // 1. Membuat Akun Admin
        User::create([
            'name' => 'Admin OSIS',
            'username' => 'admin', // username untuk login
            'password' => Hash::make('password'), // passwordnya: password
            'role' => 'admin',
            'has_voted' => false, // Admin tidak ikut vote
        ]);

        
    }
}