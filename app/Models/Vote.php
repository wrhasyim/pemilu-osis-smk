<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
// --- ▼▼▼ TAMBAHKAN BARIS INI ▼▼▼ ---
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Vote extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'candidate_id',
        // --- ▼▼▼ TAMBAHKAN BARIS INI ▼▼▼ ---
        'election_period_id',
        // --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function candidate()
    {
        return $this->belongsTo(Candidate::class);
    }

    // --- ▼▼▼ TAMBAHKAN RELASI BARU INI ▼▼▼ ---
    /**
     * Relasi ke ElectionPeriod
     * Menandakan suara ini milik periode pemilu mana.
     */
    public function electionPeriod(): BelongsTo
    {
        return $this->belongsTo(ElectionPeriod::class);
    }
    // --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---
}