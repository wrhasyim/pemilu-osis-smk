<?php
// database/migrations/xxxx_xx_xx_xxxxxx_drop_has_voted_from_users_table.php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('users', function (Blueprint $table) {
            // Cek dulu apakah kolomnya ada, untuk menghindari error
            if (Schema::hasColumn('users', 'has_voted')) {
                $table->dropColumn('has_voted');
            }
        });
    }

    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            // Jika di-rollback, tambahkan kembali kolomnya
            $table->boolean('has_voted')->default(false)->after('class'); 
        });
    }
};