@extends('layouts.admin')

@section('content')
<div class="p-4 sm:p-6 lg:p-8">
    <div class="flex flex-col sm:flex-row sm:justify-between sm:items-center mb-8">
        <h2 class="text-3xl font-bold text-gray-800">Data Pemilih</h2>
    </div>

    {{-- 🎨 BAGIAN FILTER DAN PENCARIAN YANG DIPERBARUI --}}
    <div class="bg-white p-6 rounded-lg shadow-md mb-8">
        {{-- Grid diubah dari 3 menjadi 2 kolom --}}
        <form action="{{ route('admin.students.index') }}" method="GET" class="grid grid-cols-1 md:grid-cols-2 gap-6 items-end">
            
            {{-- --- ▼▼▼ BLOK FILTER STATUS DIHAPUS TOTAL ▼▼▼ --- --}}
            {{-- --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ --- --}}

            {{-- Cari Nama --}}
            <div class="w-full">
                <label for="search" class="block text-sm font-medium text-gray-700">Cari Nama Siswa</label>
                <div class="relative mt-1">
                    <input type="text" name="search" id="search" class="block w-full pl-4 pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md shadow-sm" value="{{ request('search') }}" placeholder="Ketik nama...">
                    <button type="submit" class="absolute inset-y-0 right-0 px-4 flex items-center text-gray-400 hover:text-gray-600">
                        <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd" />
                        </svg>
                    </button>
                </div>
            </div>

            {{-- Tombol Reset --}}
            <div class="w-full md:text-right">
                 <a href="{{ route('admin.students.index') }}" class="inline-flex items-center px-4 py-2 border border-gray-300 shadow-sm text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 w-full md:w-auto justify-center">
                    Reset Filter
                </a>
            </div>
        </form>
    </div>

    {{-- 🎨 TABEL DATA PEMILIH YANG DIPERBARUI --}}
    <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">No</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nama</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Username</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Kelas</th>
                        
                        {{-- --- ▼▼▼ KOLOM STATUS & AKSI DIHAPUS TOTAL ▼▼▼ --- --}}
                        {{-- --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ --- --}}
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    @forelse ($students as $student)
                        <tr class="hover:bg-gray-50 transition duration-150">
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ $loop->iteration + $students->firstItem() - 1 }}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">{{ $student->name }}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ $student->username }}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ $student->class }}</td>

                            {{-- --- ▼▼▼ KOLOM STATUS & AKSI DIHAPUS TOTAL ▼▼▼ --- --}}
                            {{-- --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ --- --}}
                        </tr>
                    @empty
                        <tr>
                            {{-- Colspan diubah menjadi 4 (sesuai jumlah <th>) --}}
                            <td colspan="4" class="px-6 py-12 text-center text-sm text-gray-500">
                                Data tidak ditemukan.
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
        
        {{-- Link Paginasi --}}
        @if ($students->hasPages())
            <div class="p-6 bg-white border-t border-gray-200">
                {{ $students->links() }}
            </div>
        @endif
    </div>
</div>
@endsection