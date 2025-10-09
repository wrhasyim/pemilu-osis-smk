<?php

namespace App\Http\Controllers;

use App\Models\Candidate;
use App\Models\User;
use App\Models\Vote;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class VoteController extends Controller
{
    /**
     * Menampilkan halaman pemilihan kandidat.
     */
    public function create()
    {
        $candidates = Candidate::all();
        return view('vote.create', compact('candidates'));
    }

    /**
     * Menyimpan suara.
     */
    public function store(Request $request)
    {
        
        $request->validate(['candidate_id' => 'required|exists:candidates,id']);

        $user = Auth::user();

        // Simpan suara dan update status user
        DB::transaction(function () use ($user, $request) {
            Vote::create(['user_id' => $user->id, 'candidate_id' => $request->candidate_id]);
            $user->has_voted = true;
            $user->save();
        });
    
        // Logout pengguna
        Auth::logout();
        
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        // Redirect ke halaman "Terima Kasih"
        return redirect()->route('vote.thanks');
    }
}