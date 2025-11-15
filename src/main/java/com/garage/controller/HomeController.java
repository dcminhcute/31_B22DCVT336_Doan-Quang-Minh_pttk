package com.garage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Home Controller - Main entry point
 */
@Controller
public class HomeController {
    
    /**
     * Application home page
     * Redirect to login page
     * GET /
     */
    @GetMapping("/")
    public String home() {
        return "redirect:/login";
    }
}
