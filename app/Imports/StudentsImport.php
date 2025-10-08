<?php

namespace App\Imports;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class StudentsImport implements ToModel, WithHeadingRow
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        // Kode ini akan membaca setiap baris dari file Excel
        // dan membuat user baru
        return new User([
            'name'     => $row['nama'],
            'username' => $row['nis'],
            'password' => Hash::make('12345678'), // Password default untuk semua siswa
            'role'     => 'voter',
        ]);
    }
}