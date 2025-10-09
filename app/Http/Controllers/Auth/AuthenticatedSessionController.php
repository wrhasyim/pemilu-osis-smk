<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class AuthenticatedSessionController extends Controller
{
    /**
     * Display the login view.
     */
    public function create(): View
    {
        return view('auth.login');
    }

    /**
     * Handle an incoming authentication request.
     */
    public function store(LoginRequest $request): RedirectResponse
    {
        $request->authenticate();

        $request->session()->regenerate();

        // PENAMBAHAN LOGIKA REDIRECT BERDASARKAN ROLE
        if ($request->user()->role === 'admin') {
            // Jika user adalah admin, arahkan ke dashboard admin
            return redirect()->route('admin.dashboard');
        }

        // --- PERUBAHAN UTAMA DI SINI ---
        // Jika bukan admin (adalah pemilih), arahkan ke halaman vote.index
        return redirect()->intended(route('vote.index', absolute: false));
        // --- PERUBAHAN SELESAI ---
    }

    /**
     * Destroy an authenticated session.
     */
    public function destroy(Request $request): RedirectResponse
    {
        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/');
    }
}