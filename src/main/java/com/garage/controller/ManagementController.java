package com.garage.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Management Controller for Management Staff
 * Handles management staff home and navigation
 */
@Controller
@RequestMapping("/management")
public class ManagementController {
    
    /**
     * Show management staff home page
     * GET /management/home
     */
    @GetMapping("/home")
    public String managementHome(HttpSession session, Model model) {
        // Check if user is logged in as staff
        Long staffId = (Long) session.getAttribute("staffId");
        String staffName = (String) session.getAttribute("staffName");
        
        if (staffId == null) {
            return "redirect:/login/staff";
        }
        
        model.addAttribute("staffId", staffId);
        model.addAttribute("staffName", staffName);
        
        return "management-staff-home";
    }
}
