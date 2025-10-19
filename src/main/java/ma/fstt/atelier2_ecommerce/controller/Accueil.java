package ma.fstt.atelier2_ecommerce.controller;


import jakarta.servlet.*;
        import jakarta.servlet.http.*;
        import jakarta.servlet.annotation.*;

        import java.io.IOException;

@WebServlet("/accueil")
public class Accueil extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Redirige vers la JSP dans WEB-INF
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/accueil.jsp");
        dispatcher.forward(request, response);
    }
}
