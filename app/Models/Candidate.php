<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
// --- ▼▼▼ TAMBAHKAN 2 BARIS INI ▼▼▼ ---
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
// --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---

class Candidate extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'vision',
        'mission',
        'photo',
        'election_period_id',
    ];

    /**
     * Relasi ke ElectionPeriod
     * Menandakan kandidat ini milik periode pemilu mana.
     */
    public function electionPeriod(): BelongsTo
    {
        return $this->belongsTo(ElectionPeriod::class);
    }

    // --- ▼▼▼ TAMBAHKAN RELASI BARU INI ▼▼▼ ---
    /**
     * Relasi ke Votes
     * Mendapatkan semua suara yang diterima oleh kandidat ini.
     */
    public function votes(): HasMany
    {
        return $this->hasMany(Vote::class);
    }
    // --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---
}