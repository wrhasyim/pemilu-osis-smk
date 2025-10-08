<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class HasNotVoted
{
    public function handle(Request $request, Closure $next): Response
    {
        if (auth()->user()->has_voted) {
            // Jika sudah vote, redirect ke halaman terima kasih
            return redirect()->route('vote.thanks');
        }
        return $next($request);
    }
}