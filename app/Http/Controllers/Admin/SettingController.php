<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Setting;
use Illuminate\Http\Request;

class SettingController extends Controller
{
    /**
     * Show the form for editing the settings.
     */
    public function edit()
    {
        // Ambil satu-satunya baris data dari tabel settings
        $settings = Setting::first();

        return view('admin.settings.edit', compact('settings'));
    }

    /**
     * Update the settings in storage.
     */
    public function update(Request $request)
    {
        $request->validate([
            'voting_start_time' => 'required|date',
            'voting_end_time' => 'required|date|after:voting_start_time',
        ]);

        $settings = Setting::first();
        $settings->update([
            'voting_start_time' => $request->voting_start_time,
            'voting_end_time' => $request->voting_end_time,
        ]);

        return redirect()->route('admin.settings.edit')->with('success', 'Jadwal pemilihan berhasil diperbarui.');
    }
}