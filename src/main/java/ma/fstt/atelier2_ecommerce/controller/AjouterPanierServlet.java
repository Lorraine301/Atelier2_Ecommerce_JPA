package ma.fstt.atelier2_ecommerce.controller;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import ma.fstt.atelier2_ecommerce.model.entity.*;
import ma.fstt.atelier2_ecommerce.model.service.EcommerceService;

@WebServlet("/ajouterPanier")
public class AjouterPanierServlet extends HttpServlet {

    @Inject
    private EcommerceService ecommerceService;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Internaute internaute = (Internaute) session.getAttribute("internaute");

        // 🔹 Si l’utilisateur n’est pas connecté → on garde la page à rediriger après login
        if (internaute == null) {
            session.setAttribute("redirectAfterLogin", "panier");
            response.sendRedirect("login");
            return;
        }

        try {
            Long produitId = Long.parseLong(request.getParameter("idProduit"));
            int quantite = 1; // ou récupéré du formulaire si tu veux permettre le choix

            Panier panier = ecommerceService.getPanierByInternaute(internaute.getId());
            if (panier == null) {
                panier = ecommerceService.creerPanierPourInternaute(internaute);
            }

            Produit produit = ecommerceService.getProduitById(produitId);
            ecommerceService.ajouterProduitAuPanier(panier.getId(), produit, quantite);

            response.sendRedirect("panier");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("produits");
        }
    }
}
