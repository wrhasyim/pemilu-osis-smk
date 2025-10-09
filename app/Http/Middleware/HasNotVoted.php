<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
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
        // --- PERBAIKAN UTAMA ---
        // Kita paksa logika untuk memeriksa kolom 'has_voted' secara eksplisit.
        // Jika statusnya TRUE, baru alihkan. Ini mencegah kesalahan interpretasi.
        if (Auth::user()->has_voted === true) {
            return redirect()->route('vote.thanks');
        }

        // Jika belum memilih, izinkan siswa melanjutkan ke halaman voting.
        return $next($request);
    }
}