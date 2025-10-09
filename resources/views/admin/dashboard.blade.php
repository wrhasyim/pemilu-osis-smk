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

    {{-- Skrip untuk membuat grafik --}}
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const ctx = document.getElementById('voteChart').getContext('2d');

            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: @json($chartLabels),
                    datasets: [{
                        label: 'Jumlah Suara',
                        data: @json($chartData),
                        backgroundColor: [
                            'rgba(54, 162, 235, 0.5)',
                            'rgba(255, 99, 132, 0.5)',
                            'rgba(75, 192, 192, 0.5)',
                            'rgba(255, 206, 86, 0.5)',
                            'rgba(153, 102, 255, 0.5)',
                        ],
                        borderColor: [
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 99, 132, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(153, 102, 255, 1)',
                        ],
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true,
                            ticks: {
                                stepSize: 1 // Agar skala y menjadi 1, 2, 3, dst.
                            }
                        }
                    },
                    plugins: {
                        legend: {
                            display: false // Menyembunyikan legenda
                        }
                    }
                }
            });
        });
    </script>
@endsection