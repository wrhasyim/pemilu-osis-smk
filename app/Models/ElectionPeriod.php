<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class ElectionPeriod extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'start_datetime',
        'end_datetime',
        'is_active',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'start_datetime' => 'datetime',
            'end_datetime' => 'datetime',
            'is_active' => 'boolean',
        ];
    }

    /**
     * Relasi ke Users (Pemilih)
     * Menandakan pemilih mana saja yang terdaftar di periode ini.
     */
    public function users(): BelongsToMany
    {
        return $this->belongsToMany(User::class, 'election_period_user')
                    ->withPivot('has_voted') // Ambil juga status 'has_voted' dari pivot
                    ->withTimestamps();
    }

    /**
     * Relasi ke Candidates
     * Menandakan kandidat siapa saja yang ada di periode ini.
     */
    public function candidates(): HasMany
    {
        return $this->hasMany(Candidate::class);
    }

    /**
     * Relasi ke Votes
     * Menampung semua suara yang masuk di periode ini.
     */
    public function votes(): HasMany
    {
        return $this->hasMany(Vote::class);
    }
}