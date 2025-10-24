<?php

namespace App\Http\Middleware;

// --- ▼▼▼ UBAH/TAMBAHKAN USE STATEMENT ▼▼▼ ---
use App\Models\ElectionPeriod; // Kita butuh model Periode
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Carbon\Carbon;
// --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---

class CheckElectionSchedule
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        // --- ▼▼▼ LOGIKA DIGANTI TOTAL ▼▼▼ ---

        // 1. Cari periode pemilu yang sedang aktif
        $activePeriod = ElectionPeriod::where('is_active', true)->first();

        // 2. Jika tidak ada periode aktif, tolak akses
        if (!$activePeriod) {
            return redirect()->route('dashboard')->with('error', 'Saat ini tidak ada periode pemilihan yang aktif.');
        }

        // 3. Ambil waktu mulai dan selesai dari periode aktif
        $startTime = $activePeriod->start_datetime;
        $endTime = $activePeriod->end_datetime;
        $now = Carbon::now();

        // 4. Jika waktu belum ada (seharusnya tidak mungkin jika validasi benar)
        if (!$startTime || !$endTime) {
            return redirect()->route('dashboard')->with('error', 'Jadwal pemilihan untuk periode ini belum lengkap.');
        }

        // 5. Cek jika pemilu belum dimulai
        if ($now->isBefore($startTime)) {
            return redirect()->route('dashboard')->with('error', 'Pemilihan belum dimulai. Akan dibuka pada ' . $startTime->format('d M Y \p\u\k\u\l H:i'));
        }

        // 6. Cek jika pemilu sudah berakhir
        if ($now->isAfter($endTime)) {
            return redirect()->route('dashboard')->with('error', 'Pemilihan telah ditutup pada ' . $endTime->format('d M Y \p\u\k\u\l H:i'));
        }

        // 7. Jika waktu sesuai, izinkan user lanjut ke halaman voting
        return $next($request);
        // --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---
    }
}