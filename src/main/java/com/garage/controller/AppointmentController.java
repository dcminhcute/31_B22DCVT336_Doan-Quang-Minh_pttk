package com.garage.controller;

import com.garage.entity.Appointment;
import com.garage.entity.Customer;
import com.garage.service.AppointmentService;
import com.garage.service.CustomerService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.util.List;

/**
 * Appointment Controller for Module 1 - Appointment Booking
 */
@Controller
@RequestMapping("/appointment")
public class AppointmentController {
    
    @Autowired
    private AppointmentService appointmentService;
    
    @Autowired
    private CustomerService customerService;
    
    /**
     * Show appointment booking form
     * GET /appointment/book/{customerId}
     */
    @GetMapping("/book/{customerId}")
    public String showBookingForm(@PathVariable Long customerId, HttpSession session, Model model) {
        // Check if user is logged in
        Long sessionCustomerId = (Long) session.getAttribute("customerId");
        if (sessionCustomerId == null) {
            return "redirect:/login/customer";
        }
        
        Customer customer = customerService.getCustomerById(customerId)
                .orElseThrow(() -> new IllegalArgumentException("Customer not found with ID: " + customerId));
        
        model.addAttribute("customer", customer);
        model.addAttribute("appointment", new Appointment());
        model.addAttribute("serviceTypes", Appointment.ServiceType.values());
        
        return "book-appointment";
    }
    
    /**
     * Process appointment booking
     * POST /appointment/book
     */
    @PostMapping("/book")
    public String bookAppointment(@ModelAttribute Appointment appointment,
                                   @RequestParam Long customerId,
                                   RedirectAttributes redirectAttributes) {
        try {
            // Get customer
            Customer customer = customerService.getCustomerById(customerId)
                    .orElseThrow(() -> new IllegalArgumentException("Customer not found"));
            
            appointment.setCustomer(customer);
            
            // Book appointment
            Appointment savedAppointment = appointmentService.bookAppointment(appointment);
            
            redirectAttributes.addFlashAttribute("success", true);
            redirectAttributes.addFlashAttribute("appointment", savedAppointment);
            redirectAttributes.addFlashAttribute("message", "Appointment booked successfully!");
            
            return "redirect:/appointment/success/" + savedAppointment.getId();
            
        } catch (IllegalArgumentException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
            return "redirect:/appointment/book/" + customerId;
        }
    }
    
    /**
     * Show appointment success page
     * GET /appointment/success/{appointmentId}
     */
    @GetMapping("/success/{appointmentId}")
    public String appointmentSuccess(@PathVariable Long appointmentId, Model model) {
        Appointment appointment = appointmentService.getAppointmentById(appointmentId)
                .orElseThrow(() -> new IllegalArgumentException("Appointment not found"));
        
        model.addAttribute("appointment", appointment);
        return "appointment-success";
    }
    
    /**
     * Show customer's appointments list
     * GET /appointment/list/{customerId}
     */
    @GetMapping("/list/{customerId}")
    public String listAppointments(@PathVariable Long customerId, HttpSession session, Model model) {
        // Check if user is logged in
        Long sessionCustomerId = (Long) session.getAttribute("customerId");
        if (sessionCustomerId == null) {
            return "redirect:/login/customer";
        }
        
        Customer customer = customerService.getCustomerById(customerId)
                .orElseThrow(() -> new IllegalArgumentException("Customer not found"));
        
        List<Appointment> upcomingAppointments = appointmentService.getUpcomingAppointments(customerId);
        List<Appointment> pastAppointments = appointmentService.getPastAppointments(customerId);
        
        model.addAttribute("customer", customer);
        model.addAttribute("upcomingAppointments", upcomingAppointments);
        model.addAttribute("pastAppointments", pastAppointments);
        
        return "appointment-list";
    }
}
