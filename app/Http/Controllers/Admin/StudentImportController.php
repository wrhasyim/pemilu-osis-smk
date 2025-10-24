<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
// --- ▼▼▼ TAMBAHKAN BARIS INI ▼▼▼ ---
use App\Models\ElectionPeriod;
use App\Imports\StudentsImport;
// --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;
use Symfony\Component\HttpFoundation\BinaryFileResponse;

class StudentImportController extends Controller
{
    public function show()
    {
        return view('admin.students.import');
    }

    public function store(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xlsx,xls',
        ]);

        try {
            // --- ▼▼▼ TAMBAHKAN LOGIKA INI ▼▼▼ ---
            // 1. Cari periode pemilu yang aktif
            $activePeriod = ElectionPeriod::where('is_active', true)->first();

            // 2. Jika tidak ada periode aktif, jangan biarkan impor
            if (!$activePeriod) {
                return redirect()->back()->with('error', 'Tidak ada periode pemilu yang aktif. Silakan aktifkan satu periode sebelum mengimpor siswa.');
            }

            // 3. Kirim $activePeriod ke dalam class Import
            Excel::import(new StudentsImport($activePeriod), $request->file('file'));
            // --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---

            return redirect()->route('admin.students.index')->with('success', 'Data siswa berhasil diimpor.');
        } catch (\Maatwebsite\Excel\Validators\ValidationException $e) {
            $failures = $e->failures();
            // ... (Handling error biarkan saja)
            return redirect()->back()->with('error', 'Terjadi kesalahan validasi saat impor.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Terjadi kesalahan: ' . $e->getMessage());
        }
    }

    public function downloadSample(): BinaryFileResponse
    {
        return response()->download(public_path('samples/sample_siswa.xlsx'));
    }
}