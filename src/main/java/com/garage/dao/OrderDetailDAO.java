package com.garage.dao;

import com.garage.entity.OrderDetail;
import com.garage.repository.OrderDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

/**
 * Order Detail DAO for Module 2 - Supplier Statistics
 * Data Access Object for OrderDetail entity
 */
@Component
public class OrderDetailDAO implements DAO<OrderDetail, Long> {
    
    @Autowired
    private OrderDetailRepository orderDetailRepository;
    
    @Override
    public OrderDetail save(OrderDetail orderDetail) {
        return orderDetailRepository.save(orderDetail);
    }
    
    @Override
    public Optional<OrderDetail> findById(Long id) {
        return orderDetailRepository.findById(id);
    }
    
    @Override
    public List<OrderDetail> findAll() {
        return orderDetailRepository.findAll();
    }
    
    @Override
    public void deleteById(Long id) {
        orderDetailRepository.deleteById(id);
    }
    
    @Override
    public boolean existsById(Long id) {
        return orderDetailRepository.existsById(id);
    }
    
    @Override
    public long count() {
        return orderDetailRepository.count();
    }
    
    /**
     * Find order details by order ID
     * @param orderId Order ID
     * @return List of order details
     */
    public List<OrderDetail> findByOrderId(Long orderId) {
        return orderDetailRepository.findByOrderId(orderId);
    }
    
    /**
     * Find order details by sparepart ID
     * @param sparepartId Sparepart ID
     * @return List of order details containing that sparepart
     */
    public List<OrderDetail> findBySparepartId(Long sparepartId) {
        return orderDetailRepository.findBySparepartId(sparepartId);
    }
    
    /**
     * Get order detail with full information
     * @param orderDetailId Order detail ID
     * @return Optional containing order detail with full info
     */
    public Optional<OrderDetail> getOrderDetailWithInfo(Long orderDetailId) {
        return orderDetailRepository.findByIdWithFullInfo(orderDetailId);
    }
    
    /**
     * Save all order details (bulk insert)
     * @param orderDetails List of order details
     * @return List of saved order details
     */
    public List<OrderDetail> saveAll(List<OrderDetail> orderDetails) {
        return orderDetailRepository.saveAll(orderDetails);
    }
}
