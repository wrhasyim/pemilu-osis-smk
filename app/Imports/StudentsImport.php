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
         $password = !empty($row['password']) ? $row['password'] : '12345678';

    return new User([
        'name'     => $row['nama'],
        'username' => $row['nis'],
        'class'    => $row['kelas'], // <-- Tambahkan ini
        'password' => Hash::make($password), // Gunakan variabel password
        'role'     => 'voter',
    ]);
    }
}