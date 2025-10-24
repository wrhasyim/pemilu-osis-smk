<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
// --- ▼▼▼ Import yang tidak perlu dihapus ▼▼▼ ---
// use App\Models\Vote;
// use Illuminate\Http\RedirectResponse;
// use Illuminate\Support\Facades\DB;
// --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---

class StudentViewController extends Controller
{
    /**
     * Display a listing of the resource.
     * * @param \Illuminate\Http\Request $request
     * @return \Illuminate\View\View
     */
    public function index(Request $request)
    {
        $query = User::where('role', 'voter')->orderBy('name', 'asc');

        // --- ▼▼▼ BLOK KODE INI DIHAPUS KARENA 'has_voted' TIDAK ADA ▼▼▼ ---
        // Terapkan filter berdasarkan status `has_voted`
        // if ($request->has('status') && $request->status != '') {
        //     if ($request->status == 'sudah') {
        //         $query->where('has_voted', true);
        //     } elseif ($request->status == 'belum') {
        //         $query->where('has_voted', false);
        //     }
        // }
        // --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---

        // Terapkan filter pencarian nama
        if ($request->has('search') && $request->search != '') {
            $query->where('name', 'like', '%' . $request->search . '%');
        }

        $students = $query->paginate(15)->withQueryString();

        return view('admin.students.index', compact('students'));
    }

    // --- ▼▼▼ METHOD 'resetVote' DIHAPUS KARENA BERGANTUNG PADA 'has_voted' ▼▼▼ ---
    // public function resetVote(User $student): RedirectResponse
    // {
    //     ...
    // }
    // --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---
}