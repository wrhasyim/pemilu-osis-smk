<?php

namespace App\Imports;

use App\Models\User;
// --- ▼▼▼ TAMBAHKAN BARIS INI ▼▼▼ ---
use App\Models\ElectionPeriod;
// --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
// --- ▼▼▼ TAMBAHKAN BARIS INI ▼▼▼ ---
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Events\AfterImport;
// --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---

// --- ▼▼▼ Ubah implementasi class ▼▼▼ ---
class StudentsImport implements ToModel, WithHeadingRow
{
    // --- ▼▼▼ TAMBAHKAN PROPERTI & CONSTRUCTOR ▼▼▼ ---
    protected $activePeriod;

    public function __construct(ElectionPeriod $activePeriod)
    {
        $this->activePeriod = $activePeriod;
    }
    // --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---

    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        $password = !empty($row['password']) ? $row['password'] : $row['nis'];

        // 1. Buat atau update User seperti biasa
        // Kita pakai updateOrCreate agar bisa impor berulang kali tanpa duplikat
        $user = User::updateOrCreate(
            ['username' => $row['nis']], // Cek berdasarkan NIS (username)
            [
                'name'     => $row['nama'],
                'class'    => $row['kelas'],
                'password' => Hash::make($password),
                'role'     => 'voter',
            ]
        );

        // --- ▼▼▼ TAMBAHKAN LOGIKA PIVOT ▼▼▼ ---
        // 2. Langsung daftarkan user ke periode aktif
        // Kita gunakan syncWithoutDetaching agar tidak duplikat
        // dan tidak menghapus relasi di periode lama
        $user->electionPeriods()->syncWithoutDetaching([
            $this->activePeriod->id => ['has_voted' => false] // Set default 'has_voted' ke false
        ]);
        // --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---

        return $user; // Kembalikan user yang sudah di-proses
    }
}