@extends('layouts.admin')

@section('content')
    
    <div class="p-4 sm:p-6 lg:p-8">
        <div class="flex flex-col sm:flex-row sm:justify-between sm:items-center mb-8">
            <div>
                <h2 class="text-3xl font-bold text-gray-800">Dashboard Pemilu</h2>
                {{-- Tambahkan indikator REALTIME --}}
                <p class="text-gray-600 mt-1 flex items-center space-x-2">
                    <span class="relative flex h-3 w-3">
                      <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-green-400 opacity-75"></span>
                      <span class="relative inline-flex rounded-full h-3 w-3 bg-green-500"></span>
                    </span>
                    <span>Mendengarkan update secara real-time...</span>
                </p>
            </div>
            <div class="text-sm text-gray-500 mt-2 sm:mt-0">
                Terakhir diperbarui: <span id="last-updated" class="font-semibold">{{ now()->format('d M Y, H:i:s') }}</span>
            </div>
        </div>

        {{-- Grid Statistik --}}
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
            {{-- Total Pemilih --}}
            <div class="bg-white p-6 rounded-lg shadow-md flex items-center gap-6">
                <div class="bg-blue-100 p-4 rounded-full">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-blue-500" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" /></svg>
                </div>
                <div>
                    <h3 class="text-gray-500 text-sm font-semibold uppercase">Total Pemilih</h3>
                    {{-- ▼▼▼ TAMBAHKAN ID ▼▼▼ --}}
                    <p class="text-3xl font-bold text-gray-800" id="total-voters">{{ $totalVoters }}</p>
                </div>
            </div>
            {{-- Suara Masuk --}}
            <div class="bg-white p-6 rounded-lg shadow-md flex items-center gap-6">
                <div class="bg-green-100 p-4 rounded-full">
                     <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-green-500" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" /></svg>
                </div>
                <div>
                    <h3 class="text-gray-500 text-sm font-semibold uppercase">Suara Masuk</h3>
                    {{-- ▼▼▼ TAMBAHKAN ID ▼▼▼ --}}
                    <p class="text-3xl font-bold text-gray-800" id="votes-casted">{{ $votesCasted }}</p>
                </div>
            </div>
            {{-- Partisipasi --}}
            <div class="bg-white p-6 rounded-lg shadow-md flex items-center gap-6">
                <div class="bg-yellow-100 p-4 rounded-full">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-yellow-500" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6" /></svg>
                </div>
                <div>
                    <h3 class="text-gray-500 text-sm font-semibold uppercase">Partisipasi</h3>
                    {{-- ▼▼▼ TAMBAHKAN ID ▼▼▼ --}}
                    <p class="text-3xl font-bold text-gray-800" id="turnout-percentage">{{ $turnoutPercentage }}%</p>
                </div>
            </div>
        </div>

        {{-- Wadah Grafik --}}
        <div class="bg-white p-6 rounded-lg shadow-md">
            <h3 class="text-xl font-bold text-gray-800 mb-4">Grafik Perolehan Suara</h3>
            <div class="h-[450px]">
                <canvas id="voteChart"></canvas>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.2.0/dist/chartjs-plugin-datalabels.min.js"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            Chart.register(ChartDataLabels);

            const ctx = document.getElementById('voteChart').getContext('2d');
            const chartLabels = @json($chartLabels);
            const chartData = @json($chartData);
            const modernColors = [
                'rgba(59, 130, 246, 0.7)',  // blue-500
                'rgba(239, 68, 68, 0.7)',   // red-500
                'rgba(249, 115, 22, 0.7)', // orange-500
                'rgba(34, 197, 94, 0.7)',   // green-500
                'rgba(168, 85, 247, 0.7)'   // purple-500
            ];
            const backgroundColors = chartData.map((_, i) => modernColors[i % modernColors.length]);
            const borderColors = backgroundColors.map(color => color.replace('0.7', '1'));

            // --- ▼▼▼ SIMPAN CHART KE VARIABEL GLOBAL `voteChart` ▼▼▼ ---
            window.voteChart = new Chart(ctx, {
            // --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---
                type: 'bar',
                data: {
                    labels: chartLabels,
                    datasets: [{
                        label: 'Jumlah Suara',
                        data: chartData,
                        backgroundColor: backgroundColors,
                        borderColor: borderColors,
                        borderWidth: 1,
                        borderRadius: 6,
                        borderSkipped: false,
                    }]
                },
                options: {
                    indexAxis: 'y',
                    responsive: true,
                    maintainAspectRatio: false,
                    // ... (options lainnya sama seperti sebelumnya) ...
                    scales: {
                        x: { beginAtZero: true, grid: { display: true, color: '#e5e7eb' }, ticks: { stepSize: 1, font: { size: 12, family: 'Figtree, sans-serif' }, color: '#6b7280' } },
                        y: { grid: { display: false }, ticks: { font: { size: 12, family: 'Figtree, sans-serif' }, color: '#374151' } }
                    },
                    plugins: {
                        legend: { display: false },
                        tooltip: { backgroundColor: 'rgba(17, 24, 39, 0.8)', titleFont: { size: 14, family: 'Figtree, sans-serif' }, bodyFont: { size: 12, family: 'Figtree, sans-serif' }, padding: 12, boxPadding: 4, callbacks: { label: function(context) { return ` ${context.dataset.label}: ${context.parsed.x} Suara`; } } },
                        datalabELS: { anchor: 'end', align: 'end', color: '#4b5563', font: { weight: 'bold', size: 14 }, formatter: (value) => { return value > 0 ? value : ''; }, offset: 8 }
                    }
                }
            });

            // --- ▼▼▼ TAMBAHKAN BLOK LARAVEL ECHO DI SINI ▼▼▼ ---
            
            // Cek jika ada periode aktif yang dikirim dari controller
            @if(isset($activePeriod))
                console.log('Mendengarkan di channel: dashboard.{{ $activePeriod->id }}');

                Echo.private('dashboard.{{ $activePeriod->id }}')
                    .listen('VoteCasted', (e) => {
                        console.log('Event diterima!', e);
                        
                        // 1. Update Statistik Angka
                        document.getElementById('total-voters').innerText = e.totalVoters;
                        document.getElementById('votes-casted').innerText = e.votesCasted;
                        document.getElementById('turnout-percentage').innerText = e.turnoutPercentage + '%';
                        
                        // 2. Update Waktu
                        document.getElementById('last-updated').innerText = new Date().toLocaleTimeString('id-ID', {
                            day: '2-digit', month: 'short', year: 'numeric', hour: '2-digit', minute: '2-digit', second: '2-digit'
                        });

                        // 3. Update Chart
                        if(window.voteChart) {
                            window.voteChart.data.labels = e.chartLabels;
                            window.voteChart.data.datasets[0].data = e.chartData;
                            
                            // Perbarui juga warna jika jumlah kandidat berubah
                            const newBgColors = e.chartData.map((_, i) => modernColors[i % modernColors.length]);
                            window.voteChart.data.datasets[0].backgroundColor = newBgColors;
                            window.voteChart.data.datasets[0].borderColor = newBgColors.map(color => color.replace('0.7', '1'));
                            
                            window.voteChart.update();
                        }
                    });
            @else
                console.log('Tidak ada periode aktif untuk didengarkan.');
            @endif
            // --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---
        });
    </script>
@endpush