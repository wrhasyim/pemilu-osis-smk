@extends('layouts.admin')

@section('content')
<div class="bg-white p-6 rounded-lg shadow-lg">
    <div class="flex justify-between items-center mb-6">
        <h2 class="text-2xl font-bold">Daftar Kandidat</h2>
        <a href="{{ route('admin.candidates.create') }}" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
            + Tambah Kandidat
        </a>
    </div>
    <table class="min-w-full bg-white">
        <thead>
            <tr>
                <th class="py-2 px-4 border-b">Foto</th>
                <th class="py-2 px-4 border-b">Nama</th>
                <th class="py-2 px-4 border-b">Aksi</th>
            </tr>
        </thead>
        <tbody>
    @forelse($candidates as $candidate)
    <tr class="text-center">
        <td class="py-2 px-4 border-b">
            {{-- PASTIKAN BARIS INI MENGGUNAKAN Storage::url() --}}
            <img src="{{ asset('photos/' . basename($candidate->photo)) }}" alt="{{ $candidate->name }}" class="h-16 w-16 object-cover rounded-full mx-auto">
        </td>
        <td class="py-2 px-4 border-b">{{ $candidate->name }}</td>
        <td class="py-2 px-4 border-b">
            <a href="{{ route('admin.candidates.edit', $candidate) }}" class="bg-yellow-500 text-white px-3 py-1 rounded">Edit</a>
            <form action="{{ route('admin.candidates.destroy', $candidate) }}" method="POST" class="inline-block" onsubmit="return confirm('Yakin ingin menghapus?');">
                @csrf
                @method('DELETE')
                <button type="submit" class="bg-red-500 text-white px-3 py-1 rounded">Hapus</button>
            </form>
        </td>
    </tr>
    @empty
    <tr>
        <td colspan="3" class="text-center py-4">Belum ada data kandidat.</td>
    </tr>
    @endforelse
</tbody>
    </table>
</div>
@endsection