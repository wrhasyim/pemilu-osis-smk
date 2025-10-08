<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Vote extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'user_id',
        'candidate_id',
    ];

    /**
     * Mendefinisikan relasi: Satu Suara dimiliki oleh satu Kandidat.
     */
    public function candidate(): BelongsTo
    {
        return $this->belongsTo(Candidate::class);
    }

    /**
     * Mendefinisikan relasi: Satu Suara dimiliki oleh satu User (pemilih).
     */
    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }
}