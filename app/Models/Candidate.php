<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Candidate extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'photo',
        'vision',
        'mission',
    ];

    /**
     * Mendefinisikan relasi: Satu Kandidat memiliki banyak Suara (Vote).
     */
    public function votes(): HasMany
    {
        return $this->hasMany(Vote::class);
    }
}