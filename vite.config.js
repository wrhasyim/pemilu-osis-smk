import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';

export default defineConfig({
    plugins: [
        laravel({
            input: ['resources/css/app.css', 'resources/js/app.js'],
            refresh: true,
        }),
    ],
    server: {
        host: '0.0.0.0', // <-- TAMBAHKAN BARIS INI
        hmr: {
            host: 'localhost' // Ini penting agar HMR tetap berjalan
        }
    }
});
