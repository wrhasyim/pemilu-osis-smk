<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Terima Kasih') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-10 text-gray-900 text-center">
                    <h3 class="text-3xl font-bold text-green-600 mb-4">Terima Kasih!</h3>
                    <p class="text-lg">Anda telah berhasil menggunakan hak suara Anda.</p>
                    <p class="mt-2 text-gray-600">Partisipasi Anda sangat berarti untuk kemajuan sekolah.</p>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>