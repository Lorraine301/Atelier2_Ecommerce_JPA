<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil - Boutique</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            position: relative;
            overflow: hidden;
        }

        /* Éléments décoratifs de fond */
        body::before {
            content: '';
            position: absolute;
            width: 400px;
            height: 400px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            top: -100px;
            left: -100px;
            animation: float 6s ease-in-out infinite;
        }

        body::after {
            content: '';
            position: absolute;
            width: 300px;
            height: 300px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 50%;
            bottom: -50px;
            right: -50px;
            animation: float 8s ease-in-out infinite reverse;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(30px); }
        }

        .container {
            position: relative;
            z-index: 1;
            background: rgba(255, 255, 255, 0.95);
            padding: 80px 60px;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            text-align: center;
            max-width: 600px;
            backdrop-filter: blur(10px);
            animation: slideUp 0.6s ease-out;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .icon {
            font-size: 4em;
            margin-bottom: 20px;
            animation: bounce 2s ease-in-out infinite;
        }

        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-20px); }
        }

        h2 {
            font-size: 2.5em;
            margin-bottom: 15px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-weight: 700;
        }

        p {
            font-size: 1.1em;
            margin-bottom: 45px;
            color: #666;
            line-height: 1.6;
        }

        .buttons-container {
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 16px 32px;
            font-weight: 600;
            font-size: 1em;
            border: none;
            border-radius: 10px;
            text-decoration: none;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.3);
        }

        .btn-primary:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 30px rgba(102, 126, 234, 0.5);
        }

        .btn-secondary {
            background: white;
            color: #667eea;
            border: 2px solid #667eea;
            font-weight: 600;
        }

        .btn-secondary:hover {
            background: #667eea;
            color: white;
            transform: translateY(-4px);
            box-shadow: 0 12px 30px rgba(102, 126, 234, 0.3);
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            background: rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            transform: translate(-50%, -50%);
            transition: width 0.6s, height 0.6s;
        }

        .btn:active::before {
            width: 300px;
            height: 300px;
        }

        .features {
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            gap: 20px;
            margin-top: 50px;
            padding-top: 40px;
            border-top: 2px solid #f0f0f0;
        }

        .feature {
            padding: 20px;
            border-radius: 12px;
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.1) 0%, rgba(118, 75, 162, 0.1) 100%);
            transition: transform 0.3s ease;
        }

        .feature:hover {
            transform: translateY(-5px);
        }

        .feature-icon {
            font-size: 2.5em;
            margin-bottom: 10px;
        }

        .feature-text {
            font-size: 0.95em;
            color: #666;
            font-weight: 500;
        }

        @media (max-width: 768px) {
            .container {
                padding: 50px 30px;
            }

            h2 {
                font-size: 2em;
            }

            p {
                font-size: 1em;
            }

            .buttons-container {
                flex-direction: column;
                gap: 15px;
            }

            .btn {
                width: 100%;
                padding: 14px 24px;
            }

            .features {
                grid-template-columns: 1fr;
                gap: 15px;
                margin-top: 30px;
                padding-top: 30px;
            }

            .feature {
                padding: 15px;
            }

            .feature-icon {
                font-size: 2em;
            }
        }

        @media (max-width: 600px) {
            .container {
                padding: 40px 20px;
            }

            h2 {
                font-size: 1.8em;
            }

            p {
                font-size: 0.95em;
                margin-bottom: 30px;
            }

            .btn {
                padding: 12px 20px;
                font-size: 0.95em;
            }

            .features {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="icon">🛍️</div>

    <h2>Bienvenue dans notre boutique en ligne !</h2>
    <p>Découvrez une collection exclusive de produits de qualité et profitez d'une expérience d'achat agréable et sécurisée.</p>

    <div class="buttons-container">
        <a href="inscription" class="btn btn-primary">Créer un compte</a>
        <a href="produits" class="btn btn-secondary">Voir les produits</a>
    </div>

    <div class="features">
        <div class="feature">
            <div class="feature-icon">🚚</div>
            <div class="feature-text">Livraison rapide</div>
        </div>
        <div class="feature">
            <div class="feature-icon">🔒</div>
            <div class="feature-text">Sécurisé</div>
        </div>
        <div class="feature">
            <div class="feature-icon">💳</div>
            <div class="feature-text">Paiement simple</div>
        </div>
    </div>
</div>
</body>
</html>