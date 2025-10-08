<?php

use App\Http\Controllers\Admin\CandidateController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\VoteController;
use Illuminate\Support\Facades\Route;

// Halaman utama
Route::get('/', function () {
    return view('welcome');
});

// Grup untuk semua user yang sudah login (admin dan pemilih)
Route::middleware('auth')->group(function () {
    // Rute untuk halaman profil user
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

// Grup khusus untuk ADMIN
Route::middleware(['auth', 'isAdmin'])->prefix('admin')->name('admin.')->group(function () {
    // Rute dashboard admin bisa ditambahkan di sini jika perlu
    // Route::get('/dashboard', [AdminDashboardController::class, 'index'])->name('dashboard');
    
    // Rute untuk CRUD Kandidat
    Route::resource('candidates', CandidateController::class);
});

// Grup khusus untuk PEMILIH (VOTER)
Route::middleware(['auth', 'isVoter'])->group(function () {
    // Halaman utama untuk pemilih adalah halaman vote, diakses via /dashboard
    Route::get('/dashboard', [VoteController::class, 'create'])->middleware('hasNotVoted')->name('dashboard');
    
    // Rute untuk proses mengirimkan suara
    Route::post('/vote', [VoteController::class, 'store'])->middleware('hasNotVoted')->name('vote.store');
    
    // Rute untuk halaman "Terima Kasih" setelah memilih
    Route::get('/terima-kasih', function () {
        return view('vote.thanks');
    })->name('vote.thanks');
});


require __DIR__.'/auth.php';