<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }} - Admin</title>

    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

    @vite(['resources/css/app.css', 'resources/js/app.js'])
</head>
<body class="font-sans antialiased">
    {{-- --- ▼▼▼ 1. TAMBAHKAN STATE BARU `sidebarCollapsed: false` ▼▼▼ --- --}}
    <div class="min-h-screen bg-gray-100" x-data="{ open: false, sidebarCollapsed: true }">
    {{-- --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ --- --}}
        
        {{-- --- ▼▼▼ 3. UBAH CLASS SIDEBAR AGAR REAKTIF ▼▼▼ --- --}}
        <div class="fixed inset-y-0 left-0 bg-white shadow-lg z-20 transform md:translate-x-0 transition-all duration-300 ease-in-out"
             :class="{
                'translate-x-0': open,
                '-translate-x-full': !open,
                'w-20': sidebarCollapsed,
                'w-64': !sidebarCollapsed
             }"
             @click.away="open = false">
        {{-- --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ --- --}}
            
            {{-- --- ▼▼▼ 5. BUAT LOGO DAN TEKS REAKTIF ▼▼▼ --- --}}
            <div class="p-4 flex items-center transition-all duration-300"
                 :class="sidebarCollapsed ? 'justify-center' : 'justify-between'">
                <a href="{{ route('admin.dashboard') }}" class="flex items-center space-x-2 overflow-hidden">
                    <img src="{{ asset('images/logo-sekolah.png') }}" alt="Logo" class="h-10 w-auto flex-shrink-0">
                    <span class="text-xl font-bold text-gray-800 whitespace-nowrap" x-show="!sidebarCollapsed" x-transition>Admin E-Voting</span>
                </a>
                <button class="text-gray-500 md:hidden" @click="open = false">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
                </button>
            </div>
            {{-- --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ --- --}}


            <nav class="mt-6 flex-1">
                @php
                    $navItems = [
                        ['label' => 'Dashboard', 'route' => 'admin.dashboard', 'icon' => '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 flex-shrink-0"><path stroke-linecap="round" stroke-linejoin="round" d="m2.25 12 8.954-8.955c.44-.439 1.152-.439 1.591 0L21.75 12M4.5 9.75v10.125c0 .621.504 1.125 1.125 1.125H9.75v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21h4.125c.621 0 1.125-.504 1.125-1.125V9.75M8.25 21h8.25" /></svg>'],
                        ['label' => 'Periode Pemilu', 'route' => 'admin.periods.index', 'icon' => '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 flex-shrink-0"><path stroke-linecap="round" stroke-linejoin="round" d="M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 0 1 2.25-2.25h13.5A2.25 2.25 0 0 1 21 7.5v11.25m-18 0A2.25 2.25 0 0 0 5.25 21h13.5A2.25 2.25 0 0 0 21 18.75m-18 0v-7.5A2.25 2.25 0 0 1 5.25 9h13.5A2.25 2.25 0 0 1 21 11.25v7.5" /></svg>'],
                        ['label' => 'Kandidat', 'route' => 'admin.candidates.index', 'icon' => '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 flex-shrink-0"><path stroke-linecap="round" stroke-linejoin="round" d="M18 18.72a9.094 9.094 0 0 0 3.741-.479 3 3 0 0 0-3.741-5.584M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm6 0a9 9 0 1 1-18 0 9 9 0 0 1 18 0ZM8.25 9.75A.75.75 0 0 1 9 9h6a.75.75 0 0 1 0 1.5H9a.75.75 0 0 1-.75-.75Zm.75 2.25a.75.75 0 0 0 0 1.5h3.5a.75.75 0 0 0 0-1.5h-3.5Z" /></svg>'],
                        ['label' => 'Data Pemilih', 'route' => 'admin.students.index', 'icon' => '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 flex-shrink-0"><path stroke-linecap="round" stroke-linejoin="round" d="M15 19.128a9.38 9.38 0 0 0 2.625.372 9.337 9.337 0 0 0 4.121-.952 4.125 4.125 0 0 0-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 0 1 8.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0 1 11.964-3.07M12 6.375a3.375 3.375 0 1 1-6.75 0 3.375 3.375 0 0 1 6.75 0Zm8.25 2.25a2.625 2.625 0 1 1-5.25 0 2.625 2.625 0 0 1 5.25 0Z" /></svg>'],
                        ['label' => 'Import Siswa', 'route' => 'admin.students.import.show', 'icon' => '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 flex-shrink-0"><path stroke-linecap="round" stroke-linejoin="round" d="M3 16.5v2.25A2.25 2.25 0 0 0 5.25 21h13.5A2.25 2.25 0 0 0 21 18.75V16.5m-13.5-9L12 3m0 0 4.5 4.5M12 3v13.5" /></svg>'],
                        ['label' => 'Pengaturan', 'route' => 'admin.settings.edit', 'icon' => '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 flex-shrink-0"><path stroke-linecap="round" stroke-linejoin="round" d="M10.5 6h9.75M10.5 6a1.5 1.5 0 1 1-3 0m3 0a1.5 1.5 0 1 0-3 0M3.75 6H7.5m3 12h9.75m-9.75 0a1.5 1.5 0 0 1-3 0m3 0a1.5 1.5 0 0 0-3 0m-3.75 0H7.5m9-6h3.75m-3.75 0a1.5 1.5 0 0 1-3 0m3 0a1.5 1.5 0 0 0-3 0m-9.75 0h3.75" /></svg>']
                    ];
                @endphp

                @foreach ($navItems as $item)
                    @php
                        $isActive = request()->routeIs($item['route']) || (str_ends_with($item['route'], '.index') && request()->routeIs(str_replace('.index', '.*', $item['route'])));
                        $activeClasses = 'bg-indigo-50 text-indigo-700 border-indigo-500';
                        $inactiveClasses = 'text-gray-600 hover:bg-gray-50 hover:text-gray-900 border-transparent';
                        $baseClasses = 'flex items-center space-x-3 px-4 py-3 text-sm font-medium border-l-4 transition-all duration-150 overflow-hidden'; // Tambah overflow-hidden
                    @endphp
                    {{-- --- ▼▼▼ 5. BUAT TEKS NAVIGASI REAKTIF ▼▼▼ --- --}}
                    <a href="{{ route($item['route']) }}" class="{{ $baseClasses }} {{ $isActive ? $activeClasses : $inactiveClasses }}"
                       :class="sidebarCollapsed ? 'justify-center' : ''">
                        {!! $item['icon'] !!}
                        <span class="whitespace-nowrap" x-show="!sidebarCollapsed" x-transition>{{ $item['label'] }}</span>
                    </a>
                    {{-- --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ --- --}}
                @endforeach
                
                <form method="POST" action="{{ route('logout') }}">
                    @csrf
                    {{-- --- ▼▼▼ 5. BUAT TEKS LOGOUT REAKTIF ▼▼▼ --- --}}
                    <button type="submit" class="w-full flex items-center space-x-3 text-gray-600 hover:bg-gray-50 hover:text-gray-900 rounded-md py-3 px-4 text-sm font-medium transition-all duration-150 overflow-hidden"
                            :class="sidebarCollapsed ? 'justify-center' : ''">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 flex-shrink-0"><path stroke-linecap="round" stroke-linejoin="round" d="M15.75 9V5.25A2.25 2.25 0 0 0 13.5 3h-6a2.25 2.25 0 0 0-2.25 2.25v13.5A2.25 2.25 0 0 0 7.5 21h6a2.25 2.25 0 0 0 2.25-2.25V15M12 9l-3 3m0 0 3 3m-3-3h12.75" /></svg>
                        <span class="whitespace-nowrap" x-show="!sidebarCollapsed" x-transition>{{ __('Log Out') }}</span>
                    </button>
                    {{-- --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ --- --}}
                </form>
            </nav>
        </div>

        {{-- --- ▼▼▼ 4. UBAH KONTEN WRAPPER AGAR REAKTIF ▼▼▼ --- --}}
        <div class="flex-1 flex flex-col transition-all duration-300 ease-in-out"
             :class="sidebarCollapsed ? 'md:pl-20' : 'md:pl-64'">
        {{-- --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ --- --}}
            
            <header class="bg-white shadow-sm sticky top-0 z-10">
                <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                    <div class="flex justify-between h-16">
                        
                        {{-- --- ▼▼▼ 2. TAMBAHKAN TOMBOL TOGGLE DESKTOP BARU ▼▼▼ --- --}}
                        <div class="flex items-center">
                            <div class="flex items-center md:hidden">
                                <button @click.stop="open = !open" class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 focus:text-gray-500 transition duration-150 ease-in-out">
                                    <svg class="h-6 w-6" stroke="currentColor" fill="none" viewBox="0 0 24 24">
                                        <path :class="{'hidden': open, 'inline-flex': ! open }" class="inline-flex" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
                                        <path :class="{'hidden': ! open, 'inline-flex': open }" class="hidden" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                                    </svg>
                                </button>
                            </div>
                            
                            <div class="hidden md:flex items-center">
                                <button @click.stop="sidebarCollapsed = !sidebarCollapsed" class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100 focus:outline-none focus:bg-gray-100 focus:text-gray-500 transition duration-150 ease-in-out">
                                    <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                                      <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
                                    </svg>
                                </button>
                            </div>
                        </div>
                        {{-- --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ --- --}}
                        
                        
                        <div class="flex items-center ml-auto">
                            <div class="hidden sm:flex sm:items-center sm:ml-6">
                                <x-dropdown align="right" width="48">
                                    <x-slot name="trigger">
                                        <button class="inline-flex items-center px-3 py-2 border border-transparent text-sm leading-4 font-medium rounded-md text-gray-500 bg-white hover:text-gray-700 focus:outline-none transition ease-in-out duration-150">
                                            <div>{{ Auth::user()->name }}</div>
                                            <div class="ml-1">
                                                <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                                                    <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
                                                </svg>
                                            </div>
                                        </button>
                                    </x-slot>

                                    <x-slot name="content">
                                        <x-dropdown-link :href="route('profile.edit')">
                                            {{ __('Profile') }}
                                        </x-dropdown-link>

                                        <form method="POST" action="{{ route('logout') }}">
                                            @csrf
                                            <x-dropdown-link :href="route('logout')"
                                                    onclick="event.preventDefault();
                                                                this.closest('form').submit();">
                                                {{ __('Log Out') }}
                                            </x-dropdown-link>
                                        </form>
                                    </x-slot>
                                </x-dropdown>
                            </div>
                        </div>
                    </div>
                </div>
            </header>

            <main class="flex-1">
                @if (session('success'))
                    <div class="bg-green-100 border-l-4 border-green-500 text-green-700 p-4 m-4 sm:m-6 lg:m-8 rounded-md" role="alert">
                        <p>{{ session('success') }}</p>
                    </div>
                @endif
                @if (session('error'))
                    <div class="bg-red-100 border-l-4 border-red-500 text-red-700 p-4 m-4 sm:m-6 lg:m-8 rounded-md" role="alert">
                        <p>{{ session('error') }}</p>
                    </div>
                @endif
                @if (session('info'))
                    <div class="bg-blue-100 border-l-4 border-blue-500 text-blue-700 p-4 m-4 sm:m-6 lg:m-8 rounded-md" role="alert">
                        <p>{{ session('info') }}</p>
                    </div>
                @endif

                {{-- INI ADALAH BAGIAN UTAMA TEMPAT KONTEN HALAMAN MUNCUL --}}
                @yield('content')
            </main>
        </div>
    </div>
    
    {{-- Tempat untuk script tambahan dari halaman child --}}
    @stack('scripts')
</body>
</html>