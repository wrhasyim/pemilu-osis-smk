@extends('layouts.admin')

@section('content')
<div class="bg-white p-8 rounded-lg shadow-lg max-w-2xl mx-auto">
    <h2 class="text-2xl font-bold mb-6">Impor Data Siswa (Massal)</h2>

    <div class="mb-4 p-4 bg-blue-100 border-l-4 border-blue-500 text-blue-700">
        <p class="font-bold">Petunjuk:</p>
        <ul class="list-disc list-inside">
            <li>Siapkan file Excel (.xlsx) atau CSV.</li>
            <li>Pastikan file memiliki kolom dengan header <strong>nama</strong> dan <strong>nis</strong>.</li>
            <li>Password default untuk semua siswa adalah: <strong>12345678</strong></li>
        </ul>
    </div>
    
    @if ($errors->any())
        <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mb-4">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif


    <form action="{{ route('admin.students.import.store') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="mb-4">
            <label for="file" class="block text-gray-700 font-bold mb-2">Pilih File Excel/CSV</label>
            <input type="file" name="file" id="file" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" required>
        </div>

        <div class="flex items-center justify-between">
            <button type="submit" class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                Upload dan Impor
            </button>
            <a href="{{ route('admin.candidates.index') }}" class="inline-block align-baseline font-bold text-sm text-blue-500 hover:text-blue-800">
                Batal
            </a>
        </div>
    </form>
</div>
@endsection