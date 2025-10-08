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
    // Debug #1: Cek apakah ada file yang dikirim
    if (!$request->hasFile('photo')) {
        dd('Error: Tidak ada file foto yang terkirim dari form.');
    }

    // Debug #2: Cek apakah file tersebut valid (bisa dikenali sebagai file)
    if (!$request->file('photo')->isValid()) {
        dd('Error: File foto yang dikirim tidak valid atau rusak saat proses upload.');
    }

    // dd($request->all()); // Hentikan di sini untuk melihat semua data request

    // Validasi input dari form
    $validated = $request->validate([
        'name'    => 'required|string|max:255',
        'vision'  => 'required|string',
        'mission' => 'required|string',
        'photo'   => 'required|image|mimes:jpeg,png,jpg,gif|max:10240', // Wajib gambar, maks 2MB
    ]);

    // Proses upload dan simpan file foto
    // Kita tidak akan menjalankan ini dulu untuk memastikan validasi lolos
    $path = $request->file('photo')->store('public/photos');
    $validated['photo'] = $path;
    
    Candidate::create($validated);

    return redirect()->route('admin.candidates.index')->with('success', 'Kandidat berhasil ditambahkan.');
}

    public function show(Candidate $candidate)
    {
        // Biasanya tidak digunakan di admin panel, redirect ke index
        return redirect()->route('admin.candidates.index');
    }

    public function edit(Candidate $candidate)
    {
        return view('admin.candidates.edit', compact('candidate'));
    }

    public function update(Request $request, Candidate $candidate)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'vision' => 'required|string',
            'mission' => 'required|string',
            'photo' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:10240',
        ]);

        if ($request->hasFile('photo')) {
            // Hapus foto lama jika ada
            if ($candidate->photo) {
                Storage::delete($candidate->photo);
            }
            $path = $request->file('photo')->store('public/photos');
            $validated['photo'] = $path;
        }

        $candidate->update($validated);

        return redirect()->route('admin.candidates.index')->with('success', 'Data kandidat berhasil diperbarui.');
    }

    public function destroy(Candidate $candidate)
    {
        // Hapus foto dari storage
        if ($candidate->photo) {
            Storage::delete($candidate->photo);
        }
        
        $candidate->delete();

        return redirect()->route('admin.candidates.index')->with('success', 'Kandidat berhasil dihapus.');
    }
}