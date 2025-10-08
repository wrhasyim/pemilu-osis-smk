<x-guest-layout>
    <x-auth-session-status class="mb-4" :status="session('status')" />

    {{-- AWAL: Blok untuk Logo Sekolah & Judul --}}
    <div class="flex flex-col items-center mb-6">
        <a href="/">
            {{-- Letakkan logo Anda di folder public/images/logo-sekolah.png --}}
            <img src="{{ asset('images/logo-sekolah.png') }}" alt="Logo Sekolah" class="w-28 h-28 object-contain">
        </a>
        
        <h2 class="mt-4 text-2xl font-bold text-center text-gray-800">
            Login E-Voting
        </h2>
        <p class="text-gray-600 text-center">
            Pemilu Raya OSIS SMK Taruna Karya Mandiri
        </p>
    </div>
    {{-- AKHIR: Blok untuk Logo Sekolah & Judul --}}

    <form method="POST" action="{{ route('login') }}">
        @csrf

        <div>
            <x-input-label for="username" :value="__('Username (NIS)')" />
            <x-text-input id="username" class="block mt-1 w-full" type="text" name="username" :value="old('username')" required autofocus autocomplete="username" />
            <x-input-error :messages="$errors->get('username')" class="mt-2" />
        </div>

        <div class="mt-4">
            <x-input-label for="password" :value="__('Password')" />
            <x-text-input id="password" class="block mt-1 w-full"
                            type="password"
                            name="password"
                            required autocomplete="current-password" />
            <x-input-error :messages="$errors->get('password')" class="mt-2" />
        </div>

        <div class="block mt-4">
            <label for="remember_me" class="inline-flex items-center">
                <input id="remember_me" type="checkbox" class="rounded border-gray-300 text-indigo-600 shadow-sm focus:ring-indigo-500" name="remember">
                <span class="ms-2 text-sm text-gray-600">{{ __('Remember me') }}</span>
            </label>
        </div>

        <div class="flex items-center justify-end mt-4">
            <x-primary-button class="ms-3">
                {{ __('Log in') }}
            </x-primary-button>
        </div>
    </form>
</x-guest-layout>