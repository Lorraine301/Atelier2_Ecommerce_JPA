package ma.fstt.atelier2_ecommerce.controller;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import ma.fstt.atelier2_ecommerce.model.entity.Internaute;
import ma.fstt.atelier2_ecommerce.model.entity.Panier;
import ma.fstt.atelier2_ecommerce.model.service.EcommerceService;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Inject
    private EcommerceService ecommerceService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String motDePasse = request.getParameter("motDePasse");

        Internaute internaute = ecommerceService.authentifier(email, motDePasse);

        if (internaute != null) {
            HttpSession session = request.getSession();
            session.setAttribute("internaute", internaute);

            // Vérifier si le panier existe, sinon le créer
            Panier panier = ecommerceService.getPanierByInternaute(internaute.getId());
            if (panier == null) {
                panier = ecommerceService.creerPanierPourInternaute(internaute);
            }
            session.setAttribute("panier", panier);

            // S’il y a une redirection sauvegardée avant le login
            String redirect = (String) session.getAttribute("redirectAfterLogin");
            if (redirect != null) {
                session.removeAttribute("redirectAfterLogin");
                response.sendRedirect(redirect);
            } else {
                response.sendRedirect("produits");
            }

        } else {
            request.setAttribute("erreur", "Email ou mot de passe incorrect");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
        }
    }
}
