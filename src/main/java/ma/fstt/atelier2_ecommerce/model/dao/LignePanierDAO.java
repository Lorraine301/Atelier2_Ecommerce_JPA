package ma.fstt.atelier2_ecommerce.model.dao;

import jakarta.enterprise.context.ApplicationScoped;
import ma.fstt.atelier2_ecommerce.model.entity.LignePanier;

import java.util.List;

@ApplicationScoped
public class LignePanierDAO extends GenericDAO<LignePanier> {

    public LignePanierDAO() {
        super(LignePanier.class);
    }

    /**
     * Récupère toutes les lignes d’un panier.
     */
    public List<LignePanier> findByPanierId(Long panierId) {
        return em.createQuery(
                        "SELECT lp FROM LignePanier lp WHERE lp.panier.id = :id", LignePanier.class)
                .setParameter("id", panierId)
                .getResultList();
    }

    /**
     * Vérifie si un produit est déjà présent dans le panier.
     */
    public LignePanier findByPanierAndProduit(Long panierId, Long produitId) {
        try {
            return em.createQuery(
                            "SELECT lp FROM LignePanier lp WHERE lp.panier.id = :panierId AND lp.produit.id = :produitId",
                            LignePanier.class)
                    .setParameter("panierId", panierId)
                    .setParameter("produitId", produitId)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }
}
