<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Selamat Datang di Pemilu OSIS</title>
    <style>
        body { 
            font-family: sans-serif; 
            display: flex; 
            justify-content: center; 
            align-items: center; 
            height: 100vh; 
            background-color: #f3f4f6;
        }
        .container {
            text-align: center;
        }
        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #3b82f6;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Sistem E-Voting Pemilu Raya OSIS</h1>
        <p>Silakan login untuk menggunakan hak suara Anda.</p>
        <a href="{{ route('login') }}" class="btn">Login Sekarang</a>
    </div>
</body>
</html>