<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Imports\StudentsImport;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;
use Maatwebsite\Excel\Concerns\FromArray;
use Maatwebsite\Excel\Concerns\WithHeadings;

// Class untuk membuat file sampel Excel
class SampleExport implements FromArray, WithHeadings
{
    public function array(): array
    {
        // Data contoh di dalam file
        return [
            ['Nama Siswa Contoh', '20250001'],
        ];
    }

    public function headings(): array
    {
        // Header kolom yang akan digunakan
        return ['nama', 'nis'];
    }
}


class StudentImportController extends Controller
{
    public function show()
    {
        return view('admin.students.import');
    }

    public function store(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xlsx,xls,csv'
        ]);

        Excel::import(new StudentsImport, $request->file('file'));

        // Diarahkan ke dashboard untuk melihat perubahan statistik
        return redirect()->route('admin.dashboard')->with('success', 'Data siswa berhasil diimpor!');
    }

    /**
     * Menangani permintaan untuk mengunduh file sampel.
     */
    public function downloadSample()
    {
        return Excel::download(new SampleExport, 'sample_siswa.xlsx');
    }
}