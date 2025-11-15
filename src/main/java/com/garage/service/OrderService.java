package com.garage.service;

import com.garage.entity.Order;
import com.garage.entity.OrderDetail;
import com.garage.repository.OrderRepository;
import com.garage.repository.OrderDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

/**
 * Order Service for Module 2 - Supplier Statistics
 */
@Service
@Transactional
public class OrderService {
    
    @Autowired
    private OrderRepository orderRepository;
    
    @Autowired
    private OrderDetailRepository orderDetailRepository;
    
    /**
     * Get all orders
     */
    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }
    
    /**
     * Get order by ID
     */
    public Optional<Order> getOrderById(Long id) {
        return orderRepository.findById(id);
    }
    
    /**
     * Get order with full details (supplier, warehouse staff)
     */
    public Optional<Order> getOrderWithDetails(Long id) {
        return orderRepository.findByIdWithDetails(id);
    }
    
    /**
     * Get order by order code
     */
    public Optional<Order> getOrderByCode(String orderCode) {
        return orderRepository.findByOrderCode(orderCode);
    }
    
    /**
     * Get orders by supplier ID
     */
    public List<Order> getOrdersBySupplier(Long supplierId) {
        return orderRepository.findBySupplierIdOrderByOrderDateDesc(supplierId);
    }
    
    /**
     * Get orders by supplier ID and date range
     */
    public List<Order> getOrdersBySupplierAndDateRange(Long supplierId, LocalDate startDate, LocalDate endDate) {
        return orderRepository.findBySupplierIdAndOrderDateBetween(supplierId, startDate, endDate);
    }
    
    /**
     * Get order details by order ID
     */
    public List<OrderDetail> getOrderDetails(Long orderId) {
        return orderDetailRepository.findByOrderId(orderId);
    }
    
    /**
     * Save order
     */
    public Order saveOrder(Order order) {
        return orderRepository.save(order);
    }
    
    /**
     * Delete order
     */
    public void deleteOrder(Long id) {
        orderRepository.deleteById(id);
    }
}
