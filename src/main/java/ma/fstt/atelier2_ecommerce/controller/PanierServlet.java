package ma.fstt.atelier2_ecommerce.controller;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import ma.fstt.atelier2_ecommerce.model.entity.*;
import ma.fstt.atelier2_ecommerce.model.service.EcommerceService;

@WebServlet("/panier")
public class PanierServlet extends HttpServlet {

    @Inject
    private EcommerceService ecommerceService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Internaute internaute = (Internaute) session.getAttribute("internaute");

        if (internaute == null) {
            session.setAttribute("redirectAfterLogin", "panier");
            response.sendRedirect("login");
            return;
        }

        Panier panier = ecommerceService.getPanierByInternaute(internaute.getId());
        if (panier == null) {
            panier = ecommerceService.creerPanierPourInternaute(internaute);
        }

        List<LignePanier> lignes = ecommerceService.getLignesParPanier(panier.getId());
        request.setAttribute("lignes", lignes);
        request.getRequestDispatcher("/WEB-INF/views/panier.jsp").forward(request, response);
    }
}
