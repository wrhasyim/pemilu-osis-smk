<?php

namespace App\Http\Controllers;

use App\Models\Candidate;
use App\Models\Vote;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class VoteController extends Controller
{
    // Menampilkan halaman vote
    public function create()
    {
        $candidates = Candidate::all();
        return view('vote.create', compact('candidates'));
    }

    // Menyimpan suara
    public function store(Request $request)
    {
        $request->validate([
            'candidate_id' => 'required|exists:candidates,id',
        ]);

        $user = auth()->user();

        // Gunakan DB Transaction untuk memastikan integritas data
        // Jika salah satu query gagal, semua akan dibatalkan (rollback)
        try {
            DB::transaction(function () use ($user, $request) {
                // 1. Simpan suara
                Vote::create([
                    'user_id' => $user->id,
                    'candidate_id' => $request->candidate_id,
                ]);

                // 2. Update status user menjadi sudah memilih
                $user->has_voted = true;
                $user->save();
            });
        } catch (\Exception $e) {
            // Jika terjadi error, catat di log dan kembalikan dengan pesan error
            Log::error('Gagal menyimpan suara: ' . $e->getMessage());
            return redirect()->back()->with('error', 'Terjadi kesalahan. Silakan coba lagi.');
        }

        return redirect()->route('vote.thanks');
    }
}