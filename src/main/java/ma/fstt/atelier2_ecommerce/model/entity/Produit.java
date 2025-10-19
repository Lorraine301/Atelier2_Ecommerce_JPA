package ma.fstt.atelier2_ecommerce.model.entity;


import jakarta.persistence.*;
import lombok.*;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Produit {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nom;
    private String description;
    private double prix;
    private int stock;
    private String image;

    @ManyToOne
    @JoinColumn(name = "categorie_id")
    private Categorie categorie;
}
