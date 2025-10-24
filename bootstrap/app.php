<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
        // 👇👇👇 TAMBAHKAN ALIAS MIDDLEWARE ANDA DI SINI 👇👇👇
        $middleware->alias([
            'isAdmin' => \App\Http\Middleware\IsAdmin::class,
            'isVoter' => \App\Http\Middleware\IsVoter::class,
            'hasNotVoted' => \App\Http\Middleware\HasNotVoted::class,
            'schedule' => \App\Http\Middleware\CheckElectionSchedule::class,
        ]);

        // Anda juga bisa menambahkan middleware global, dll di sini jika perlu
    })
    ->withExceptions(function (Exceptions $exceptions) {
        //
    })->create();