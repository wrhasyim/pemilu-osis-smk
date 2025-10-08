<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Panggil UserSeeder yang sudah kita buat
        $this->call([
            UserSeeder::class,
            // Anda bisa menambahkan seeder lain di sini nanti, misal CandidateSeeder
        ]);
    }
}