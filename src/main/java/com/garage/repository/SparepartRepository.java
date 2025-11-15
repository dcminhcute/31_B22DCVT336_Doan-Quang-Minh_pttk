package com.garage.repository;

import com.garage.entity.Sparepart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

/**
 * Sparepart Repository for Module 2 - Supplier Statistics
 */
@Repository
public interface SparepartRepository extends JpaRepository<Sparepart, Long> {
    
    /**
     * Find sparepart by part code
     */
    Optional<Sparepart> findByPartCode(String partCode);
    
    /**
     * Find spareparts by category
     */
    List<Sparepart> findByCategory(Sparepart.PartCategory category);
    
    /**
     * Find spareparts with low stock
     */
    @Query("SELECT s FROM Sparepart s WHERE s.currentStock < s.minStock")
    List<Sparepart> findByCurrentStockLessThanMinStock();
    /**
     * Find spareparts by name (case-insensitive, partial match)
     */
    List<Sparepart> findByPartNameContainingIgnoreCase(String partName);
}
