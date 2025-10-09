<x-guest-layout>
    <div class="min-h-screen flex flex-col sm:justify-center items-center pt-6 sm:pt-0 bg-gray-100">
        <div class="w-full sm:max-w-md mt-6 px-6 py-4 bg-white shadow-md overflow-hidden sm:rounded-lg text-center">
            <h2 class="text-2xl font-bold mb-4">Terima Kasih!</h2>
            <p class="mb-6">Suara Anda telah berhasil direkam. Partisipasi Anda sangat berarti untuk masa depan OSIS.</p>

            {{-- Pesan hitung mundur --}}
            <p class="text-sm text-gray-600">
                Anda akan diarahkan kembali ke halaman login dalam 
                <span id="countdown" class="font-bold">5</span> detik...
            </p>
        </div>
    </div>

    {{-- Skrip untuk pengalihan otomatis --}}
    <script>
        (function() {
            // Waktu dalam detik sebelum redirect
            let seconds = 5; 

            const countdownElement = document.getElementById('countdown');

            // Atur timer untuk redirect setelah 'seconds' detik
            setTimeout(function() {
                window.location.href = "{{ route('login') }}";
            }, seconds * 1000);

            // Atur interval untuk memperbarui tampilan hitung mundur setiap detik
            setInterval(function() {
                seconds--;
                if (seconds >= 0) {
                    countdownElement.textContent = seconds;
                }
            }, 1000);
        })();
    </script>
</x-guest-layout>