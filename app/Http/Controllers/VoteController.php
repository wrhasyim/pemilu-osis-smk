<?php

namespace App\Http\Controllers;

use App\Models\Vote;
use App\Models\Candidate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class VoteController extends Controller
{
    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $candidates = Candidate::all();
        return view('vote.create', compact('candidates'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'candidate_id' => 'required|exists:candidates,id',
        ]);

        $user = Auth::user();

        // 1. Simpan detail suara ke tabel 'votes'
        Vote::create([
            'user_id' => $user->id,
            'candidate_id' => $request->candidate_id,
        ]);

        // 2. PERUBAHAN UTAMA: Update status 'has_voted' di tabel 'users'
        $user->has_voted = true;
        $user->save();

        // 3. Logout pengguna
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        // 4. Redirect ke halaman terima kasih
        return redirect()->route('vote.thanks');
    }
}