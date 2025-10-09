@extends('layouts.admin')

@section('content')
<div class="bg-white p-6 rounded-lg shadow-lg">
    <div class="flex justify-between items-center mb-6">
        <h2 class="text-2xl font-bold">Data Pemilih (Siswa)</h2>
        
        <form action="{{ route('admin.students.index') }}" method="GET">
            <select name="class" onchange="this.form.submit()" class="border rounded px-3 py-2">
                <option value="">Semua Kelas</option>
                @foreach($classes as $class)
                    <option value="{{ $class }}" {{ request('class') == $class ? 'selected' : '' }}>
                        {{ $class }}
                    </option>
                @endforeach
            </select>
        </form>
    </div>

    <table class="min-w-full bg-white">
        <thead class="bg-gray-100">
            <tr>
                <th class="py-2 px-4 border-b text-left">Nama</th>
                <th class="py-2 px-4 border-b text-left">Username</th>
                <th class="py-2 px-4 border-b text-left">Kelas</th>
                <th class="py-2 px-4 border-b text-center">Status Memilih</th>
            </tr>
        </thead>
        <tbody>
            @forelse($students as $student)
            <tr class="hover:bg-gray-50">
                <td class="py-2 px-4 border-b">{{ $student->name }}</td>
                {{-- Menggunakan kolom 'username' sesuai database Anda --}}
                <td class="py-2 px-4 border-b">{{ $student->username }}</td>
                <td class="py-2 px-4 border-b">{{ $student->class }}</td>
                <td class="py-2 px-4 border-b text-center">
                    {{-- Kondisi ini sekarang akan berfungsi dengan benar --}}
                    @if($student->has_voted)
                        <span class="bg-green-100 text-green-700 font-semibold px-3 py-1 rounded-full text-xs">Sudah Memilih</span>
                    @else
                        <span class="bg-red-100 text-red-700 font-semibold px-3 py-1 rounded-full text-xs">Belum Memilih</span>
                    @endif
                </td>
            </tr>
            @empty
            <tr>
                <td colspan="4" class="text-center py-4 text-gray-500">Tidak ada data siswa.</td>
            </tr>
            @endforelse
        </tbody>
    </table>

    <div class="mt-6">
        {{ $students->appends(request()->query())->links() }}
    </div>
</div>
@endsection