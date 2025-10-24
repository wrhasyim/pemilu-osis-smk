<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ElectionPeriod;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB; // <-- PENTING untuk 'activate'

class ElectionPeriodController extends Controller
{
    /**
     * Menampilkan daftar semua periode pemilu.
     */
    public function index()
    {
        $periods = ElectionPeriod::orderBy('start_datetime', 'desc')->paginate(10);
        return view('admin.periods.index', compact('periods'));
    }

    /**
     * Menampilkan form untuk membuat periode baru.
     */
    public function create()
    {
        return view('admin.periods.create');
    }

    /**
     * Menyimpan periode baru ke database.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'start_datetime' => 'required|date',
            'end_datetime' => 'required|date|after:start_datetime',
        ]);

        ElectionPeriod::create($request->all());

        return redirect()->route('admin.periods.index')->with('success', 'Periode pemilu berhasil dibuat.');
    }

    /**
     * Menampilkan form untuk mengedit periode.
     */
    public function edit(ElectionPeriod $period)
    {
        return view('admin.periods.edit', compact('period'));
    }

    /**
     * Mengupdate data periode di database.
     */
    public function update(Request $request, ElectionPeriod $period)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'start_datetime' => 'required|date',
            'end_datetime' => 'required|date|after:start_datetime',
        ]);

        $period->update($request->all());

        return redirect()->route('admin.periods.index')->with('success', 'Periode pemilu berhasil diperbarui.');
    }

    /**
     * Menghapus periode dari database.
     */
    public function destroy(ElectionPeriod $period)
    {
        // Keamanan: Jangan hapus periode jika sudah ada kandidat atau suara
        if ($period->candidates()->exists() || $period->votes()->exists()) {
            return redirect()->route('admin.periods.index')->with('error', 'Tidak dapat menghapus periode yang sudah memiliki kandidat atau suara.');
        }

        // Keamanan: Jangan hapus periode yang sedang aktif
        if ($period->is_active) {
            return redirect()->route('admin.periods.index')->with('error', 'Tidak dapat menghapus periode yang sedang aktif.');
        }

        $period->delete();

        return redirect()->route('admin.periods.index')->with('success', 'Periode pemilu berhasil dihapus.');
    }

    /**
     * (FITUR PENTING) Mengaktifkan satu periode dan menonaktifkan yang lain.
     */
    public function activate(ElectionPeriod $period)
    {
        // Gunakan Transaction untuk memastikan tidak ada 2 periode yang aktif
        DB::transaction(function () use ($period) {
            // 1. Nonaktifkan semua periode lain
            ElectionPeriod::where('is_active', true)->update(['is_active' => false]);

            // 2. Aktifkan periode yang dipilih
            $period->update(['is_active' => true]);
        });

        return redirect()->route('admin.periods.index')->with('success', 'Periode "' . $period->name . '" berhasil diaktifkan.');
    }
}