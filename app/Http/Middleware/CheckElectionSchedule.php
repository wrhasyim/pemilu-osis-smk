<?php

namespace App\Http\Middleware;

use App\Models\Setting;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Carbon\Carbon; // Kita butuh Carbon untuk perbandingan waktu

class CheckElectionSchedule
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        // Ambil pengaturan jadwal dari database
        // Saya asumsikan key-nya adalah 'election_start' dan 'election_end'
        // berdasarkan file resources/views/admin/settings/edit.blade.php
        $startTimeString = Setting::where('key', 'election_start')->value('value');
        $endTimeString = Setting::where('key', 'election_end')->value('value');

        // Jika admin belum mengatur jadwal, tolak akses.
        if (!$startTimeString || !$endTimeString) {
            return redirect()->route('dashboard')->with('error', 'Jadwal pemilihan belum diatur oleh Admin.');
        }

        $startTime = Carbon::parse($startTimeString);
        $endTime = Carbon::parse($endTimeString);
        $now = Carbon::now();

        // Cek jika pemilu belum dimulai
        if ($now->isBefore($startTime)) {
            return redirect()->route('dashboard')->with('error', 'Pemilihan belum dimulai. Pemilihan akan dibuka pada ' . $startTime->format('d M Y \p\u\k\u\l H:i'));
        }

        // Cek jika pemilu sudah berakhir
        if ($now->isAfter($endTime)) {
            return redirect()->route('dashboard')->with('error', 'Pemilihan telah ditutup pada ' . $endTime->format('d M Y \p\u\k\u\l H:i'));
        }

        // Jika waktu sesuai, izinkan user lanjut ke halaman voting
        return $next($request);
    }
}