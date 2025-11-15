package com.garage.dao;

import com.garage.entity.Order;
import com.garage.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

/**
 * Order DAO for Module 2 - Supplier Statistics
 * Data Access Object for Order entity
 */
@Component
public class OrderDAO implements DAO<Order, Long> {
    
    @Autowired
    private OrderRepository orderRepository;
    
    @Override
    public Order save(Order order) {
        return orderRepository.save(order);
    }
    
    @Override
    public Optional<Order> findById(Long id) {
        return orderRepository.findById(id);
    }
    
    @Override
    public List<Order> findAll() {
        return orderRepository.findAll();
    }
    
    @Override
    public void deleteById(Long id) {
        orderRepository.deleteById(id);
    }
    
    @Override
    public boolean existsById(Long id) {
        return orderRepository.existsById(id);
    }
    
    @Override
    public long count() {
        return orderRepository.count();
    }
    
    /**
     * Find order by order code
     * @param orderCode Order code
     * @return Optional containing order if found
     */
    public Optional<Order> findByOrderCode(String orderCode) {
        return orderRepository.findByOrderCode(orderCode);
    }
    
    /**
     * Find orders by supplier ID
     * @param supplierId Supplier ID
     * @return List of orders
     */
    public List<Order> findBySupplierIdOrderByDate(Long supplierId) {
        return orderRepository.findBySupplierIdOrderByOrderDateDesc(supplierId);
    }
    
    /**
     * Find orders by supplier ID and date range
     * @param supplierId Supplier ID
     * @param startDate Start date
     * @param endDate End date
     * @return List of orders within date range
     */
    public List<Order> findBySupplierAndDateRange(Long supplierId, LocalDate startDate, LocalDate endDate) {
        return orderRepository.findBySupplierIdAndOrderDateBetween(supplierId, startDate, endDate);
    }
    
    /**
     * Get order details (with full information)
     * @param orderId Order ID
     * @return Optional containing order with full details
     */
    public Optional<Order> getOrderDetails(Long orderId) {
        return orderRepository.findByIdWithDetails(orderId);
    }
    
    /**
     * Find orders by date range
     * @param startDate Start date
     * @param endDate End date
     * @return List of orders
     */
    public List<Order> findByDateRange(LocalDate startDate, LocalDate endDate) {
        return orderRepository.findByOrderDateBetween(startDate, endDate);
    }
    
    /**
     * Find orders by status
     * @param status Order status
     * @return List of orders with that status
     */
    public List<Order> findByStatus(Order.OrderStatus status) {
        return orderRepository.findByStatus(status);
    }
}
