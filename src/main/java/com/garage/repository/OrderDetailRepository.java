package com.garage.repository;

import com.garage.entity.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

/**
 * Order Detail Repository for Module 2 - Supplier Statistics
 */
@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {
    
    /**
     * Find order details by order ID
     */
    @Query("SELECT od FROM OrderDetail od " +
           "LEFT JOIN FETCH od.sparepart " +
           "WHERE od.order.id = :orderId")
    List<OrderDetail> findByOrderId(@Param("orderId") Long orderId);
    
    /**
     * Find order details by sparepart ID
     */
    List<OrderDetail> findBySparepartId(Long sparepartId);
    
    /**
     * Get order details with full information (order, sparepart)
     */
    @Query("SELECT od FROM OrderDetail od " +
           "LEFT JOIN FETCH od.order o " +
           "LEFT JOIN FETCH od.sparepart s " +
           "WHERE od.id = :orderDetailId")
    OrderDetail findByIdWithDetails(@Param("orderDetailId") Long orderDetailId);
    
    /**
     * Find order detail by ID with full information
     */
    @Query("SELECT od FROM OrderDetail od " +
           "LEFT JOIN FETCH od.order o " +
           "LEFT JOIN FETCH o.supplier " +
           "LEFT JOIN FETCH o.warehouseStaff " +
           "LEFT JOIN FETCH od.sparepart " +
           "WHERE od.id = :orderDetailId")
    Optional<OrderDetail> findByIdWithFullInfo(@Param("orderDetailId") Long orderDetailId);
}
