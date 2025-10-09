<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Pemilihan Ketua OSIS SMK') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900 text-center">
                    <h3 class="text-2xl font-bold mb-4">PILIH KANDIDAT ANDA</h3>
                    <p class="mb-8 text-gray-600">Pilihlah dengan bijak sesuai hati nurani Anda. Pilihan Anda menentukan masa depan OSIS.</p>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                        @forelse ($candidates as $candidate)
                            <div class="border rounded-lg p-4 shadow-lg flex flex-col items-center">
                                {{-- PERUBAHAN ADA DI BARIS INI --}}
                                <img src="{{ asset($candidate->photo) }}" alt="{{ $candidate->name }}" class="w-32 h-32 rounded-full object-cover mb-4 border-4 border-gray-200">
                                
                                <h4 class="text-xl font-bold">{{ $candidate->name }}</h4>
                                <div class="text-left mt-4 w-full px-2">
                                    <p class="font-semibold">Visi:</p>
                                    <p class="text-sm text-gray-600 mb-2">{{ $candidate->vision }}</p>
                                    <p class="font-semibold">Misi:</p>
                                    <p class="text-sm text-gray-600">{{ $candidate->mission }}</p>
                                </div>
                                <form action="{{ route('vote.store') }}" method="POST" class="mt-6 w-full" onsubmit="return confirm('Apakah Anda yakin memilih kandidat ini? Pilihan tidak dapat diubah.');">
                                    @csrf
                                    <input type="hidden" name="candidate_id" value="{{ $candidate->id }}">
                                    <button type="submit" class="w-full bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                                        PILIH SAYA
                                    </button>
                                </form>
                            </div>
                        @empty
                            <p class="col-span-3">Belum ada kandidat yang terdaftar.</p>
                        @endforelse
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>