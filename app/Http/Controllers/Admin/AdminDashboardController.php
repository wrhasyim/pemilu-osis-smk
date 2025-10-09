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
        // Menghitung total pemilih (siswa)
        $totalVoters = User::where('role', 'voter')->count();

        // Menghitung jumlah suara yang sudah masuk
        $votesCasted = Vote::count();

        // Menghitung persentase partisipasi, hindari pembagian dengan nol
        $turnoutPercentage = $totalVoters > 0 ? round(($votesCasted / $totalVoters) * 100, 2) : 0;

        // Mengambil data kandidat beserta total suara mereka
        $candidates = Candidate::withCount('votes')->orderBy('name')->get();

        // Menyiapkan data untuk grafik
        $chartLabels = $candidates->pluck('name');
        $chartData = $candidates->pluck('votes_count');

        return view('admin.dashboard', compact(
            'totalVoters',
            'votesCasted',
            'turnoutPercentage',
            'chartLabels',
            'chartData'
        ));
    }
}