package ma.fstt.atelier2_ecommerce.controller;

import jakarta.inject.Inject;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import ma.fstt.atelier2_ecommerce.model.entity.Internaute;
import ma.fstt.atelier2_ecommerce.model.service.EcommerceService;

@WebServlet("/inscription")
public class InscriptionServlet extends HttpServlet {

    @Inject
    private EcommerceService service;

    // Affiche le formulaire d’inscription
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/inscription.jsp");
        dispatcher.forward(req, resp);
    }

    // Traite l’envoi du formulaire
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        Internaute i = new Internaute();
        i.setNom(req.getParameter("nom"));
        i.setEmail(req.getParameter("email"));
        i.setMotDePasse(req.getParameter("motDePasse"));

        boolean ok = service.inscrireInternaute(i);

        if (ok) {
            // Redirection vers la page login via servlet
            resp.sendRedirect(req.getContextPath() + "/login");
        } else {
            req.setAttribute("erreur", "Cet email existe déjà !");
            req.getRequestDispatcher("/WEB-INF/views/inscription.jsp").forward(req, resp);
        }
    }
}
