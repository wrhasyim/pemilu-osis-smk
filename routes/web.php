<?php

use App\Http\Controllers\Admin\AdminDashboardController;
use App\Http\Controllers\Admin\CandidateController;
// --- ▼▼▼ TAMBAHKAN BARIS INI ▼▼▼ ---
use App\Http\Controllers\Admin\ElectionPeriodController;
// --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---
use App\Http\Controllers\Admin\StudentImportController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\VoteController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\StudentViewController;
use App\Http\Controllers\Auth\AuthenticatedSessionController;

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
    // Rute baru untuk dashboard admin
    Route::get('/dashboard', [AdminDashboardController::class, 'index'])->name('dashboard');
    Route::get('/students', [StudentViewController::class, 'index'])->name('students.index');

    // Rute untuk CRUD Kandidat
    Route::resource('candidates', CandidateController::class);

    // --- ▼▼▼ TAMBAHKAN/MODIFIKASI BLOK INI ▼▼▼ ---
    // Rute untuk CRUD Periode Pemilu
    Route::resource('periods', ElectionPeriodController::class);
    // Rute khusus untuk mengaktifkan periode
    Route::post('periods/{period}/activate', [ElectionPeriodController::class, 'activate'])->name('periods.activate');
    // --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---

    Route::get('students/import/sample', [StudentImportController::class, 'downloadSample'])->name('students.import.sample');
    // Rute untuk Pengaturan (Akan kita hapus/ganti nanti)
    Route::get('settings', [\App\Http\Controllers\Admin\SettingController::class, 'edit'])->name('settings.edit');
    Route::put('settings', [\App\Http\Controllers\Admin\SettingController::class, 'update'])->name('settings.update');
    // Rute untuk impor siswa
    Route::get('students/import', [StudentImportController::class, 'show'])->name('students.import.show');
    Route::post('students/import', [StudentImportController::class, 'store'])->name('students.import.store');
});

// Grup khusus untuk PEMILIH (VOTER)
Route::middleware(['auth', 'isVoter'])->group(function () {
    // Halaman utama untuk pemilih (pemilihan kandidat) kita beri nama 'vote.index'
    Route::get('/dashboard', [VoteController::class, 'create'])->middleware(['hasNotVoted', 'schedule'])->name('vote.index');

    // Rute untuk proses mengirimkan suara
    Route::post('/vote', [VoteController::class, 'store'])->middleware(['hasNotVoted', 'schedule'])->name('vote.store');

    // Rute untuk halaman "Terima Kasih" setelah memilih
    Route::get('/terima-kasih', function () {
        return view('vote.thanks');
    })->name('vote.thanks');
});

// Rute ini akan dipanggil dari halaman 'terima-kasih' untuk proses logout
Route::get('/voter-logout', [AuthenticatedSessionController::class, 'voterLogout'])->name('voter.logout');


require __DIR__.'/auth.php';