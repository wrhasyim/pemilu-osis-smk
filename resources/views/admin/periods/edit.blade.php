@extends('layouts.admin')

@section('content')
<div class="p-4 sm:p-6 lg:p-8">
    <div class="max-w-2xl mx-auto">
        <h2 class="text-3xl font-bold text-gray-800 mb-8">Edit Periode: {{ $period->name }}</h2>

        <form action="{{ route('admin.periods.update', $period) }}" method="POST" class="bg-white p-8 rounded-lg shadow-md space-y-6">
            @csrf
            @method('PUT')

            <div>
                <label for="name" class="block text-sm font-medium text-gray-700">Nama Periode</label>
                <input type="text" name="name" id="name" value="{{ old('name', $period->name) }}" required class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" placeholder="Contoh: Pemilu OSIS 2025">
                @error('name')
                    <p class="mt-2 text-sm text-red-600">{{ $message }}</p>
                @enderror
            </div>

            <div>
                <label for="start_datetime" class="block text-sm font-medium text-gray-700">Waktu Mulai</label>
                <input type="datetime-local" name="start_datetime" id="start_datetime" value="{{ old('start_datetime', $period->start_datetime->format('Y-m-d\TH:i')) }}" required class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                @error('start_datetime')
                    <p class="mt-2 text-sm text-red-600">{{ $message }}</p>
                @enderror
            </div>

            <div>
                <label for="end_datetime" class="block text-sm font-medium text-gray-700">Waktu Selesai</label>
                <input type="datetime-local" name="end_datetime" id="end_datetime" value="{{ old('end_datetime', $period->end_datetime->format('Y-m-d\TH:i')) }}" required class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                @error('end_datetime')
                    <p class="mt-2 text-sm text-red-600">{{ $message }}</p>
                @enderror
            </div>

            <div class="flex justify-end space-x-4">
                <a href="{{ route('admin.periods.index') }}" class="inline-flex items-center px-4 py-2 bg-white border border-gray-300 rounded-md font-semibold text-xs text-gray-700 uppercase tracking-widest shadow-sm hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 disabled:opacity-25 transition ease-in-out duration-150">
                    Batal
                </a>
                <button type="submit" class="inline-flex items-center px-4 py-2 bg-indigo-600 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-indigo-700 active:bg-indigo-900 focus:outline-none focus:border-indigo-900 focus:ring ring-indigo-300 disabled:opacity-25 transition ease-in-out duration-150">
                    Update
                </button>
            </div>
        </form>
    </div>
</div>
@endsection