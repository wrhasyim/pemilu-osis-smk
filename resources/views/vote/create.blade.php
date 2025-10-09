<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Pemilihan Ketua OSIS SMK') }}
        </h2>
    </x-slot>

    <div class="py-12 bg-gray-50">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 md:p-8 text-gray-900 text-center">
                    <h3 class="text-3xl font-bold mb-4 text-gray-800">PILIH KANDIDAT ANDA</h3>
                    <p class="mb-10 text-gray-600">Pilihlah dengan bijak sesuai hati nurani Anda. Pilihan Anda menentukan masa depan OSIS.</p>

                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                        @forelse ($candidates as $candidate)
                            <div class="bg-white border rounded-xl shadow-lg flex flex-col items-center transition duration-300 hover:shadow-2xl hover:scale-105">
                                <div class="p-6 flex flex-col items-center w-full">
                                    <img src="{{ asset($candidate->photo) }}" alt="{{ $candidate->name }}" class="w-32 h-32 rounded-full object-cover mb-4 border-4 border-gray-100 shadow-md">
                                    <h4 class="text-2xl font-bold text-gray-800">{{ $candidate->name }}</h4>
                                </div>

                                <div class="text-left w-full px-6 pb-6 flex-grow">
                                    <div>
                                        <p class="font-bold text-gray-700">Visi:</p>
                                        {{-- PERUBAHAN ADA DI CLASS P DI BAWAH INI --}}
                                        <blockquote class="text-sm text-gray-600 mb-3 border-l-4 border-blue-200 pl-4 italic whitespace-pre-line">
                                            {{ $candidate->vision }}
                                        </blockquote>
                                    </div>
                                    <div>
                                        <p class="font-bold text-gray-700">Misi:</p>
                                        {{-- PERUBAHAN JUGA ADA DI CLASS P DI BAWAH INI --}}
                                        <blockquote class="text-sm text-gray-600 border-l-4 border-blue-200 pl-4 italic whitespace-pre-line">
                                            {{ $candidate->mission }}
                                        </blockquote>
                                    </div>
                                </div>

                                <div class="w-full p-4 bg-gray-50 rounded-b-xl">
                                    <form action="{{ route('vote.store') }}" method="POST" class="w-full" onsubmit="return confirm('Apakah Anda yakin memilih kandidat ini? Pilihan tidak dapat diubah.');">
                                        @csrf
                                        <input type="hidden" name="candidate_id" value="{{ $candidate->id }}">
                                        <button type="submit" class="w-full bg-gradient-to-r from-blue-600 to-cyan-500 hover:from-blue-700 hover:to-cyan-600 text-white font-bold py-3 px-4 rounded-lg shadow-lg transition duration-200 transform hover:scale-105">
                                            PILIH SAYA
                                        </button>
                                    </form>
                                </div>
                            </div>
                        @empty
                            <p class="col-span-3 text-center text-gray-500 py-10">Belum ada kandidat yang terdaftar.</p>
                        @endforelse
                    </div>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>