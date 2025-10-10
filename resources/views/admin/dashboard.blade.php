@extends('layouts.admin')

@section('content')
    {{-- Meta tag untuk refresh halaman setiap 30 detik --}}
    <meta http-equiv="refresh" content="30">

    <div class="p-6">
        <h2 class="text-3xl font-bold text-gray-800 mb-6">Dashboard Pemilu Real-time</h2>

        {{-- Grid untuk menampilkan statistik --}}
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
            <div class="bg-white p-6 rounded-lg shadow-lg">
                <h3 class="text-gray-500 text-sm font-semibold uppercase">Total Pemilih</h3>
                <p class="text-3xl font-bold text-gray-800">{{ $totalVoters }}</p>
            </div>
            <div class="bg-white p-6 rounded-lg shadow-lg">
                <h3 class="text-gray-500 text-sm font-semibold uppercase">Suara Masuk</h3>
                <p class="text-3xl font-bold text-gray-800">{{ $votesCasted }}</p>
            </div>
            <div class="bg-white p-6 rounded-lg shadow-lg">
                <h3 class="text-gray-500 text-sm font-semibold uppercase">Partisipasi</h3>
                <p class="text-3xl font-bold text-gray-800">{{ $turnoutPercentage }}%</p>
            </div>
        </div>

        {{-- Wadah untuk grafik --}}
        <div class="bg-white p-6 rounded-lg shadow-lg">
            <h3 class="text-xl font-bold text-gray-800 mb-4">Grafik Perolehan Suara</h3>
            <div style="height: 400px;">
                <canvas id="voteChart"></canvas>
            </div>
        </div>
    </div>

    {{-- Memanggil library Chart.js dari CDN --}}
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    {{-- 🎨 KODE BARU UNTUK GRAFIK YANG LEBIH MODERN --}}
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const ctx = document.getElementById('voteChart').getContext('2d');
            const chartLabels = @json($chartLabels);
            const chartData = @json($chartData);

            // Definisikan palet warna modern yang akan diulang jika kandidat banyak
            const modernColors = [
                'rgba(59, 130, 246, 0.7)',  // blue-500
                'rgba(239, 68, 68, 0.7)',   // red-500
                'rgba(249, 115, 22, 0.7)', // orange-500
                'rgba(34, 197, 94, 0.7)',   // green-500
                'rgba(168, 85, 247, 0.7)'   // purple-500
            ];

            const backgroundColors = chartData.map((_, i) => modernColors[i % modernColors.length]);
            const borderColors = backgroundColors.map(color => color.replace('0.7', '1'));

            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: chartLabels,
                    datasets: [{
                        label: 'Jumlah Suara',
                        data: chartData,
                        backgroundColor: backgroundColors,
                        borderColor: borderColors,
                        borderWidth: 1,
                        borderRadius: 6, // Sudut bar yang lebih modern
                        borderSkipped: false,
                    }]
                },
                options: {
                    indexAxis: 'y', // Mengubah menjadi grafik batang horizontal
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        x: {
                            beginAtZero: true,
                            grid: {
                                display: true,
                                color: '#e5e7eb' // Garis grid lebih soft
                            },
                            ticks: {
                                stepSize: 1, // Skala sumbu x menjadi 1, 2, 3
                                font: {
                                    size: 12,
                                    family: 'Figtree, sans-serif'
                                },
                                color: '#6b7280'
                            }
                        },
                        y: {
                            grid: {
                                display: false // Menghilangkan garis grid vertikal
                            },
                            ticks: {
                                font: {
                                    size: 12,
                                    family: 'Figtree, sans-serif'
                                },
                                color: '#374151'
                            }
                        }
                    },
                    plugins: {
                        legend: {
                            display: false // Menyembunyikan legenda
                        },
                        tooltip: {
                            backgroundColor: 'rgba(17, 24, 39, 0.8)', // bg-gray-900
                            titleFont: {
                                size: 14,
                                family: 'Figtree, sans-serif',
                            },
                            bodyFont: {
                                size: 12,
                                family: 'Figtree, sans-serif',
                            },
                            padding: 12,
                            boxPadding: 4,
                            callbacks: {
                                label: function(context) {
                                    let label = context.dataset.label || '';
                                    if (label) {
                                        label += ': ';
                                    }
                                    if (context.parsed.x !== null) {
                                        label += context.parsed.x + ' Suara';
                                    }
                                    return label;
                                }
                            }
                        }
                    }
                }
            });
        });
    </script>
@endsection