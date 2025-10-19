package ma.fstt.atelier2_ecommerce.model.dao;

import  ma.fstt.atelier2_ecommerce.model.entity.Produit;
import jakarta.enterprise.context.ApplicationScoped;
import java.util.List;

@ApplicationScoped
public class ProduitDAO extends GenericDAO<Produit> {

    public ProduitDAO() {
        super(Produit.class);
    }

    // Recherche par catégorie
    public List<Produit> findByCategorie(Long categorieId) {
        return em.createQuery(
                        "SELECT p FROM Produit p WHERE p.categorie.id = :id", Produit.class)
                .setParameter("id", categorieId)
                .getResultList();
    }

    // Recherche par nom (partielle)
    public List<Produit> searchByNom(String motCle) {
        return em.createQuery(
                        "SELECT p FROM Produit p WHERE LOWER(p.nom) LIKE LOWER(:mc)", Produit.class)
                .setParameter("mc", "%" + motCle + "%")
                .getResultList();
    }

}
