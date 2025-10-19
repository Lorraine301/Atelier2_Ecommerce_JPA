package ma.fstt.atelier2_ecommerce;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class TestJPA {
    public static void main(String[] args) {

        try {
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("ecommercePU");
            EntityManager em = emf.createEntityManager();

            System.out.println("✅ Connexion JPA réussie !");
            em.close();
            emf.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
