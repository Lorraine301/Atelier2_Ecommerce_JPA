package ma.fstt.atelier2_ecommerce.util;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JPAUtil {
    private static final EntityManagerFactory emf =
            Persistence.createEntityManagerFactory("ecommercePU");

    public static EntityManagerFactory getEntityManagerFactory() {
        return emf;
    }
}
