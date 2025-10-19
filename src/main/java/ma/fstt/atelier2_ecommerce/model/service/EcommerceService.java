package ma.fstt.atelier2_ecommerce.model.service;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.transaction.Transactional;
import ma.fstt.atelier2_ecommerce.model.dao.*;
import ma.fstt.atelier2_ecommerce.model.entity.*;
import java.util.List;

@ApplicationScoped
public class EcommerceService {

    @Inject
    private ProduitDAO produitDAO;

    @Inject
    private PanierDAO panierDAO;

    @Inject
    private LignePanierDAO lignePanierDAO;

    @Inject
    private InternauteDAO internauteDAO;

    // ===========================
    // 🔹 PRODUITS
    // ===========================
    public List<Produit> getAllProduits() {
        return produitDAO.findAll();
    }

    public Produit getProduitById(Long id) {
        return produitDAO.find(id);
    }

    // ===========================
    // 🔹 INTERNAUTES
    // ===========================
    @Transactional
    public boolean inscrireInternaute(Internaute internaute) {
        if (internauteDAO.emailExists(internaute.getEmail())) {
            return false;
        }
        internauteDAO.create(internaute);
        return true;
    }

    public Internaute authentifier(String email, String motDePasse) {
        return internauteDAO.findByEmailAndPassword(email, motDePasse);
    }

    // ===========================
    // 🔹 PANIERS
    // ===========================
    @Transactional
    public Panier creerPanierPourInternaute(Internaute internaute) {
        Panier p = new Panier();
        p.setInternaute(internaute);
        panierDAO.create(p);
        return p;
    }

    public Panier getPanierByInternaute(Long internauteId) {
        return panierDAO.findByInternauteId(internauteId);
    }

    // ===========================
    // 🔹 LIGNES PANIER
    // ===========================
    @Transactional
    public void ajouterProduitAuPanier(Long panierId, Produit produit, int quantite) {
        LignePanier ligneExistante = lignePanierDAO.findByPanierAndProduit(panierId, produit.getId());
        if (ligneExistante != null) {
            ligneExistante.setQuantite(ligneExistante.getQuantite() + quantite);
            lignePanierDAO.update(ligneExistante);
        } else {
            LignePanier lp = new LignePanier();
            lp.setPanier(panierDAO.find(panierId));
            lp.setProduit(produit);
            lp.setQuantite(quantite);
            lignePanierDAO.create(lp);
        }
    }

    @Transactional
    public void supprimerLignePanier(Long ligneId) {
        LignePanier lp = lignePanierDAO.find(ligneId);
        if (lp != null) {
            lignePanierDAO.delete(lp);
        }
    }

    public List<LignePanier> getLignesParPanier(Long panierId) {
        return lignePanierDAO.findByPanierId(panierId);
    }
}
