package com.garage.controller;

import com.garage.entity.Order;
import com.garage.entity.OrderDetail;
import com.garage.entity.Supplier;
import com.garage.service.OrderService;
import com.garage.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

/**
 * Supplier Statistics Controller for Module 2
 */
@Controller
@RequestMapping("/statistics")
public class SupplierStatisticsController {
    
    @Autowired
    private SupplierService supplierService;
    
    @Autowired
    private OrderService orderService;
    
    /**
     * Show management staff home page
     * GET /statistics/home
     */
    @GetMapping("/home")
    public String managementHome(Model model) {
        return "management-staff-home";
    }
    
    /**
     * Show supplier statistics form (Interface 1)
     * GET /statistics/suppliers
     */
    @GetMapping("/suppliers")
    public String showSupplierStatisticsForm(Model model) {
        // Set default date range (last 30 days)
        LocalDate endDate = LocalDate.now();
        LocalDate startDate = endDate.minusDays(30);
        
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        
        return "supplier-statistics";
    }
    
    /**
     * View supplier statistics by quantity (Interface 1 with results)
     * POST /statistics/suppliers
     */
    @PostMapping("/suppliers")
    public String viewSupplierStatistics(
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate,
            Model model) {
        
        // Validate date range
        if (startDate.isAfter(endDate)) {
            model.addAttribute("error", "Start date must be before end date");
            model.addAttribute("startDate", startDate);
            model.addAttribute("endDate", endDate);
            return "supplier-statistics";
        }
        
        // Get supplier statistics
        List<Map<String, Object>> supplierStats = supplierService.getSupplierStatisticsByQuantity(startDate, endDate);
        
        model.addAttribute("supplierStats", supplierStats);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        
        return "supplier-statistics";
    }
    
    /**
     * View supplier details (Interface 2)
     * GET /statistics/supplier/{id}
     */
    @GetMapping("/supplier/{id}")
    public String viewSupplierDetails(
            @PathVariable Long id,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate endDate,
            Model model) {
        
        // Get supplier
        Supplier supplier = supplierService.getSupplierById(id)
                .orElseThrow(() -> new IllegalArgumentException("Supplier not found with ID: " + id));
        
        // Get orders for this supplier within date range
        List<Order> orders = orderService.getOrdersBySupplierAndDateRange(id, startDate, endDate);
        
        model.addAttribute("supplier", supplier);
        model.addAttribute("orders", orders);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        
        return "supplier-details";
    }
}
