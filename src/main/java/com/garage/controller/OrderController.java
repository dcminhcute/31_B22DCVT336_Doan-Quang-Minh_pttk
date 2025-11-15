package com.garage.controller;

import com.garage.entity.Order;
import com.garage.entity.OrderDetail;
import com.garage.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;

/**
 * Order Controller for Module 2 - Supplier Statistics
 */
@Controller
@RequestMapping("/order")
public class OrderController {
    
    @Autowired
    private OrderService orderService;
    
    /**
     * View order details (Interface 3)
     * GET /order/{id}
     */
    @GetMapping("/{id}")
    public String viewOrderDetails(@PathVariable Long id, Model model) {
        // Get order with full details
        Order order = orderService.getOrderWithDetails(id)
                .orElseThrow(() -> new IllegalArgumentException("Order not found with ID: " + id));
        
        // Get order details (spare parts in this order)
        List<OrderDetail> orderDetails = orderService.getOrderDetails(id);
        
        model.addAttribute("order", order);
        model.addAttribute("orderDetails", orderDetails);
        
        return "order-details";
    }
}
