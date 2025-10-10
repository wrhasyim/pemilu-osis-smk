@extends('layouts.admin')

@section('content')
<div class="p-4 sm:p-6 lg:p-8">
    <div class="flex flex-col sm:flex-row sm:justify-between sm:items-center mb-8">
        <h2 class="text-3xl font-bold text-gray-800">Edit Kandidat</h2>
    </div>

    <div class="bg-white p-6 rounded-lg shadow-md">
        <form action="{{ route('admin.candidates.update', $candidate->id) }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('PUT')

            {{-- Nama Kandidat --}}
            <div class="mb-6">
                <label for="name" class="block text-sm font-medium text-gray-700 mb-2">Nama Kandidat</label>
                <input type="text" name="name" id="name" value="{{ old('name', $candidate->name) }}" class="block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" required>
                @error('name')
                    <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
                @enderror
            </div>

            {{-- 🎨 FOTO KANDIDAT YANG DIPERBAIKI --}}
            <div class="mb-6">
                <label for="image" class="block text-sm font-medium text-gray-700 mb-2">Foto Kandidat (Kosongkan jika tidak diubah)</label>
                
                {{-- Menampilkan Gambar Saat Ini --}}
                @if ($candidate->image)
                    <div class="mt-2 mb-4">
                        <p class="text-sm text-gray-600 mb-2">Gambar saat ini:</p>
                        <img src="{{ Storage::url($candidate->image) }}" alt="Foto Kandidat" class="w-32 h-32 object-cover rounded-md border border-gray-200 shadow-sm">
                    </div>
                @endif

                <input type="file" name="image" id="image" class="block w-full text-sm text-gray-500 file:mr-4 file:py-2 file:px-4 file:rounded-md file:border-0 file:text-sm file:font-semibold file:bg-indigo-50 file:text-indigo-700 hover:file:bg-indigo-100">
                @error('image')
                    <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
                @enderror
            </div>
            
            {{-- Bagian Visi --}}
            <div class="mb-6">
                <label for="vision" class="block text-sm font-medium text-gray-700 mb-2">Visi</label>
                <textarea name="vision" id="vision" rows="4" class="block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" required>{{ old('vision', $candidate->vision) }}</textarea>
                @error('vision')
                    <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
                @enderror
            </div>

            {{-- Bagian Misi --}}
            <div class="mb-6">
                <label for="mission" class="block text-sm font-medium text-gray-700 mb-2">Misi</label>
                <textarea name="mission" id="mission" rows="6" class="block w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" required>{{ old('mission', $candidate->mission) }}</textarea>
                @error('mission')
                    <p class="text-red-500 text-xs mt-1">{{ $message }}</p>
                @enderror
            </div>

            <div class="flex justify-end gap-4 mt-8">
                <a href="{{ route('admin.candidates.index') }}" class="inline-flex items-center px-4 py-2 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                    Batal
                </a>
                <button type="submit" class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                    Update Kandidat
                </button>
            </div>
        </form>
    </div>
</div>
@endsection