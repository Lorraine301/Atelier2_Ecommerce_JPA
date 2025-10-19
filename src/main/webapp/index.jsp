<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Bienvenue - E-commerce</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        body {
            background: linear-gradient(135deg, #4facfe, #00f2fe);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
            text-align: center;
        }
        .container {
            background: rgba(255, 255, 255, 0.1);
            padding: 50px 40px;
            border-radius: 15px;
            backdrop-filter: blur(6px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
            width: 90%;
            max-width: 500px;
        }
        h1 {
            margin-bottom: 15px;
            font-size: 32px;
        }
        p {
            margin-bottom: 25px;
            font-size: 18px;
        }
        a {
            display: inline-block;
            padding: 12px 25px;
            background: #fff;
            color: #00b7ff;
            text-decoration: none;
            font-weight: bold;
            border-radius: 8px;
            transition: 0.3s;
        }
        a:hover {
            background: #e6f7ff;
            transform: translateY(-3px);
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Bonjour !</h1>
    <p>Bienvenue sur notre plateforme e-commerce.</p>
    <a href="accueil">Accéder au site</a>
</div>
</body>
</html>
