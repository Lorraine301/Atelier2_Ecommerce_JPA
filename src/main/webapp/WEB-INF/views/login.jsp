<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Connexion - Boutique</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      padding: 20px;
      position: relative;
      overflow: hidden;
    }

    /* Éléments décoratifs */
    body::before {
      content: '';
      position: absolute;
      width: 300px;
      height: 300px;
      background: rgba(255, 255, 255, 0.1);
      border-radius: 50%;
      top: -100px;
      right: -100px;
      animation: float 6s ease-in-out infinite;
    }

    body::after {
      content: '';
      position: absolute;
      width: 200px;
      height: 200px;
      background: rgba(255, 255, 255, 0.05);
      border-radius: 50%;
      bottom: -50px;
      left: -50px;
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
      padding: 50px 40px;
      width: 100%;
      max-width: 420px;
      border-radius: 20px;
      box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
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
      font-size: 3em;
      text-align: center;
      margin-bottom: 15px;
    }

    h2 {
      color: #333;
      margin-bottom: 10px;
      text-align: center;
      font-size: 1.8em;
      font-weight: 700;
    }

    .subtitle {
      text-align: center;
      color: #999;
      font-size: 0.95em;
      margin-bottom: 30px;
    }

    .form-group {
      margin-bottom: 18px;
    }

    input[type="email"],
    input[type="password"],
    input[type="text"] {
      width: 100%;
      padding: 14px 16px;
      border: 2px solid #e0e0e0;
      border-radius: 10px;
      font-size: 0.95em;
      transition: all 0.3s ease;
      background: white;
    }

    input[type="email"]::placeholder,
    input[type="password"]::placeholder,
    input[type="text"]::placeholder {
      color: #bbb;
    }

    input[type="email"]:focus,
    input[type="password"]:focus,
    input[type="text"]:focus {
      outline: none;
      border-color: #667eea;
      box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
      background: white;
    }

    input[type="submit"] {
      width: 100%;
      padding: 14px;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      border: none;
      border-radius: 10px;
      font-size: 1em;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s ease;
      box-shadow: 0 8px 20px rgba(102, 126, 234, 0.3);
      margin-top: 10px;
    }

    input[type="submit"]:hover {
      transform: translateY(-2px);
      box-shadow: 0 12px 30px rgba(102, 126, 234, 0.4);
    }

    input[type="submit"]:active {
      transform: translateY(0);
    }

    .divider {
      text-align: center;
      margin: 30px 0;
      position: relative;
    }

    .divider::before {
      content: '';
      position: absolute;
      top: 50%;
      left: 0;
      right: 0;
      height: 1px;
      background: #e0e0e0;
    }

    .divider span {
      background: white;
      padding: 0 12px;
      position: relative;
      color: #999;
      font-size: 0.9em;
    }

    .link-section {
      text-align: center;
    }

    .link-section a {
      display: inline-block;
      margin-top: 8px;
      color: #667eea;
      text-decoration: none;
      font-weight: 600;
      font-size: 0.95em;
      transition: all 0.3s ease;
      position: relative;
    }

    .link-section a::after {
      content: '';
      position: absolute;
      bottom: -2px;
      left: 0;
      width: 0;
      height: 2px;
      background: #667eea;
      transition: width 0.3s ease;
    }

    .link-section a:hover::after {
      width: 100%;
    }

    .error {
      background: #ffebee;
      color: #c62828;
      padding: 12px 16px;
      border-radius: 8px;
      margin-top: 20px;
      font-size: 0.9em;
      border-left: 4px solid #c62828;
      animation: shake 0.3s ease;
    }

    @keyframes shake {
      0%, 100% { transform: translateX(0); }
      25% { transform: translateX(-5px); }
      75% { transform: translateX(5px); }
    }

    @media (max-width: 480px) {
      .container {
        padding: 40px 25px;
      }

      h2 {
        font-size: 1.5em;
      }

      .subtitle {
        margin-bottom: 25px;
      }
    }
  </style>
</head>
<body>
<div class="container">
  <div class="icon">🔐</div>
  <h2>Connexion</h2>
  <p class="subtitle">Bienvenue ! Connectez-vous à votre compte</p>

  <form action="${pageContext.request.contextPath}/login" method="post">
    <div class="form-group">
      <input type="email" name="email" placeholder="Email" required>
    </div>
    <div class="form-group">
      <input type="password" name="motDePasse" placeholder="Mot de passe" required>
    </div>
    <input type="submit" value="Se connecter">
  </form>

  <div class="divider">
    <span>Nouveau client ?</span>
  </div>

  <div class="link-section">
    <a href="${pageContext.request.contextPath}/inscription">Créer un compte</a>
  </div>

  <% String erreur = (String) request.getAttribute("erreur");
    if (erreur != null) { %>
  <p class="error"><%= erreur %></p>
  <% } %>
</div>
</body>
</html>

