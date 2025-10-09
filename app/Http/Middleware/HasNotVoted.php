<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class HasNotVoted
{
    public function handle(Request $request, Closure $next): Response
    {
        // Logika final: Jika status pemilih adalah TRUE, alihkan.
        if (Auth::user()->has_voted === true) {
            return redirect()->route('vote.thanks');
        }

        // Jika FALSE, izinkan ke halaman pemilihan.
        return $next($request);
    }
}