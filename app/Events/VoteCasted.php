<?php

namespace App\Events;

use App\Models\ElectionPeriod;
use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;
// --- ▼▼▼ TAMBAHKAN BARIS INI ▼▼▼ ---
use Illuminate\Contracts\Queue\ShouldQueue;

// --- ▼▼▼ TAMBAHKAN 'ShouldQueue' DI SINI ▼▼▼ ---
class VoteCasted implements ShouldBroadcast, ShouldQueue
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    // Data yang akan dikirim sebagai payload
    public $totalVoters;
    public $votesCasted;
    public $turnoutPercentage;
    public $chartLabels;
    public $chartData;
    
    private $period;

    /**
     * Buat instance event baru.
     * Saat event dipanggil, kita terima $period yang aktif
     * lalu kita hitung ulang semua data dashboard.
     */
    public function __construct(ElectionPeriod $period)
    {
        $this->period = $period;

        // Hitung ulang semua statistik berdasarkan data terbaru
        $totalVoters = $period->users()->count();
        $votesCasted = $period->votes()->count();
        $candidates = $period->candidates()->withCount('votes')->get();

        $this->totalVoters = $totalVoters;
        $this->votesCasted = $votesCasted;
        $this->turnoutPercentage = $totalVoters > 0 ? round(($votesCasted / $totalVoters) * 100, 2) : 0;
        $this->chartLabels = $candidates->pluck('name');
        $this->chartData = $candidates->pluck('votes_count');
    }

    /**
     * Tentukan channel mana yang akan di-broadcast.
     * Kita kirim ke channel privat 'dashboard' sesuai ID periode.
     */
    public function broadcastOn(): array
    {
        return [
            new PrivateChannel('dashboard.' . $this->period->id),
        ];
    }
}