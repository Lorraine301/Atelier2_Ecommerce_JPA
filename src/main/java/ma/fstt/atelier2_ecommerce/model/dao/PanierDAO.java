package ma.fstt.atelier2_ecommerce.model.dao;

import jakarta.enterprise.context.ApplicationScoped;
import ma.fstt.atelier2_ecommerce.model.entity.Panier;

@ApplicationScoped
public class PanierDAO extends GenericDAO<Panier> {

    public PanierDAO() {
        super(Panier.class);
    }

    /**
     * Récupère le panier d’un internaute spécifique.
     * Retourne null si aucun panier n’existe encore.
     */
    public Panier findByInternauteId(Long internauteId) {
        try {
            return em.createQuery(
                            "SELECT p FROM Panier p WHERE p.internaute.id = :id", Panier.class)
                    .setParameter("id", internauteId)
                    .getSingleResult();
        } catch (Exception e) {
            return null; // Aucun panier trouvé
        }
    }
}
