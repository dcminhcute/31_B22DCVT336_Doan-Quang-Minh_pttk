package com.garage.repository;

import com.garage.entity.Appointment;
import com.garage.entity.Appointment.AppointmentStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

/**
 * Appointment Repository for Module 1 - Appointment Booking
 */
@Repository
public interface AppointmentRepository extends JpaRepository<Appointment, Long> {
    
    /**
     * Find appointments by customer ID
     */
    List<Appointment> findByCustomerId(Long customerId);
    
    /**
     * Find appointments by customer ID ordered by date descending
     */
    List<Appointment> findByCustomerIdOrderByAppointmentDateDescAppointmentTimeDesc(Long customerId);
    
    /**
     * Find appointments by appointment date
     */
    List<Appointment> findByAppointmentDate(LocalDate appointmentDate);
    
    /**
     * Find appointments by date range
     */
    List<Appointment> findByAppointmentDateBetween(LocalDate startDate, LocalDate endDate);
    
    /**
     * Find appointments by status
     */
    List<Appointment> findByStatus(AppointmentStatus status);
    
    /**
     * Check if time slot is available
     * Returns true if slot is already taken
     */
    @Query("SELECT COUNT(a) > 0 FROM Appointment a " +
           "WHERE a.appointmentDate = :date " +
           "AND a.appointmentTime = :time " +
           "AND a.status NOT IN ('CANCELLED')")
    boolean isTimeSlotTaken(@Param("date") LocalDate date, @Param("time") LocalTime time);
    
    /**
     * Find upcoming appointments for a customer
     */
    @Query("SELECT a FROM Appointment a " +
           "WHERE a.customer.id = :customerId " +
           "AND a.appointmentDate >= :today " +
           "AND a.status IN ('PENDING', 'CONFIRMED') " +
           "ORDER BY a.appointmentDate ASC, a.appointmentTime ASC")
    List<Appointment> findUpcomingAppointments(@Param("customerId") Long customerId, 
                                                @Param("today") LocalDate today);
    
    /**
     * Find past appointments for a customer
     */
    @Query("SELECT a FROM Appointment a " +
           "WHERE a.customer.id = :customerId " +
           "AND (a.appointmentDate < :today OR a.status = 'COMPLETED') " +
           "ORDER BY a.appointmentDate DESC, a.appointmentTime DESC")
    List<Appointment> findPastAppointments(@Param("customerId") Long customerId, 
                                           @Param("today") LocalDate today);
    
    /**
     * Count appointments by date
     */
    long countByAppointmentDate(LocalDate appointmentDate);
}
