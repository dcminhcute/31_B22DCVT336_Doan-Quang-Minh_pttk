package com.garage.dao;

import com.garage.entity.Appointment;
import com.garage.entity.Appointment.AppointmentStatus;
import com.garage.repository.AppointmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Optional;

/**
 * Appointment DAO for Module 1 - Appointment Booking
 * Data Access Object for Appointment entity
 */
@Component
public class AppointmentDAO implements DAO<Appointment, Long> {
    
    @Autowired
    private AppointmentRepository appointmentRepository;
    
    @Override
    public Appointment save(Appointment appointment) {
        return appointmentRepository.save(appointment);
    }
    
    /**
     * Save appointment (specific method name from design document)
     * @param appointment Appointment to save
     * @return Saved appointment
     */
    public Appointment saveAppointment(Appointment appointment) {
        return appointmentRepository.save(appointment);
    }
    
    @Override
    public Optional<Appointment> findById(Long id) {
        return appointmentRepository.findById(id);
    }
    
    @Override
    public List<Appointment> findAll() {
        return appointmentRepository.findAll();
    }
    
    @Override
    public void deleteById(Long id) {
        appointmentRepository.deleteById(id);
    }
    
    @Override
    public boolean existsById(Long id) {
        return appointmentRepository.existsById(id);
    }
    
    @Override
    public long count() {
        return appointmentRepository.count();
    }
    
    /**
     * Find appointments by customer ID
     * @param customerId Customer ID
     * @return List of appointments
     */
    public List<Appointment> findByCustomerId(Long customerId) {
        return appointmentRepository.findByCustomerId(customerId);
    }
    
    /**
     * Find appointments by customer ID ordered by date descending
     * @param customerId Customer ID
     * @return List of appointments
     */
    public List<Appointment> findByCustomerIdOrderByDate(Long customerId) {
        return appointmentRepository.findByCustomerIdOrderByAppointmentDateDescAppointmentTimeDesc(customerId);
    }
    
    /**
     * Find appointments by date
     * @param date Appointment date
     * @return List of appointments
     */
    public List<Appointment> findByAppointmentDate(LocalDate date) {
        return appointmentRepository.findByAppointmentDate(date);
    }
    
    /**
     * Find appointments by date range
     * @param startDate Start date
     * @param endDate End date
     * @return List of appointments
     */
    public List<Appointment> findByDateRange(LocalDate startDate, LocalDate endDate) {
        return appointmentRepository.findByAppointmentDateBetween(startDate, endDate);
    }
    
    /**
     * Find appointments by status
     * @param status Appointment status
     * @return List of appointments
     */
    public List<Appointment> findByStatus(AppointmentStatus status) {
        return appointmentRepository.findByStatus(status);
    }
    
    /**
     * Find upcoming appointments for a customer
     * @param customerId Customer ID
     * @param currentDate Current date
     * @return List of upcoming appointments
     */
    public List<Appointment> findUpcomingAppointments(Long customerId, LocalDate currentDate) {
        return appointmentRepository.findUpcomingAppointments(customerId, currentDate);
    }
    
    /**
     * Find past appointments for a customer
     * @param customerId Customer ID
     * @param currentDate Current date
     * @return List of past appointments
     */
    public List<Appointment> findPastAppointments(Long customerId, LocalDate currentDate) {
        return appointmentRepository.findPastAppointments(customerId, currentDate);
    }
    
    /**
     * Check if time slot is already taken
     * @param date Appointment date
     * @param time Appointment time
     * @return true if time slot is taken, false otherwise
     */
    public boolean isTimeSlotTaken(LocalDate date, LocalTime time) {
        return appointmentRepository.isTimeSlotTaken(date, time);
    }
    
    /**
     * Count appointments by date
     * @param date Appointment date
     * @return Number of appointments on that date
     */
    public long countByDate(LocalDate date) {
        return appointmentRepository.countByAppointmentDate(date);
    }
}
