<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
   // database/migrations/xxxx_xx_xx_xxxxxx_add_period_to_votes_table.php

public function up(): void
{
    Schema::table('votes', function (Blueprint $table) {
        $table->foreignId('election_period_id')
              ->nullable() // Boleh nullable sementara untuk data lama
              ->constrained('election_periods')
              ->onDelete('set null') // Jika periode dihapus, data vote tetap ada
              ->after('id');
    });
}

public function down(): void
{
    Schema::table('votes', function (Blueprint $table) {
        $table->dropForeign(['election_period_id']);
        $table->dropColumn('election_period_id');
    });
}
};
