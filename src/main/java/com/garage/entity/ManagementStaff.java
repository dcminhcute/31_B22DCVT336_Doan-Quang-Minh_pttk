package com.garage.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDate;

/**
 * Management Staff Entity for Module 2
 */
@Entity
@Table(name = "management_staff")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ManagementStaff {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;
    
    @Column(name = "staff_code", nullable = false, unique = true, length = 20)
    private String staffCode;
    
    @Column(length = 50)
    private String position;
    
    @Column(length = 50)
    private String department;
    
    @Column(name = "hire_date")
    private LocalDate hireDate;
    
    /**
     * Helper method to get staff full name
     */
    public String getFullName() {
        return user != null ? user.getFullName() : "";
    }
}
