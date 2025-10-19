package ma.fstt.atelier2_ecommerce.model.entity;

import jakarta.persistence.*;
        import lombok.*;

        import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Internaute {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nom;
    private String email;
    private String motDePasse;
    private String adresse;
    private String telephone;

    @OneToOne(mappedBy = "internaute", cascade = CascadeType.ALL)
    private Panier panier;

    @OneToMany(mappedBy = "internaute", cascade = CascadeType.ALL)
    private List<Commande> commandes;
}
