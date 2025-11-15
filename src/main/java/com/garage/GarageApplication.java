package com.garage;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * Main Application Class for Garage Management System
 * 
 * This application provides two main modules:
 * 1. Appointment Booking Module - For customers to book garage appointments
 * 2. Supplier Statistics Module - For management staff to view supplier statistics
 * 
 * @author Garage Team
 * @version 1.0.0
 */
@SpringBootApplication
public class GarageApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(GarageApplication.class, args);
        System.out.println("╔══════════════════════════════════════════════════════════╗");
        System.out.println("║                                                          ║");
        System.out.println("║       🚗 GARAGE MANAGEMENT SYSTEM STARTED 🚗            ║");
        System.out.println("║                                                          ║");
        System.out.println("║  Application is running at: http://localhost:8080/garage ║");
        System.out.println("║                                                          ║");
        System.out.println("║  Modules Available:                                      ║");
        System.out.println("║    1. Appointment Booking                                ║");
        System.out.println("║    2. Supplier Statistics                                ║");
        System.out.println("║                                                          ║");
        System.out.println("╚══════════════════════════════════════════════════════════╝");
    }
}
