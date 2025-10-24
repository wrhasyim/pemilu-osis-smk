@extends('layouts.admin')

@section('content')
<div class="p-4 sm:p-6 lg:p-8">
    <div class="flex flex-col sm:flex-row sm:justify-between sm:items-center mb-8">
        <h2 class="text-3xl font-bold text-gray-800">Manajemen Periode Pemilu</h2>
        <a href="{{ route('admin.periods.create') }}" class="mt-4 sm:mt-0 inline-flex items-center px-4 py-2 bg-indigo-600 border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-indigo-700 active:bg-indigo-900 focus:outline-none focus:border-indigo-900 focus:ring ring-indigo-300 disabled:opacity-25 transition ease-in-out duration-150">
            Tambah Periode Baru
        </a>
    </div>

    <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
        <div class="overflow-x-auto">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-gray-50">
                    <tr>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Nama Periode</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Mulai</th>
                        <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Selesai</th>
                        <th scope="col" class="px-6 py-3 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                        <th scope="col" class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">Aksi</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200">
                    @forelse ($periods as $period)
                        <tr class="hover:bg-gray-50 transition duration-150">
                            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">{{ $period->name }}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ $period->start_datetime->format('d M Y, H:i') }}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ $period->end_datetime->format('d M Y, H:i') }}</td>
                            <td class="px-6 py-4 whitespace-nowrap text-center text-sm">
                                @if ($period->is_active)
                                    <span class="px-3 py-1 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">
                                        Aktif
                                    </span>
                                @else
                                    <span class="px-3 py-1 inline-flex text-xs leading-5 font-semibold rounded-full bg-gray-100 text-gray-800">
                                        Non-Aktif
                                    </span>
                                @endif
                            </td>
                            <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium space-x-2">
                                @unless ($period->is_active)
                                    <form action="{{ route('admin.periods.activate', $period) }}" method="POST" class="inline-block" onsubmit="return confirm('Aktifkan periode ini? Periode lain yang sedang aktif akan dinonaktifkan.');">
                                        @csrf
                                        <button type="submit" class="text-green-600 hover:text-green-900 focus:outline-none">Aktifkan</button>
                                    </form>
                                @endunless
                                
                                <a href="{{ route('admin.periods.edit', $period) }}" class="text-indigo-600 hover:text-indigo-900">Edit</a>
                                
                                <form action="{{ route('admin.periods.destroy', $period) }}" method="POST" class="inline-block" onsubmit="return confirm('Apakah Anda yakin ingin menghapus periode ini?');">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="text-red-600 hover:text-red-900 focus:outline-none">Hapus</button>
                                </form>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="5" class="px-6 py-12 text-center text-sm text-gray-500">
                                Belum ada periode pemilu yang dibuat.
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
        
        @if ($periods->hasPages())
            <div class="p-6 bg-white border-t border-gray-200">
                {{ $periods->links() }}
            </div>
        @endif
    </div>
</div>
@endsection