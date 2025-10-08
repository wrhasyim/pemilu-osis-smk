@extends('layouts.admin')

@section('content')
<div class="bg-white p-8 rounded-lg shadow-lg max-w-2xl mx-auto">
    <h2 class="text-2xl font-bold mb-6">Edit Kandidat</h2>
    <form action="{{ route('admin.candidates.update', $candidate) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT')
        <div class="mb-4">
            <label for="name" class="block text-gray-700 font-bold mb-2">Nama Kandidat</label>
            <input type="text" name="name" id="name" value="{{ old('name', $candidate->name) }}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" required>
        </div>
        <div class="mb-4">
            <label for="photo" class="block text-gray-700 font-bold mb-2">Foto Kandidat (Kosongkan jika tidak diubah)</label>
            <input type="file" name="photo" id="photo" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            @if($candidate->photo)
                <img src="{{ Storage::url($candidate->photo) }}" alt="{{ $candidate->name }}" class="h-24 w-24 object-cover rounded-full mt-4">
            @endif
        </div>
        <div class="mb-4">
            <label for="vision" class="block text-gray-700 font-bold mb-2">Visi</label>
            <textarea name="vision" id="vision" rows="3" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" required>{{ old('vision', $candidate->vision) }}</textarea>
        </div>
        <div class="mb-6">
            <label for="mission" class="block text-gray-700 font-bold mb-2">Misi</label>
            <textarea name="mission" id="mission" rows="5" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" required>{{ old('mission', $candidate->mission) }}</textarea>
        </div>
        <div class="flex items-center justify-between">
            <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                Update
            </button>
            <a href="{{ route('admin.candidates.index') }}" class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800">
                Batal
            </a>
        </div>
    </form>
</div>
@endsection