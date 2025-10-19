<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="ma.fstt.atelier2_ecommerce.model.entity.Produit" %>
<%@ page import="ma.fstt.atelier2_ecommerce.model.entity.Categorie" %>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Produits - Boutique</title>
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
      padding: 40px 20px;
    }

    .header {
      text-align: center;
      margin-bottom: 50px;
      animation: slideDown 0.6s ease-out;
    }

    @keyframes slideDown {
      from {
        opacity: 0;
        transform: translateY(-30px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    h2 {
      font-size: 2.8em;
      color: white;
      text-shadow: 0 2px 10px rgba(0,0,0,0.2);
      margin-bottom: 10px;
    }

    .search-filter {
      background: white;
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 10px 40px rgba(0,0,0,0.15);
      display: flex;
      justify-content: center;
      align-items: center;
      gap: 15px;
      flex-wrap: wrap;
      margin-bottom: 50px;
      animation: slideUp 0.6s ease-out 0.1s both;
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

    input[type="text"], select {
      padding: 12px 18px;
      border: 2px solid #e0e0e0;
      border-radius: 8px;
      width: 250px;
      font-size: 0.95em;
      transition: all 0.3s ease;
      background: white;
    }

    input[type="text"]:focus, select:focus {
      outline: none;
      border-color: #667eea;
      box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
    }

    select {
      width: 220px;
      cursor: pointer;
      appearance: none;
      background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
      background-repeat: no-repeat;
      background-position: right 10px center;
      background-size: 20px;
      padding-right: 35px;
    }

    .btn-search {
      padding: 12px 32px;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      font-weight: 600;
      font-size: 0.95em;
      transition: all 0.3s ease;
      box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
    }

    .btn-search:hover {
      transform: translateY(-2px);
      box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
    }

    .btn-search:active {
      transform: translateY(0);
    }

    .produits-container {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
      gap: 30px;
      max-width: 1400px;
      margin: 0 auto;
      animation: fadeIn 0.6s ease-out 0.2s both;
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
      }
      to {
        opacity: 1;
      }
    }

    .produit-card {
      background: white;
      border-radius: 15px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.1);
      overflow: hidden;
      transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
      position: relative;
      display: flex;
      flex-direction: column;
    }

    .produit-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 20px 50px rgba(0,0,0,0.2);
    }

    .produit-image-wrapper {
      position: relative;
      width: 100%;
      height: 220px;
      background: white;
      overflow: hidden;
    }

    .produit-card img {
      width: 100%;
      height: 100%;
      object-fit: contain;
      padding: 15px;
      transition: transform 0.4s ease;
    }

    .produit-card:hover img {
      transform: scale(1.1);
    }

    .faible-stock {
      position: absolute;
      top: 12px;
      right: 12px;
      background: linear-gradient(135deg, #ff6b6b 0%, #ff5252 100%);
      color: white;
      font-size: 0.75em;
      padding: 6px 12px;
      border-radius: 20px;
      font-weight: 600;
      box-shadow: 0 4px 12px rgba(255, 107, 107, 0.3);
      animation: pulse 2s ease-in-out infinite;
    }

    @keyframes pulse {
      0%, 100% { transform: scale(1); }
      50% { transform: scale(1.05); }
    }

    .produit-info {
      padding: 20px;
      flex-grow: 1;
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;
    }

    .produit-card h3 {
      font-size: 1.2em;
      color: #333;
      margin-bottom: 8px;
      line-height: 1.4;
      min-height: 2.4em;
    }

    .prix {
      color: #667eea;
      font-size: 1.6em;
      font-weight: 700;
      margin: 12px 0;
    }

    .stock {
      font-size: 0.9em;
      color: #999;
      margin-bottom: 15px;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 6px;
    }

    .stock-indicator {
      display: inline-block;
      width: 8px;
      height: 8px;
      border-radius: 50%;
      background: #4caf50;
    }

    .produit-card form {
      margin-top: auto;
    }

    .btn {
      width: 100%;
      padding: 12px 16px;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      text-decoration: none;
      border: none;
      border-radius: 8px;
      font-size: 0.95em;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s ease;
      box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
    }

    .btn:hover {
      transform: translateY(-2px);
      box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
    }

    .btn:active {
      transform: translateY(0);
    }

    .empty-state {
      grid-column: 1 / -1;
      text-align: center;
      padding: 80px 40px;
      background: white;
      border-radius: 15px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.1);
    }

    .empty-state-icon {
      font-size: 4em;
      margin-bottom: 20px;
    }

    .empty-state p {
      font-size: 1.2em;
      color: #666;
      margin-bottom: 20px;
    }

    .empty-state a {
      display: inline-block;
      padding: 12px 30px;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      text-decoration: none;
      border-radius: 8px;
      transition: all 0.3s ease;
    }

    .empty-state a:hover {
      transform: translateY(-2px);
      box-shadow: 0 6px 20px rgba(102, 126, 234, 0.4);
    }

    @media (max-width: 1024px) {
      .produits-container {
        grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
        gap: 25px;
      }

      .search-filter {
        flex-direction: column;
        gap: 12px;
      }

      input[type="text"], select {
        width: 100%;
      }

      .btn-search {
        width: 100%;
      }
    }

    @media (max-width: 768px) {
      body {
        padding: 20px 15px;
      }

      h2 {
        font-size: 2em;
      }

      .produits-container {
        grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
        gap: 20px;
      }

      .produit-image-wrapper {
        height: 180px;
      }

      .produit-info {
        padding: 15px;
      }

      .produit-card h3 {
        font-size: 1em;
      }

      .prix {
        font-size: 1.3em;
      }
    }

    @media (max-width: 480px) {
      h2 {
        font-size: 1.6em;
      }

      .produits-container {
        grid-template-columns: 1fr;
      }

      .search-filter {
        padding: 20px;
      }

      input[type="text"], select {
        padding: 10px 15px;
        font-size: 16px;
      }
    }
  </style>
</head>
<body>

<div class="header">
  <h2>🛍️ À la recherche d'un produit ?</h2>
</div>

<!--  Barre de recherche + Filtrage -->
<form action="ProduitServlet" method="get" class="search-filter">
  <input type="text" name="search" placeholder="Rechercher un produit..."
         value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">

  <select name="categorie">
    <option value="">Toutes les catégories</option>
    <%
      List<Categorie> categories = (List<Categorie>) request.getAttribute("categories");
      if (categories != null) {
        for (Categorie c : categories) {
    %>
    <option value="<%= c.getId() %>"
            <%= (request.getParameter("categorie") != null && request.getParameter("categorie").equals(String.valueOf(c.getId()))) ? "selected" : "" %>>
      <%= c.getNom() %>
    </option>
    <% }} %>
  </select>

  <button type="submit" class="btn-search">Filtrer</button>
</form>

<!-- 🛒 Liste des produits -->
<div class="produits-container">
  <%
    List<Produit> produits = (List<Produit>) request.getAttribute("produits");
    if (produits != null && !produits.isEmpty()) {
      for (Produit p : produits) {
  %>
  <div class="produit-card">
    <div class="produit-image-wrapper">
      <% if (p.getStock() < 5) { %>
      <div class="faible-stock">⚠️ Stock limité</div>
      <% } %>
      <img src="<%= p.getImage() %>" alt="<%= p.getNom() %>">
    </div>

    <div class="produit-info">
      <h3><%= p.getNom() %></h3>
      <div class="prix"><%= p.getPrix() %> DH</div>
      <div class="stock">
        <span class="stock-indicator"></span>
        Stock : <%= p.getStock() %> unités
      </div>

      <!-- Ajout au panier -->
      <form action="ajouterPanier" method="post">
        <input type="hidden" name="idProduit" value="<%= p.getId() %>">
        <button type="submit" class="btn">Ajouter au panier</button>
      </form>
    </div>
  </div>
  <%
    }
  } else {
  %>
  <div class="empty-state">
    <div class="empty-state-icon">📭</div>
    <p>Aucun produit trouvé.</p>
    <p style="font-size: 0.95em; color: #999; margin-bottom: 30px;">Essayez une autre recherche ou parcourez toutes nos catégories.</p>
    <a href="ProduitServlet">Voir tous les produits</a>
  </div>
  <% } %>
</div>

</body>
</html>