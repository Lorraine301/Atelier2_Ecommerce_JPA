package ma.fstt.atelier2_ecommerce.model.dao;

import ma.fstt.atelier2_ecommerce.model.entity.Categorie;
import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class CategorieDAO extends GenericDAO<Categorie> {

    public CategorieDAO() {
        super(Categorie.class);
    }

    public Categorie findByNom(String nom) {
        try {
            return em.createQuery("SELECT c FROM Categorie c WHERE c.nom = :nom", Categorie.class)
                    .setParameter("nom", nom)
                    .getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }
}
