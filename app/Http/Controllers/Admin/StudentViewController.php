<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class StudentViewController extends Controller
{
    /**
     * Display a listing of the resource.
     * * @param \Illuminate\Http\Request $request
     * @return \Illuminate\View\View
     */
    public function index(Request $request) // ✅ PERBAIKAN: Mengubah `__invoke` menjadi `index`
    {
        $query = User::where('role', 'voter')->orderBy('name', 'asc');

        // Terapkan filter berdasarkan status `has_voted`
        if ($request->has('status') && $request->status != '') {
            if ($request->status == 'sudah') {
                $query->where('has_voted', true);
            } elseif ($request->status == 'belum') {
                $query->where('has_voted', false);
            }
        }

        // Terapkan filter pencarian nama
        if ($request->has('search') && $request->search != '') {
            $query->where('name', 'like', '%' . $request->search . '%');
        }

        $students = $query->paginate(15)->withQueryString();

        return view('admin.students.index', compact('students'));
    }
}