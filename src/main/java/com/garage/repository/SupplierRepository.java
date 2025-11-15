package com.garage.repository;

import com.garage.entity.Supplier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

/**
 * Supplier Repository for Module 2 - Supplier Statistics
 */
@Repository
public interface SupplierRepository extends JpaRepository<Supplier, Long> {
    
    /**
     * Find supplier by supplier code
     */
    Optional<Supplier> findBySupplierCode(String supplierCode);
    
    /**
     * Find suppliers by name (case-insensitive, partial match)
     */
    List<Supplier> findBySupplierNameContainingIgnoreCase(String supplierName);
    
    /**
     * Find suppliers by city
     */
    List<Supplier> findByCity(String city);
    
    /**
     * Get suppliers with total imported quantity within date range
     * Returns: supplierId, supplierName, supplierCode, totalQuantity
     */
    @Query("SELECT s.id, s.supplierName, s.supplierCode, " +
           "COALESCE(SUM(od.quantity), 0) as totalQuantity " +
           "FROM Supplier s " +
           "LEFT JOIN Order o ON o.supplier.id = s.id " +
           "LEFT JOIN OrderDetail od ON od.order.id = o.id " +
           "WHERE o.orderDate BETWEEN :startDate AND :endDate " +
           "AND o.status = 'RECEIVED' " +
           "GROUP BY s.id, s.supplierName, s.supplierCode " +
           "ORDER BY totalQuantity DESC")
    List<Object[]> getSupplierStatisticsByQuantity(@Param("startDate") LocalDate startDate, 
                                                    @Param("endDate") LocalDate endDate);
}
