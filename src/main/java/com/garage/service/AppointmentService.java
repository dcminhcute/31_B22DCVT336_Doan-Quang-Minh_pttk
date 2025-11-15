package com.garage.service;

import com.garage.entity.Appointment;
import com.garage.entity.Appointment.AppointmentStatus;
import com.garage.repository.AppointmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Optional;

/**
 * Appointment Service for Module 1 - Appointment Booking
 */
@Service
@Transactional
public class AppointmentService {
    
    @Autowired
    private AppointmentRepository appointmentRepository;
    
    /**
     * Book a new appointment
     * Validates the appointment before saving
     */
    public Appointment bookAppointment(Appointment appointment) throws IllegalArgumentException {
        // Validate appointment
        validateAppointment(appointment);
        
        // Check time slot availability
        if (!isTimeSlotAvailable(appointment.getAppointmentDate(), appointment.getAppointmentTime())) {
            throw new IllegalArgumentException("Time slot is already taken. Please choose another time.");
        }
        
        // Set default status if not set
        if (appointment.getStatus() == null) {
            appointment.setStatus(AppointmentStatus.PENDING);
        }
        
        return appointmentRepository.save(appointment);
    }
    
    /**
     * Validate appointment data
     */
    public void validateAppointment(Appointment appointment) throws IllegalArgumentException {
        if (appointment.getCustomer() == null) {
            throw new IllegalArgumentException("Customer is required");
        }
        
        if (appointment.getAppointmentDate() == null) {
            throw new IllegalArgumentException("Appointment date is required");
        }
        
        if (appointment.getAppointmentTime() == null) {
            throw new IllegalArgumentException("Appointment time is required");
        }
        
        if (appointment.getServiceType() == null) {
            throw new IllegalArgumentException("Service type is required");
        }
        
        // Check if appointment date is in the past
        if (appointment.getAppointmentDate().isBefore(LocalDate.now())) {
            throw new IllegalArgumentException("Cannot book appointment for past dates");
        }
        
        // Check if appointment is for today but time has passed
        if (appointment.getAppointmentDate().isEqual(LocalDate.now()) && 
            appointment.getAppointmentTime().isBefore(LocalTime.now())) {
            throw new IllegalArgumentException("Cannot book appointment for past times");
        }
    }
    
    /**
     * Check if time slot is available
     */
    public boolean isTimeSlotAvailable(LocalDate date, LocalTime time) {
        return !appointmentRepository.isTimeSlotTaken(date, time);
    }
    
    /**
     * Get all appointments
     */
    public List<Appointment> getAllAppointments() {
        return appointmentRepository.findAll();
    }
    
    /**
     * Get appointment by ID
     */
    public Optional<Appointment> getAppointmentById(Long id) {
        return appointmentRepository.findById(id);
    }
    
    /**
     * Get appointments by customer ID
     */
    public List<Appointment> getAppointmentsByCustomer(Long customerId) {
        return appointmentRepository.findByCustomerIdOrderByAppointmentDateDescAppointmentTimeDesc(customerId);
    }
    
    /**
     * Get upcoming appointments for a customer
     */
    public List<Appointment> getUpcomingAppointments(Long customerId) {
        return appointmentRepository.findUpcomingAppointments(customerId, LocalDate.now());
    }
    
    /**
     * Get past appointments for a customer
     */
    public List<Appointment> getPastAppointments(Long customerId) {
        return appointmentRepository.findPastAppointments(customerId, LocalDate.now());
    }
    
    /**
     * Update appointment status
     */
    public Appointment updateAppointmentStatus(Long appointmentId, AppointmentStatus status) {
        Optional<Appointment> appointmentOpt = appointmentRepository.findById(appointmentId);
        if (appointmentOpt.isPresent()) {
            Appointment appointment = appointmentOpt.get();
            appointment.setStatus(status);
            return appointmentRepository.save(appointment);
        }
        throw new IllegalArgumentException("Appointment not found with ID: " + appointmentId);
    }
    
    /**
     * Cancel appointment
     */
    public Appointment cancelAppointment(Long appointmentId) {
        return updateAppointmentStatus(appointmentId, AppointmentStatus.CANCELLED);
    }
    
    /**
     * Confirm appointment
     */
    public Appointment confirmAppointment(Long appointmentId) {
        return updateAppointmentStatus(appointmentId, AppointmentStatus.CONFIRMED);
    }
    
    /**
     * Delete appointment
     */
    public void deleteAppointment(Long id) {
        appointmentRepository.deleteById(id);
    }
}
