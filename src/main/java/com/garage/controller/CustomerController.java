package com.garage.controller;

import com.garage.entity.Customer;
import com.garage.service.CustomerService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Customer Controller for Module 1 - Appointment Booking
 */
@Controller
@RequestMapping("/customer")
public class CustomerController {
    
    @Autowired
    private CustomerService customerService;
    
    /**
     * Show customer home page
     * GET /customer/home/{id}
     */
    @GetMapping("/home/{id}")
    public String customerHome(@PathVariable Long id, Model model) {
        Customer customer = customerService.getCustomerById(id)
                .orElseThrow(() -> new IllegalArgumentException("Customer not found with ID: " + id));
        
        model.addAttribute("customer", customer);
        return "customer-home";
    }
    
    /**
     * Show customer home page (default - get from session)
     * GET /customer/home
     */
    @GetMapping("/home")
    public String customerHomeDefault(HttpSession session, Model model) {
        // Check if user is logged in
        Long customerId = (Long) session.getAttribute("customerId");
        if (customerId == null) {
            return "redirect:/login/customer";
        }
        
        return customerHome(customerId, model);
    }
}
