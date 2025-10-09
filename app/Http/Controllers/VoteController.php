<?php

namespace App\Http\Controllers;

use App\Models\Candidate;
use App\Models\User;
use App\Models\Vote;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class VoteController extends Controller
{
    /**
     * Menampilkan halaman pemilihan kandidat.
     */
    public function create()
    {
        // --- PERBAIKAN DI SINI ---
        // Ambil semua data kandidat dan tampilkan view 'vote.create'
        $candidates = Candidate::all();
        return view('vote.create', compact('candidates'));
    }

    /**
     * Menyimpan suara.
     */
    public function store(Request $request)
    {
        $request->validate([
            'candidate_id' => 'required|exists:candidates,id',
        ]);

        $user = Auth::user();

        try {
            DB::transaction(function () use ($user, $request) {
                // 1. Simpan suara
                Vote::create([
                    'user_id' => $user->id,
                    'candidate_id' => $request->candidate_id,
                ]);

                // 2. Update status user
                $user->has_voted = true;
                $user->save();
            });
        } catch (\Exception $e) {
            Log::error('Gagal menyimpan suara: ' . $e->getMessage());
            return redirect()->back()->with('error', 'Terjadi kesalahan. Silakan coba lagi.');
        }

        // Logout dan redirect ke halaman terima kasih
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect()->route('vote.thanks');
    }
}