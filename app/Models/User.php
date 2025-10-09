<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Relations\HasOne; // <-- 1. Tambahkan baris ini

class User extends Authenticatable
{
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'nis',
        'password',
        'class',
        'role'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    // --- PERUBAHAN UTAMA DIMULAI DI SINI ---

    /**
     * 2. Definisikan relasi "satu-ke-satu" dengan model Vote.
     * Seorang user hanya memiliki satu suara.
     */
    public function vote(): HasOne
    {
        return $this->hasOne(Vote::class);
    }

    /**
     * 3. Buat method untuk memeriksa apakah user sudah memberikan suara.
     * Method ini akan mengembalikan true jika relasi vote ada, dan false jika tidak.
     */
    public function hasVoted(): bool
    {
        return $this->vote()->exists();
    }

    // --- PERUBAHAN SELESAI ---
}