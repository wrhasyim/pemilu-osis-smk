<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"> <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Pemilu OSIS</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <nav class="bg-white shadow-md">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between h-16">
                <div class="flex-shrink-0 flex items-center">
                    <a href="{{ route('admin.dashboard') }}" class="text-xl font-bold">Admin Pemilu OSIS</a>
                </div>

                <div class="flex items-center space-x-6">
                    <a href="{{ route('admin.candidates.index') }}" class="text-gray-600 hover:text-gray-900 font-medium">Manajemen Kandidat</a>
                    <a href="{{ route('admin.students.import.show') }}" class="text-gray-600 hover:text-gray-900 font-medium">Impor Siswa</a>
                    <form method="POST" action="{{ route('logout') }}">
                        @csrf
                        <button type="submit" class="text-red-500 hover:text-red-700 font-medium">Logout</button>
                    </form>
                </div>
                </div>
        </div>
    </nav>
    <main class="py-10">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            @if(session('success'))
                <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4" role="alert">
                    {{ session('success') }}
                </div>
            @endif
            @yield('content')
        </div>
    </main>
</body>
</html>