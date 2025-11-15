package com.garage.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDate;

/**
 * Customer Entity for Module 1 - Appointment Booking
 */
@Entity
@Table(name = "customers")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Customer {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;
    
    @Column(length = 255)
    private String address;
    
    @Column(name = "date_of_birth")
    private LocalDate dateOfBirth;
    
    @Column(name = "vehicle_info", length = 255)
    private String vehicleInfo;
    
    @Column(columnDefinition = "TEXT")
    private String notes;
    
    /**
     * Helper method to get customer full name
     */
    public String getFullName() {
        return user != null ? user.getFullName() : "";
    }
    
    /**
     * Helper method to get customer email
     */
    public String getEmail() {
        return user != null ? user.getEmail() : "";
    }
    
    /**
     * Helper method to get customer phone
     */
    public String getPhone() {
        return user != null ? user.getPhone() : "";
    }
}
