package ma.fstt.atelier2_ecommerce.controller;

import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import ma.fstt.atelier2_ecommerce.model.entity.Produit;
import ma.fstt.atelier2_ecommerce.model.service.EcommerceService;

@WebServlet("/produits")
public class ListeProduitsServlet extends HttpServlet {

    @Inject
    private EcommerceService service;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Produit> produits = service.getAllProduits();
        req.setAttribute("produits", produits);
        req.getRequestDispatcher("/WEB-INF/views/produits.jsp").forward(req, resp);
    }
}
