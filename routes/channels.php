<?php

use Illuminate\Support\Facades\Broadcast;

/*
|--------------------------------------------------------------------------
| Broadcast Channels
|--------------------------------------------------------------------------
|
| Here you may register all of the event broadcasting channels that your
| application supports. The given channel authorization callbacks are
| used to check if an authenticated user can listen to the channel.
|
*/

Broadcast::channel('App.Models.User.{id}', function ($user, $id) {
    return (int) $user->id === (int) $id;
});

// --- ▼▼▼ TAMBAHKAN CHANNEL BARU INI ▼▼▼ ---
// Channel ini akan digunakan untuk mengirim update ke dashboard
// Hanya user dengan role 'admin' yang bisa mendengarkan.
Broadcast::channel('dashboard.{periodId}', function ($user, $periodId) {
    return $user->role === 'admin';
});
// --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---