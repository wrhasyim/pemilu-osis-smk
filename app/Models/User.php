<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
// --- ▼▼▼ TAMBAHKAN BARIS INI ▼▼▼ ---
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class User extends Authenticatable
{
    use HasFactory, Notifiable;

    protected $fillable = [
        'name',
        'username',
        'password',
        'class',
        'role',
        // 'has_voted' sudah dihapus, bagus!
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
            // 'has_voted' => 'boolean', // Sudah dihapus, bagus!
        ];
    }

    // --- ▼▼▼ TAMBAHKAN RELASI BARU INI ▼▼▼ ---
    /**
     * Relasi ke ElectionPeriods (Periode Pemilu)
     * Menandakan user ini terdaftar di periode mana saja.
     */
    public function electionPeriods(): BelongsToMany
    {
        return $this->belongsToMany(ElectionPeriod::class, 'election_period_user')
                    ->withPivot('has_voted') // Ambil juga status 'has_voted' dari pivot
                    ->withTimestamps();
    }
    // --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---
}