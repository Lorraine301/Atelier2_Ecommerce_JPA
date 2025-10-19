<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="ma.fstt.atelier2_ecommerce.model.entity.LignePanier"%>
<%@ page import="ma.fstt.atelier2_ecommerce.model.entity.Produit"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mon panier</title>
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

        .container {
            max-width: 900px;
            margin: 0 auto;
        }

        h2 {
            text-align: center;
            color: white;
            margin-bottom: 40px;
            font-size: 2.5em;
            text-shadow: 0 2px 10px rgba(0,0,0,0.2);
        }

        .panier-vide {
            text-align: center;
            background: white;
            padding: 80px 40px;
            border-radius: 12px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.1);
        }

        .panier-vide p {
            font-size: 1.3em;
            color: #666;
            margin-bottom: 30px;
        }

        .panier-vide a {
            display: inline-block;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 12px 30px;
            text-decoration: none;
            border-radius: 6px;
            transition: transform 0.3s ease;
        }

        .panier-vide a:hover {
            transform: translateY(-2px);
        }

        .items-container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 20px 25px;
            border-bottom: 1px solid #f0f0f0;
            transition: background-color 0.3s ease;
        }

        .item:hover {
            background-color: #f9f9f9;
        }

        .item:last-child {
            border-bottom: none;
        }

        .item-info {
            flex: 1;
        }

        .item-name {
            font-size: 1.1em;
            font-weight: 600;
            color: #333;
            margin-bottom: 5px;
        }

        .item-prix {
            font-size: 0.95em;
            color: #667eea;
            font-weight: 600;
        }

        .item-details {
            display: flex;
            align-items: center;
            gap: 40px;
            margin: 0 30px;
        }

        .quantite {
            text-align: center;
            min-width: 60px;
        }

        .quantite-label {
            font-size: 0.85em;
            color: #999;
            margin-bottom: 5px;
        }

        .quantite-value {
            font-size: 1.3em;
            font-weight: 600;
            color: #333;
        }

        .total-ligne {
            text-align: center;
            min-width: 100px;
        }

        .total-label {
            font-size: 0.85em;
            color: #999;
            margin-bottom: 5px;
        }

        .total-value {
            font-size: 1.3em;
            font-weight: 700;
            color: #764ba2;
        }

        .btn-supprimer {
            background: #ff6b6b;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
            font-size: 0.9em;
        }

        .btn-supprimer:hover {
            background: #ff5252;
            transform: scale(1.05);
            box-shadow: 0 4px 12px rgba(255, 107, 107, 0.3);
        }

        .form-supprimer {
            margin: 0;
        }

        .summary {
            background: white;
            border-radius: 12px;
            margin-top: 25px;
            padding: 30px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.1);
        }

        .total-general {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 30px;
        }

        .total-label-general {
            font-size: 1.1em;
            color: #666;
            font-weight: 500;
        }

        .total-amount {
            font-size: 2.2em;
            font-weight: 700;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .checkout-btn {
            margin-top: 25px;
            width: 100%;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            padding: 15px;
            font-size: 1.1em;
            font-weight: 600;
            border-radius: 8px;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .checkout-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
        }

        @media (max-width: 768px) {
            .item {
                flex-direction: column;
                gap: 15px;
                text-align: center;
            }

            .item-details {
                flex-direction: column;
                gap: 15px;
                margin: 0;
                width: 100%;
            }

            .total-general {
                flex-direction: column;
                text-align: center;
            }

            h2 {
                font-size: 1.8em;
            }

            .total-amount {
                font-size: 1.8em;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Mon Panier</h2>

    <%
        List<LignePanier> lignes = (List<LignePanier>) request.getAttribute("lignes");
        if (lignes != null && !lignes.isEmpty()) {
            double totalGeneral = 0;
    %>

    <div class="items-container">
        <% for (LignePanier lp : lignes) {
            Produit p = lp.getProduit();
            double totalLigne = p.getPrix() * lp.getQuantite();
            totalGeneral += totalLigne;
        %>
        <div class="item">
            <div class="item-info">
                <div class="item-name"><%= p.getNom() %></div>
                <div class="item-prix"><%= p.getPrix() %> DH</div>
            </div>

            <div class="item-details">
                <div class="quantite">
                    <div class="quantite-label">Quantité</div>
                    <div class="quantite-value"><%= lp.getQuantite() %></div>
                </div>

                <div class="total-ligne">
                    <div class="total-label">Sous-total</div>
                    <div class="total-value"><%= String.format("%.2f", totalLigne) %> DH</div>
                </div>
            </div>

            <form method="post" action="supprimerLignePanier" class="form-supprimer">
                <input type="hidden" name="idLigne" value="<%= lp.getId() %>">
                <button type="submit" class="btn-supprimer">Supprimer</button>
            </form>
        </div>
        <% } %>
    </div>

    <div class="summary">
        <div class="total-general">
            <div class="total-label-general">Total à payer :</div>
            <div class="total-amount"><%= String.format("%.2f", totalGeneral) %> DH</div>
        </div>
        <button class="checkout-btn">Procéder au paiement</button>
    </div>

    <% } else { %>
    <div class="panier-vide">
        <p>Votre panier est vide.</p>
        <p style="font-size: 1em; margin: 20px 0; color: #999;">Commencez vos achats maintenant !</p>
        <a href="/">Continuer mes achats</a>
    </div>
    <% } %>
</div>
</body>
</html>