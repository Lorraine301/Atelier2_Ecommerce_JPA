package ma.fstt.atelier2_ecommerce.model.entity;

import jakarta.persistence.*;
        import lombok.*;
        import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Panier {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "internaute_id")
    private Internaute internaute;

    @OneToMany(mappedBy = "panier", cascade = CascadeType.ALL)
    private List<LignePanier> lignes;
}
