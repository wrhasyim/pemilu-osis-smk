@extends('layouts.admin')

@section('content')
<div>
    <h2 class="text-2xl font-semibold mb-6">Dashboard Pemilu OSIS</h2>

    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
        <div class="bg-white p-6 rounded-lg shadow-md">
            <h3 class="text-gray-500 text-sm font-medium">Total Kandidat</h3>
            <p class="text-3xl font-bold mt-2">{{ $totalCandidates }}</p>
        </div>

        <div class="bg-white p-6 rounded-lg shadow-md">
            <h3 class="text-gray-500 text-sm font-medium">Total Pemilih</h3>
            <p class="text-3xl font-bold mt-2">{{ $totalVoters }}</p>
        </div>

        <div class="bg-white p-6 rounded-lg shadow-md">
            <h3 class="text-gray-500 text-sm font-medium">Suara Masuk</h3>
            <p class="text-3xl font-bold mt-2">{{ $votersWhoVoted }}</p>
        </div>

        <div class="bg-white p-6 rounded-lg shadow-md">
            <h3 class="text-gray-500 text-sm font-medium">Partisipasi Pemilih</h3>
            <p class="text-3xl font-bold mt-2">{{ number_format($voterTurnout, 2) }}%</p>
        </div>
    </div>

    <div class="bg-white p-6 rounded-lg shadow-md">
        <h3 class="text-xl font-semibold mb-4">Perolehan Suara Real-time</h3>
        <div class="space-y-4">
            @forelse ($voteCounts as $result)
                <div class="flex items-center">
                    <img src="{{ Storage::url($result->candidate->photo) }}" alt="{{ $result->candidate->name }}" class="w-12 h-12 rounded-full object-cover">
                    <div class="ml-4 flex-grow">
                        <p class="font-bold">{{ $result->candidate->name }}</p>
                        <div class="w-full bg-gray-200 rounded-full h-4 mt-1">
                            @php
                                $percentage = ($totalVoters > 0) ? ($result->votes / $votersWhoVoted) * 100 : 0;
                            @endphp
                            <div class="bg-blue-500 h-4 rounded-full" style="width: {{ $percentage }}%"></div>
                        </div>
                    </div>
                    <p class="ml-4 text-lg font-bold">{{ $result->votes }} Suara</p>
                </div>
            @empty
                <p class="text-gray-500">Belum ada suara yang masuk.</p>
            @endforelse
        </div>
    </div>
</div>
@endsection