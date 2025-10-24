<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
        // --- ▼▼▼ PASTIKAN BARIS INI ADA ▼▼▼ ---
        channels: __DIR__.'/../routes/channels.php',
        // --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---
    )
    ->withMiddleware(function (Middleware $middleware) {
        $middleware->alias([
            'admin' => \App\Http\Middleware\IsAdmin::class,
            'voter' => \App\Http\Middleware\IsVoter::class,
            'has.not.voted' => \App\Http\Middleware\HasNotVoted::class,
            'schedule' => \App\Http\Middleware\CheckElectionSchedule::class,
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions) {
        //
    })
    // --- ▼▼▼ PASTIKAN BLOK INI ADA ▼▼▼ ---
    ->withBroadcasting(
        __DIR__.'/../routes/channels.php',
        ['prefix' => 'api', 'middleware' => ['api', 'auth:sanctum']],
    )
    // --- ▲▲▲ PERUBAHAN SELESAI ▲▲▲ ---
    ->create();