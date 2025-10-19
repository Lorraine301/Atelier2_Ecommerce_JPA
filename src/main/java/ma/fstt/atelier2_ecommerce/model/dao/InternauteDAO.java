package ma.fstt.atelier2_ecommerce.model.dao;

import ma.fstt.atelier2_ecommerce.model.entity.Internaute;
import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class InternauteDAO extends GenericDAO<Internaute> {

    public InternauteDAO() {
        super(Internaute.class);
    }

    // Vérifier la connexion (authentification)
    public Internaute findByEmailAndPassword(String email, String motDePasse) {
        try {
            return em.createQuery(
                            "SELECT i FROM Internaute i WHERE i.email = :email AND i.motDePasse = :mdp",
                            Internaute.class)
                    .setParameter("email", email)
                    .setParameter("mdp", motDePasse)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }

    // Vérifier si un email existe déjà
    public boolean emailExists(String email) {
        Long count = em.createQuery(
                        "SELECT COUNT(i) FROM Internaute i WHERE i.email = :email", Long.class)
                .setParameter("email", email)
                .getSingleResult();
        return count > 0;
    }
}
