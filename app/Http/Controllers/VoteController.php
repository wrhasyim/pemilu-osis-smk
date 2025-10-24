<?php

namespace App\Http\Controllers;

// --- ▼▼▼ TAMBAHKAN BARIS INI ▼▼▼ ---
use App\Models\Candidate;
use App\Models\ElectionPeriod;
use App\Models\Vote;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB; // Kita butuh transaction
// --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---


class VoteController extends Controller
{
    /**
     * Menampilkan halaman pemilihan (daftar kandidat).
     */
    public function create()
    {
        // --- ▼▼▼ LOGIKA LAMA DIGANTI ▼▼▼ ---
        // 1. Cari periode pemilu yang sedang aktif
        $activePeriod = ElectionPeriod::where('is_active', true)->first();

        // 2. Jika tidak ada periode aktif, tampilkan view 'tutup'
        if (!$activePeriod) {
            return view('vote.closed'); // (Kita bisa buat view ini nanti)
        }

        // 3. Ambil kandidat HANYA dari periode yang aktif
        $candidates = $activePeriod->candidates()->get();

        return view('vote.create', compact('candidates'));
        // --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---
    }

    /**
     * Menyimpan suara pemilih.
     */
    public function store(Request $request)
    {
        $request->validate([
            'candidate_id' => 'required|exists:candidates,id',
        ]);

        // --- ▼▼▼ LOGIKA LAMA DIGANTI TOTAL ▼▼▼ ---

        // 1. Dapatkan user yang sedang login dan kandidat yang dipilih
        $user = Auth::user();
        $candidateId = $request->input('candidate_id');

        // 2. Cari periode pemilu yang sedang aktif
        $activePeriod = ElectionPeriod::where('is_active', true)->first();

        // 3. Jika tidak ada periode aktif (misal pemilu ditutup saat user mau submit)
        if (!$activePeriod) {
            return redirect()->route('dashboard')->with('error', 'Waktu pemilihan sudah habis.');
        }

        // 4. Pastikan kandidat yang dipilih ada di periode aktif (keamanan)
        $candidateExists = $activePeriod->candidates()->where('id', $candidateId)->exists();
        if (!$candidateExists) {
            return redirect()->back()->with('error', 'Kandidat tidak valid untuk pemilihan ini.');
        }

        // 5. Gunakan Transaction untuk memastikan 2 query (insert Vote + update pivot) berhasil
        DB::beginTransaction();
        try {
            // Query 1: Simpan data suara ke tabel 'votes'
            Vote::create([
                'user_id' => $user->id,
                'candidate_id' => $candidateId,
                'election_period_id' => $activePeriod->id, // PENTING!
            ]);

            // Query 2: Update status 'has_voted' di tabel pivot 'election_period_user'
            $user->electionPeriods()->updateExistingPivot($activePeriod->id, [
                'has_voted' => true
            ]);

            // Jika semua berhasil
            DB::commit();

            return redirect()->route('vote.thanks');

        } catch (\Exception $e) {
            // Jika ada error, batalkan semua
            DB::rollBack();
            return redirect()->back()->with('error', 'Terjadi kesalahan saat menyimpan suara. Silakan coba lagi.');
        }
        // --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---
    }
}