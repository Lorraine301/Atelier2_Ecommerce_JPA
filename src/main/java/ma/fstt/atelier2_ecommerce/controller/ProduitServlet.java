package ma.fstt.atelier2_ecommerce.controller;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

import ma.fstt.atelier2_ecommerce.model.dao.CategorieDAO;
import ma.fstt.atelier2_ecommerce.model.dao.ProduitDAO;
import ma.fstt.atelier2_ecommerce.model.entity.Produit;

@WebServlet("/produits")
public class ProduitServlet extends HttpServlet {

    @Inject
    private ProduitDAO produitDAO;

    @Inject
    private CategorieDAO categorieDAO;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String search = request.getParameter("search");
        String catIdStr = request.getParameter("categorie");

        List<Produit> produits;

        if (search != null && !search.trim().isEmpty()) {
            produits = produitDAO.searchByNom(search);
        } else if (catIdStr != null && !catIdStr.isEmpty()) {
            produits = produitDAO.findByCategorie(Long.parseLong(catIdStr));
        } else {
            produits = produitDAO.findAll();
        }

        request.setAttribute("produits", produits);
        request.setAttribute("categories", categorieDAO.findAll());
        request.getRequestDispatcher("/WEB-INF/views/produits.jsp").forward(request, response);
    }
}


