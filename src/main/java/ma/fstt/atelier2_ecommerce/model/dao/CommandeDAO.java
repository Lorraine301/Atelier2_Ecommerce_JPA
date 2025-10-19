package ma.fstt.atelier2_ecommerce.model.dao;

import ma.fstt.atelier2_ecommerce.model.entity.Commande;
import jakarta.enterprise.context.ApplicationScoped;
import java.util.List;

@ApplicationScoped
public class CommandeDAO extends GenericDAO<Commande> {

    public CommandeDAO() {
        super(Commande.class);
    }

    public List<Commande> findByInternaute(Long internauteId) {
        return em.createQuery(
                        "SELECT c FROM Commande c WHERE c.internaute.id = :id", Commande.class)
                .setParameter("id", internauteId)
                .getResultList();
    }

    public List<Commande> findByStatut(String statut) {
        return em.createQuery(
                        "SELECT c FROM Commande c WHERE c.statut = :statut", Commande.class)
                .setParameter("statut", statut)
                .getResultList();
    }
}
