<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        {{-- INI ADALAH PERUBAHAN UTAMA --}}
        <meta http-equiv="refresh" content="5;url={{ route('login') }}">

        <title>{{ config('app.name', 'Laravel') }} - Terima Kasih</title>

        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

        @vite(['resources/css/app.css', 'resources/js/app.js'])
    </head>
    <body class="font-sans text-gray-900 antialiased">
        <div class="min-h-screen flex flex-col justify-center items-center bg-gradient-to-br from-blue-50 to-indigo-100 p-4">
            <div class="w-full sm:max-w-lg px-6 py-10 bg-white shadow-2xl overflow-hidden sm:rounded-2xl text-center">
                
                <div class="mx-auto bg-green-100 rounded-full h-24 w-24 flex items-center justify-center mb-6">
                    <svg class="h-16 w-16 text-green-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
                    </svg>
                </div>

                <h2 class="text-3xl font-bold text-gray-800 mb-4">Terima Kasih!</h2>
                <p class="mb-8 text-gray-600 text-lg">
                    Suara Anda telah berhasil direkam. Partisipasi Anda sangat berarti.
                </p>
                
                <p class="text-sm text-gray-500">
                    Anda akan diarahkan kembali ke halaman login dalam 
                    <span id="countdown" class="font-bold text-gray-700">5</span> detik...
                </p>
            </div>
        </div>

        {{-- Skrip ini sekarang hanya untuk visual, bukan untuk redirect --}}
        <script>
            let seconds = 5;
            const countdownElement = document.getElementById('countdown');
            if (countdownElement) {
                const countdownInterval = setInterval(function() {
                    seconds--;
                    if (seconds > 0) {
                        countdownElement.textContent = seconds;
                    } else {
                        countdownElement.textContent = 0;
                        clearInterval(countdownInterval);
                    }
                }, 1000);
            }
        </script>
    </body>
</html>