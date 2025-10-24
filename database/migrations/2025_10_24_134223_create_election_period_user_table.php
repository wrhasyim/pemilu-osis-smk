<?php
// database/migrations/xxxx_xx_xx_xxxxxx_create_election_period_user_table.php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('election_period_user', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->foreignId('election_period_id')->constrained('election_periods')->onDelete('cascade');
            $table->boolean('has_voted')->default(false);
            $table->timestamps();

            // User hanya bisa terdaftar sekali per periode
            $table->unique(['user_id', 'election_period_id']); 
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('election_period_user');
    }
};