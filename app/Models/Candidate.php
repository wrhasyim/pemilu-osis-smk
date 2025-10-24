<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
// --- ▼▼▼ TAMBAHKAN BARIS INI ▼▼▼ ---
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Candidate extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'vision',
        'mission',
        'photo',
        // --- ▼▼▼ TAMBAHKAN BARIS INI ▼▼▼ ---
        'election_period_id',
        // --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---
    ];

    // --- ▼▼▼ TAMBAHKAN RELASI BARU INI ▼▼▼ ---
    /**
     * Relasi ke ElectionPeriod
     * Menandakan kandidat ini milik periode pemilu mana.
     */
    public function electionPeriod(): BelongsTo
    {
        return $this->belongsTo(ElectionPeriod::class);
    }
    // --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---
}