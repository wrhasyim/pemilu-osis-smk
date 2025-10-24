<?php
// database/migrations/xxxx_xx_xx_xxxxxx_create_election_periods_table.php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('election_periods', function (Blueprint $table) {
            $table->id();
            $table->string('name'); // Contoh: "Pemilu OSIS 2024"
            $table->dateTime('start_datetime'); // Jadwal Mulai
            $table->dateTime('end_datetime');   // Jadwal Selesai
            $table->boolean('is_active')->default(false); // Penanda periode aktif
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('election_periods');
    }
};