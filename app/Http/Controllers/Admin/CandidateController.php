<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Candidate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class CandidateController extends Controller
{
    public function index()
    {
        $candidates = Candidate::latest()->get();
        return view('admin.candidates.index', compact('candidates'));
    }

    public function create()
    {
        return view('admin.candidates.create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name'    => 'required|string|max:255',
            'vision'  => 'required|string',
            'mission' => 'required|string',
            'photo'   => 'required|image|mimes:jpeg,png,jpg,gif|max:10240', // Maks 10MB
        ]);

        // 1. Simpan file menggunakan disk 'public_direct' untuk mendapatkan nama file unik.
        $filename = $request->file('photo')->store('', 'public_direct');

        // 2. Buat path lengkap yang akan disimpan ke database.
        $path = 'photos/' . $filename;

        // 3. Masukkan path lengkap ke dalam data yang akan divalidasi.
        $validated['photo'] = $path;

        Candidate::create($validated);

        return redirect()->route('admin.candidates.index')->with('success', 'Kandidat berhasil ditambahkan.');
    }

    public function show(Candidate $candidate)
    {
        return redirect()->route('admin.candidates.index');
    }

    public function edit(Candidate $candidate)
    {
        return view('admin.candidates.edit', compact('candidate'));
    }

    public function update(Request $request, Candidate $candidate)
    {
        $validated = $request->validate([
            'name'    => 'required|string|max:255',
            'vision'  => 'required|string',
            'mission' => 'required|string',
            'photo'   => 'nullable|image|mimes:jpeg,png,jpg,gif|max:10240', // Maks 10MB
        ]);

        if ($request->hasFile('photo')) {
            // Hapus foto lama jika ada, gunakan disk 'public_direct'
            if ($candidate->photo) {
                // basename() mengambil nama file dari path (e.g., photos/file.jpg -> file.jpg)
                Storage::disk('public_direct')->delete(basename($candidate->photo));
            }

            // Simpan foto baru dengan logika yang sama seperti di method store()
            $filename = $request->file('photo')->store('', 'public_direct');
            $path = 'photos/' . $filename;
            $validated['photo'] = $path;
        }

        $candidate->update($validated);

        return redirect()->route('admin.candidates.index')->with('success', 'Data kandidat berhasil diperbarui.');
    }

    public function destroy(Candidate $candidate)
    {
        // Hapus foto dari disk 'public_direct'
        if ($candidate->photo) {
            Storage::disk('public_direct')->delete(basename($candidate->photo));
        }

        $candidate->delete();

        return redirect()->route('admin.candidates.index')->with('success', 'Kandidat berhasil dihapus.');
    }
}