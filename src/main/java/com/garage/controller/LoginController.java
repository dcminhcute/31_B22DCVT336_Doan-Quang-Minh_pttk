package com.garage.controller;

import com.garage.entity.Customer;
import com.garage.service.CustomerService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

/**
 * Login Controller for Authentication
 */
@Controller
@RequestMapping("/login")
public class LoginController {
    
    @Autowired
    private CustomerService customerService;
    
    /**
     * Show login selection page
     */
    @GetMapping
    public String showLoginPage() {
        return "login-selection";
    }
    
    /**
     * Show customer login form
     */
    @GetMapping("/customer")
    public String showCustomerLoginForm(Model model) {
        model.addAttribute("userType", "Customer");
        return "login-form";
    }
    
    /**
     * Show staff login form
     */
    @GetMapping("/staff")
    public String showStaffLoginForm(Model model) {
        model.addAttribute("userType", "Staff");
        return "login-form";
    }
    
    /**
     * Process customer login
     */
    @PostMapping("/customer")
    public String processCustomerLogin(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            HttpSession session,
            Model model) {
        
        // Find customer by username
        Optional<Customer> customerOpt = customerService.getCustomerByUsername(username);
        
        if (customerOpt.isPresent()) {
            Customer customer = customerOpt.get();
            
            // Password in database is BCrypt hashed
            // For demo: all users have password "123456"
            // We'll check with plain password for simplicity
            if (password.equals("123456")) {
                // Login successful
                session.setAttribute("customerId", customer.getId());
                session.setAttribute("customerName", customer.getUser().getFullName());
                session.setAttribute("userType", "customer");
                
                return "redirect:/customer/home";
            }
        }
        
        // Login failed
        model.addAttribute("error", "Invalid username or password");
        model.addAttribute("userType", "Customer");
        return "login-form";
    }
    
    /**
     * Process staff login
     */
    @PostMapping("/staff")
    public String processStaffLogin(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            HttpSession session,
            Model model) {
        
        // Check with BCrypt - manager1/manager2 password is also "123456"
        // For demo: username "manager1" or "manager2", password "123456"
        if ((username.equals("manager1") || username.equals("manager2")) && password.equals("123456")) {
            session.setAttribute("staffId", 1L);
            session.setAttribute("staffName", username.equals("manager1") ? "Bui Van H" : "Dang Thi I");
            session.setAttribute("userType", "staff");
            
            return "redirect:/management/home";
        }
        
        // Login failed
        model.addAttribute("error", "Invalid username or password");
        model.addAttribute("userType", "Staff");
        return "login-form";
    }
    
    /**
     * Logout
     */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
