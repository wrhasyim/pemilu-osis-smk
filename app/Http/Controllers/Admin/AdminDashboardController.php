<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Candidate;
use App\Models\User;
use App\Models\Vote;
// --- ▼▼▼ TAMBAHKAN BARIS INI ▼▼▼ ---
use App\Models\ElectionPeriod;
// --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---

class AdminDashboardController extends Controller
{
    public function index()
    {
        // --- ▼▼▼ LOGIKA DIGANTI TOTAL UNTUK MENGGUNAKAN PERIODE AKTIF ▼▼▼ ---
        
        // 1. Dapatkan periode yang sedang aktif
        $activePeriod = ElectionPeriod::where('is_active', true)->first();

        // 2. Jika tidak ada periode aktif, kirim data kosong ke dashboard
        if (!$activePeriod) {
            return view('admin.dashboard', [
                'totalVoters' => 0,
                'votesCasted' => 0,
                'turnoutPercentage' => 0,
                'chartLabels' => [],
                'chartData' => [],
                'activePeriodId' => null, // Kirim null jika tidak ada periode
            ]);
        }

        // 3. Hitung statistik HANYA untuk periode aktif
        $totalVoters = $activePeriod->users()->count();
        $votesCasted = $activePeriod->votes()->count();
        $turnoutPercentage = $totalVoters > 0 ? round(($votesCasted / $totalVoters) * 100, 2) : 0;

        // 4. Ambil kandidat HANYA dari periode aktif
        $candidates = $activePeriod->candidates()->withCount('votes')->get();

        $chartLabels = $candidates->pluck('name');
        $chartData = $candidates->pluck('votes_count');

        return view('admin.dashboard', compact(
            'totalVoters',
            'votesCasted',
            'turnoutPercentage',
            'chartLabels',
            'chartData',
            'activePeriod' // Kirim objek utuh, kita bisa ambil ID-nya di view
        ));
        // --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---
    }
}