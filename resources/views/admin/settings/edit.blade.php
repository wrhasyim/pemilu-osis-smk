@extends('layouts.admin')

@section('content')
    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 bg-white border-b border-gray-200">
                    <h2 class="font-semibold text-xl text-gray-800 leading-tight mb-6">
                        {{ __('Pengaturan Jadwal Pemilihan') }}
                    </h2>

                    @if (session('success'))
                        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4" role="alert">
                            <span class="block sm:inline">{{ session('success') }}</span>
                        </div>
                    @endif

                    <form method="POST" action="{{ route('admin.settings.update') }}">
                        @csrf
                        @method('PUT')

                        <div class="mb-4">
                            <label for="voting_start_time" class="block text-gray-700 text-sm font-bold mb-2">
                                Waktu Mulai Voting:
                            </label>
                            <input type="datetime-local" name="voting_start_time" id="voting_start_time"
                                   value="{{ old('voting_start_time', $settings->voting_start_time ? $settings->voting_start_time->format('Y-m-d\TH:i') : '') }}"
                                   class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline @error('voting_start_time') border-red-500 @enderror"
                                   required>
                            @error('voting_start_time')
                                <p class="text-red-500 text-xs italic mt-2">{{ $message }}</p>
                            @enderror
                        </div>

                        <div class="mb-4">
                            <label for="voting_end_time" class="block text-gray-700 text-sm font-bold mb-2">
                                Waktu Selesai Voting:
                            </label>
                            <input type="datetime-local" name="voting_end_time" id="voting_end_time"
                                   value="{{ old('voting_end_time', $settings->voting_end_time ? $settings->voting_end_time->format('Y-m-d\TH:i') : '') }}"
                                   class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline @error('voting_end_time') border-red-500 @enderror"
                                   required>
                            @error('voting_end_time')
                                <p class="text-red-500 text-xs italic mt-2">{{ $message }}</p>
                            @enderror
                        </div>

                        <div class="flex items-center justify-end">
                            <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                                Simpan Pengaturan
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection