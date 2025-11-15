package com.garage.repository;

import com.garage.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.Optional;

/**
 * Customer Repository for Module 1 - Appointment Booking
 */
@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {
    
    /**
     * Find customer by user ID
     */
    Optional<Customer> findByUserId(Long userId);
    
    /**
     * Find customer by email (through user relationship)
     */
    @Query("SELECT c FROM Customer c WHERE c.user.email = :email")
    Optional<Customer> findByEmail(@Param("email") String email);
    
    /**
     * Find customer by username (through user relationship)
     */
    @Query("SELECT c FROM Customer c WHERE c.user.username = :username")
    Optional<Customer> findByUsername(@Param("username") String username);
    
    /**
     * Find customer by phone (through user relationship)
     */
    @Query("SELECT c FROM Customer c WHERE c.user.phone = :phone")
    Optional<Customer> findByPhone(@Param("phone") String phone);
}
