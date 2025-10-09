<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>{{ config('app.name', 'Laravel') }} - Login</title>
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />
        @vite(['resources/css/app.css', 'resources/js/app.js'])
    </head>
    <body class="font-sans text-gray-900 antialiased">
        <div class="min-h-screen bg-gray-100 text-gray-800 flex justify-center items-center">
            <div class="w-full h-screen"> 
                <div class="bg-white shadow-2xl h-full grid md:grid-cols-2 overflow-hidden">
                    
                    {{-- Kolom Kiri: Branding & Informasi --}}
                    <div class="p-8 md:p-12 bg-gradient-to-br from-blue-600 to-indigo-700 text-white flex flex-col justify-center items-center text-center">
                        <img src="{{ asset('images/logo-sekolah.png') }}" alt="Logo Sekolah" class="w-28 h-28 mb-6">
                        <h1 class="text-3xl font-bold mb-3">E-Voting Pemilu OSIS</h1>
                        <p class="text-indigo-200">SMK TARUNA KARYA MANDIRI</p>
                        <hr class="w-1/3 my-6 border-indigo-400">
                        <p class="text-indigo-200">Gunakan hak pilih Anda untuk masa depan OSIS yang lebih baik.</p>
                    </div>

                    {{-- Kolom Kanan: Form Login --}}
                    <div class="p-8 md:p-12 flex flex-col justify-center">
                        <div class="w-full max-w-md mx-auto">
                            <div class="text-left mb-8">
                                <h2 class="text-2xl font-bold text-gray-800">Masuk Akun</h2>
                                <p class="text-gray-600">Silakan gunakan Username dan password Anda.</p>
                            </div>
                            
                            <x-auth-session-status class="mb-4" :status="session('status')" />

                            <form method="POST" action="{{ route('login') }}">
                                @csrf

                                <div>
                                    <x-input-label for="username" :value="__('Username')" class="font-semibold" />
                                    <x-text-input id="username" class="block mt-1 w-full" type="text" name="username" :value="old('username')" required autofocus autocomplete="username" placeholder="Masukkan Username Anda" />
                                    <x-input-error :messages="$errors->get('username')" class="mt-2" />
                                 astounding</div>

                                <div class="mt-4">
                                    <x-input-label for="password" :value="__('Password')" class="font-semibold" />
                                    <x-text-input id="password" class="block mt-1 w-full"
                                                    type="password"
                                                    name="password"
                                                    required autocomplete="current-password"
                                                    placeholder="********" />
                                    <x-input-error :messages="$errors->get('password')" class="mt-2" />
                                 astounding</div>

                                <div class="flex items-center justify-end mt-6">
                                    <x-primary-button class="w-full text-center justify-center py-3 text-base">
                                        {{ __('MASUK') }}
                                    </x-primary-button>
                                 astounding</div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>