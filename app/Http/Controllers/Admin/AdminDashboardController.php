<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Candidate;
use App\Models\User;
use App\Models\Vote;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AdminDashboardController extends Controller
{
    public function index()
    {
        // 1. Menghitung total kandidat
        $totalCandidates = Candidate::count();

        // 2. Menghitung total pemilih (siswa)
        $totalVoters = User::where('role', 'voter')->count();

        // 3. Menghitung jumlah pemilih yang sudah voting
        $votersWhoVoted = User::where('role', 'voter')->where('has_voted', true)->count();

        // 4. Menghitung persentase partisipasi (turnout)
        $voterTurnout = ($totalVoters > 0) ? ($votersWhoVoted / $totalVoters) * 100 : 0;

        // 5. Menghitung perolehan suara untuk setiap kandidat
        $voteCounts = Vote::select('candidate_id', DB::raw('count(*) as votes'))
            ->groupBy('candidate_id')
            ->orderBy('votes', 'desc')
            ->with('candidate') // Eager load data kandidat
            ->get();

        // Kirim semua data ke view
        return view('admin.dashboard', compact(
            'totalCandidates',
            'totalVoters',
            'votersWhoVoted',
            'voterTurnout',
            'voteCounts'
        ));
    }
}