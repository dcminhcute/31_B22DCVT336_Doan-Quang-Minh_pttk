package com.garage.repository;

import com.garage.entity.Order;
import com.garage.entity.Order.OrderStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

/**
 * Order Repository for Module 2 - Supplier Statistics
 */
@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    
    /**
     * Find order by order code
     */
    Optional<Order> findByOrderCode(String orderCode);
    
    /**
     * Find orders by supplier ID
     */
    List<Order> findBySupplierIdOrderByOrderDateDesc(Long supplierId);
    
    /**
     * Find orders by supplier ID and date range
     */
    @Query("SELECT DISTINCT o FROM Order o " +
           "LEFT JOIN FETCH o.orderDetails " +
           "WHERE o.supplier.id = :supplierId " +
           "AND o.orderDate BETWEEN :startDate AND :endDate " +
           "ORDER BY o.orderDate DESC")
    List<Order> findBySupplierIdAndOrderDateBetween(@Param("supplierId") Long supplierId,
                                                     @Param("startDate") LocalDate startDate,
                                                     @Param("endDate") LocalDate endDate);
    
    /**
     * Find orders by status
     */
    List<Order> findByStatus(OrderStatus status);
    
    /**
     * Find orders by date range
     */
    List<Order> findByOrderDateBetween(LocalDate startDate, LocalDate endDate);
    
    /**
     * Get order details with supplier info for a specific order
     */
    @Query("SELECT o FROM Order o " +
           "LEFT JOIN FETCH o.supplier " +
           "LEFT JOIN FETCH o.warehouseStaff " +
           "LEFT JOIN FETCH o.orderDetails " +
           "WHERE o.id = :orderId")
    Optional<Order> findByIdWithDetails(@Param("orderId") Long orderId);
}
