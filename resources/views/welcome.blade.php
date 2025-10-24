<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ config('app.name', 'E-Voting OSIS') }}</title>

        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600,700&display=swap" rel="stylesheet" />

        @vite(['resources/css/app.css', 'resources/js/app.js'])
    </head>
    <body class="font-sans text-gray-900 antialiased">
        
        <div class="flex min-h-screen flex-col md:flex-row">

            <div class="flex w-full flex-col justify-center items-center md:w-1/2 bg-gradient-to-br from-indigo-600 to-blue-700 p-8 text-white shadow-lg">
                <img src="{{ asset('images/logo-sekolah.png') }}" alt="Logo Sekolah" class="w-32 h-32 mb-6 rounded-full shadow-md">
                
                <h1 class="text-4xl font-bold mb-2 text-center">
                    E-Voting OSIS
                </h1>
                
                <p class="text-lg text-indigo-100 text-center">
                    Pemilihan Ketua OSIS SMK [Nama Sekolah Anda]
                </p>
                <p class="text-sm text-indigo-200 text-center mt-1">
                    Jujur, Adil, dan Transparan
                </p>
            </div>

            <div class="flex w-full flex-col justify-center items-center md:w-1/2 bg-gray-100 dark:bg-gray-900 p-8">
                
                <div class="w-full max-w-md px-8 py-10 bg-white dark:bg-gray-800 shadow-xl rounded-2xl">
                    
                    <h2 class="text-3xl font-bold text-center text-gray-800 dark:text-gray-200 mb-6">
                        Selamat Datang!
                    </h2>

                    {{-- BLOK UNTUK MENAMPILKAN INFO JADWAL/ERROR --}}
                    @if (session('error'))
                        <div class="mb-6 p-4 rounded-lg bg-yellow-50 dark:bg-gray-700 border border-yellow-300 dark:border-yellow-600">
                            <p class="text-center font-medium text-sm text-yellow-800 dark:text-yellow-300">
                                {{ session('error') }}
                            </p>
                            <p class="text-center text-xs text-gray-600 dark:text-gray-400 mt-2">
                                Silakan hubungi admin/panitia untuk informasi jadwal.
                            </p>
                        </div>
                    @else
                        <p class="text-center text-gray-600 dark:text-gray-400 mb-6">
                            Gunakan hak pilih Anda. Silakan login untuk melanjutkan.
                        </p>
                    @endif
                    {{-- AKHIR BLOK INFO/ERROR --}}


                    {{-- ▼▼▼ MODIFIKASI: LOGIKA TOMBOL DIPERBAIKI ▼▼▼ --}}
                    @if (Route::has('login'))
                        <div class="flex justify-center mt-4">
                            @auth
                                {{-- User sudah login --}}
                                @if(auth()->user()->role === 'admin')
                                    {{-- 
                                        KASUS 1: USER ADALAH ADMIN
                                        Admin selalu bisa masuk ke dashboard mereka.
                                    --}}
                                    <a href="{{ route('admin.dashboard') }}" 
                                       class="w-full inline-flex items-center justify-center px-6 py-3 bg-green-600 border border-transparent rounded-md font-semibold text-lg text-white uppercase tracking-widest hover:bg-green-500 focus:bg-green-700 active:bg-green-900 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 transition ease-in-out duration-150">
                                        Masuk ke Admin Dashboard
                                    </a>

                                @elseif(session('error'))
                                    {{-- 
                                        KASUS 2: USER ADALAH VOTER, TAPI ADA ERROR JADWAL
                                        User (voter) login tapi ditolak middleware.
                                        Tampilkan tombol LOGOUT, bukan tombol dashboard.
                                    --}}
                                    <form method="POST" action="{{ route('logout') }}" class="w-full">
                                        @csrf
                                        <button type="submit" 
                                           class="w-full inline-flex items-center justify-center px-6 py-3 bg-gray-600 border border-transparent rounded-md font-semibold text-lg text-white uppercase tracking-widest hover:bg-gray-500 focus:bg-gray-700 active:bg-gray-900 focus:outline-none focus:ring-2 focus:ring-gray-500 focus:ring-offset-2 transition ease-in-out duration-150">
                                            <svg class="w-5 h-5 mr-3" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                                                <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0013.5 3h-6a2.25 2.25 0 00-2.25 2.25v13.5A2.25 2.25 0 007.5 21h6a2.25 2.25 0 002.25-2.25V15m-3 0l-3 3m0 0l-3-3m3 3V9" />
                                            </svg>
                                            Logout
                                        </button>
                                    </form>

                                @else
                                    {{-- 
                                        KASUS 3: USER ADALAH VOTER, TIDAK ADA ERROR
                                        User (voter) login dan belum dicek middleware.
                                        Tampilkan tombol dashboard normal.
                                    --}}
                                    <a href="{{ url('/dashboard') }}" 
                                       class="w-full inline-flex items-center justify-center px-6 py-3 bg-green-600 border border-transparent rounded-md font-semibold text-lg text-white uppercase tracking-widest hover:bg-green-500 focus:bg-green-700 active:bg-green-900 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 transition ease-in-out duration-150">
                                        Masuk ke Dashboard
                                    </a>
                                @endif

                            @else
                                {{-- User belum login, tampilkan tombol login --}}
                                <a href="{{ route('login') }}" 
                                   class="w-full inline-flex items-center justify-center px-6 py-3 bg-indigo-600 border border-transparent rounded-md font-semibold text-lg text-white uppercase tracking-widest hover:bg-indigo-500 focus:bg-indigo-700 active:bg-indigo-900 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 transition ease-in-out duration-150">
                                    <svg class="w-5 h-5 mr-3" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0013.5 3h-6a2.25 2.25 0 00-2.25 2.25v13.5A2.25 2.25 0 007.5 21h6a2.25 2.25 0 002.25-2.25V15m3 0l3-3m0 0l-3-3m3 3H9" />
                                    </svg>
                                    Login Pemilih
                                </a>
                            @endauth
                        </div>
                    @endif
                    {{-- ▲▲▲ AKHIR MODIFIKASI --}}
                </div>

            </div>
        </div>

    </body>
</html>