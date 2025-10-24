<?php

namespace App\Http\Middleware;

// --- ▼▼▼ TAMBAHKAN BARIS INI ▼▼▼ ---
use App\Models\ElectionPeriod;
// --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class HasNotVoted
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        // --- ▼▼▼ LOGIKA LAMA DIGANTI TOTAL ▼▼▼ ---

        // 1. Dapatkan user yang sedang login
        $user = $request->user();

        // 2. Cari periode pemilu yang sedang aktif
        $activePeriod = ElectionPeriod::where('is_active', true)->first();

        // 3. Jika tidak ada periode aktif, lempar ke dashboard
        if (!$activePeriod) {
            // (Opsional: Logout agar tidak bingung)
            // auth()->logout(); 
            return redirect('/')->with('error', 'Saat ini tidak ada periode pemilihan yang aktif.');
        }

        // 4. Cek status 'has_voted' user di tabel pivot untuk periode aktif ini
        $voteStatus = $user->electionPeriods()
                           ->where('election_period_id', $activePeriod->id)
                           ->first();

        // 5. Jika user tidak terdaftar di periode ini (misal siswa baru), lempar
        if (!$voteStatus) {
            return redirect()->route('dashboard')->with('error', 'Anda tidak terdaftar sebagai pemilih di periode ini.');
        }

        // 6. Jika di pivot tercatat SUDAH MEMILIH, lempar ke halaman 'terima-kasih'
        if ($voteStatus->pivot->has_voted) {
            return redirect()->route('vote.thanks');
        }

        // 7. Jika BELUM MEMILIH, izinkan lanjut ke halaman voting
        return $next($request);
        // --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---
    }
}