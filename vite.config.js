import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';

export default defineConfig({
   server: {
        host: '0.0.0.0',
        hmr: {
<<<<<<< HEAD
            host: '192.168.46.234', // Ganti dengan IP address komputer server Anda
=======
            host: '192.168.17.250', // Ganti dengan IP address komputer server Anda
>>>>>>> 1699c595240640e860bec91c8970b19044bef930
        },
    },
    plugins: [
        laravel({
            input: ['resources/css/app.css', 'resources/js/app.js'],
            refresh: true,
        }),
    ],
});
