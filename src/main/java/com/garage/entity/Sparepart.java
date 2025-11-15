package com.garage.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * Spare Part Entity for Module 2 - Supplier Statistics
 */
@Entity
@Table(name = "spareparts")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Sparepart {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "part_code", nullable = false, unique = true, length = 50)
    private String partCode;
    
    @Column(name = "part_name", nullable = false, length = 100)
    private String partName;
    
    @Column(columnDefinition = "TEXT")
    private String description;
    
    @Column(length = 50)
    @Enumerated(EnumType.STRING)
    private PartCategory category;
    
    @Column(length = 20)
    private String unit = "piece";
    
    @Column(name = "current_stock")
    private Integer currentStock = 0;
    
    @Column(name = "min_stock")
    private Integer minStock = 10;
    
    @Column(name = "unit_price", precision = 10, scale = 2)
    private BigDecimal unitPrice;
    
    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;
    
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;
    
    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
    }
    
    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
    
    /**
     * Part Category Enum
     */
    public enum PartCategory {
        ENGINE("Engine"),
        BRAKE("Brake"),
        TIRE("Tire"),
        ELECTRICAL("Electrical"),
        BODY("Body"),
        SUSPENSION("Suspension"),
        AC("Air Conditioning"),
        TRANSMISSION("Transmission");
        
        private final String displayName;
        
        PartCategory(String displayName) {
            this.displayName = displayName;
        }
        
        public String getDisplayName() {
            return displayName;
        }
    }
}
