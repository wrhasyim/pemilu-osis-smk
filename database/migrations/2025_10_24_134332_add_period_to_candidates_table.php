<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
{
    Schema::table('candidates', function (Blueprint $table) {
        $table->foreignId('election_period_id')
              ->nullable() // Boleh nullable sementara untuk data lama
              ->constrained('election_periods')
              ->onDelete('set null') // Jika periode dihapus, kandidat tidak ikut terhapus
              ->after('id');
    });
}

public function down(): void
{
    Schema::table('candidates', function (Blueprint $table) {
        $table->dropForeign(['election_period_id']);
        $table->dropColumn('election_period_id');
    });
}
};
