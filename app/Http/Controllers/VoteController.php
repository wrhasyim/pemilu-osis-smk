<?php

namespace App\Http\Controllers;

use App\Models\Candidate;
use App\Models\ElectionPeriod;
use App\Models\Vote;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
// --- ▼▼▼ PASTIKAN BARIS INI ADA ▼▼▼ ---
use App\Events\VoteCasted; 
// --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---

class VoteController extends Controller
{
    /**
     * Menampilkan halaman pemilihan (daftar kandidat).
     */
    public function create()
    {
        $activePeriod = ElectionPeriod::where('is_active', true)->first();
        if (!$activePeriod) {
            return view('vote.closed');
        }
        $candidates = $activePeriod->candidates()->get();
        return view('vote.create', compact('candidates'));
    }

    /**
     * Menyimpan suara pemilih.
     */
    public function store(Request $request)
    {
        $request->validate([
            'candidate_id' => 'required|exists:candidates,id',
        ]);

        $user = Auth::user();
        $candidateId = $request->input('candidate_id');
        $activePeriod = ElectionPeriod::where('is_active', true)->first();

        if (!$activePeriod) {
            return redirect()->route('dashboard')->with('error', 'Waktu pemilihan sudah habis.');
        }

        $candidateExists = $activePeriod->candidates()->where('id', $candidateId)->exists();
        if (!$candidateExists) {
            return redirect()->back()->with('error', 'Kandidat tidak valid untuk pemilihan ini.');
        }

        DB::beginTransaction();
        try {
            Vote::create([
                'user_id' => $user->id,
                'candidate_id' => $candidateId,
                'election_period_id' => $activePeriod->id,
            ]);

            $user->electionPeriods()->updateExistingPivot($activePeriod->id, [
                'has_voted' => true
            ]);

            DB::commit();

            // --- ▼▼▼ PASTIKAN BARIS INI ADA ▼▼▼ ---
            // Tembakkan event ke Reverb SETELAH data sukses disimpan
            VoteCasted::dispatch($activePeriod);
            // --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---

            return redirect()->route('vote.thanks');

        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->back()->with('error', 'Terjadi kesalahan saat menyimpan suara. Silakan coba lagi.');
        }
    }
}