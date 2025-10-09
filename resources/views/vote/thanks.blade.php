<x-guest-layout>
    <div class="min-h-screen flex flex-col sm:justify-center items-center pt-6 sm:pt-0 bg-gradient-to-br from-blue-50 to-indigo-100">
        <div class="w-full sm:max-w-lg mt-6 px-6 py-10 bg-white shadow-2xl overflow-hidden sm:rounded-2xl text-center">

            {{-- Logo Ceklis Hijau --}}
            <div class="mx-auto bg-green-100 rounded-full h-24 w-24 flex items-center justify-center mb-6">
                <svg class="h-16 w-16 text-green-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
                </svg>
            </div>

            <h2 class="text-3xl font-bold text-gray-800 mb-4">Terima Kasih!</h2>
            <p class="mb-8 text-gray-600 text-lg">
                Suara Anda telah berhasil direkam. Partisipasi Anda sangat berarti untuk masa depan OSIS.
            </p>

            <p class="text-sm text-gray-500">
                Anda akan diarahkan kembali ke halaman login dalam 
                <span id="countdown" class="font-bold text-gray-700">5</span> detik...
            </p>
        </div>
    </div>

    {{-- Skrip untuk pengalihan otomatis (sama seperti sebelumnya) --}}
    <script>
        (function() {
            let seconds = 5; 
            const countdownElement = document.getElementById('countdown');

            setTimeout(function() {
                window.location.href = "{{ route('login') }}";
            }, seconds * 1000);

            setInterval(function() {
                seconds--;
                if (seconds >= 0) {
                    countdownElement.textContent = seconds;
                }
            }, 1000);
        })();
    </script>
</x-guest-layout>