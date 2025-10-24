<?php

namespace App\Http\Middleware;

use App\Models\ElectionPeriod;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Carbon\Carbon;

class CheckElectionSchedule
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        // 1. Cari periode pemilu yang sedang aktif
        $activePeriod = ElectionPeriod::where('is_active', true)->first();

        // 2. Jika tidak ada periode aktif, tolak akses
        if (!$activePeriod) {
            // --- ▼▼▼ PERUBAHAN REDIRECT ▼▼▼ ---
            // Arahkan ke halaman utama jika tidak ada periode aktif
            return redirect('/')->with('error', 'Saat ini tidak ada periode pemilihan yang aktif.');
            // --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---
        }

        // 3. Ambil waktu mulai dan selesai dari periode aktif
        $startTime = $activePeriod->start_datetime;
        $endTime = $activePeriod->end_datetime;
        $now = Carbon::now();

        // 4. Jika waktu belum ada
        if (!$startTime || !$endTime) {
            // --- ▼▼▼ PERUBAHAN REDIRECT ▼▼▼ ---
            // Arahkan ke halaman utama jika jadwal tidak lengkap
            return redirect('/')->with('error', 'Jadwal pemilihan untuk periode ini belum lengkap.');
             // --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---
        }

        // 5. Cek jika pemilu belum dimulai
        if ($now->isBefore($startTime)) {
            // --- ▼▼▼ PERUBAHAN REDIRECT ▼▼▼ ---
            // Arahkan ke halaman utama jika belum mulai
            return redirect('/')->with('error', 'Pemilihan belum dimulai. Akan dibuka pada ' . $startTime->format('d M Y \p\u\k\u\l H:i'));
            // --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---
        }

        // 6. Cek jika pemilu sudah berakhir
        if ($now->isAfter($endTime)) {
            // --- ▼▼▼ PERUBAHAN REDIRECT ▼▼▼ ---
            // Arahkan ke halaman utama jika sudah selesai
            return redirect('/')->with('error', 'Pemilihan telah ditutup pada ' . $endTime->format('d M Y \p\u\k\u\l H:i'));
            // --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---
        }

        // 7. Jika waktu sesuai, izinkan user lanjut ke halaman voting
        return $next($request);
    }
}