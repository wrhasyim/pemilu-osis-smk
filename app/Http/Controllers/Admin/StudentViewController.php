<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class StudentViewController extends Controller
{
    public function index(Request $request)
    {
        // Ambil semua kelas unik dari user yang merupakan pemilih
        $classes = User::where('role', 'voter')->distinct()->pluck('class');

        // Query dasar untuk mengambil data siswa
        $query = User::where('role', 'voter')->orderBy('class')->orderBy('name');

        // Filter berdasarkan kelas jika ada input
        if ($request->has('class') && $request->class != '') {
            $query->where('class', $request->class);
        }

        // Ambil data dengan paginasi
        $students = $query->paginate(25);

        return view('admin.students.index', compact('students', 'classes'));
    }
}