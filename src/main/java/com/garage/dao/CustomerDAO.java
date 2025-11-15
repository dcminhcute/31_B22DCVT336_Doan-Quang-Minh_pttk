package com.garage.dao;

import com.garage.entity.Customer;
import com.garage.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

/**
 * Customer DAO for Module 1 - Appointment Booking
 * Data Access Object for Customer entity
 */
@Component
public class CustomerDAO implements DAO<Customer, Long> {
    
    @Autowired
    private CustomerRepository customerRepository;
    
    @Override
    public Customer save(Customer customer) {
        return customerRepository.save(customer);
    }
    
    @Override
    public Optional<Customer> findById(Long id) {
        return customerRepository.findById(id);
    }
    
    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }
    
    @Override
    public void deleteById(Long id) {
        customerRepository.deleteById(id);
    }
    
    @Override
    public boolean existsById(Long id) {
        return customerRepository.existsById(id);
    }
    
    @Override
    public long count() {
        return customerRepository.count();
    }
    
    /**
     * Find customer by user ID
     * @param userId User ID
     * @return Optional containing customer if found
     */
    public Optional<Customer> findByUserId(Long userId) {
        return customerRepository.findByUserId(userId);
    }
    
    /**
     * Find customer by email
     * @param email Customer email
     * @return Optional containing customer if found
     */
    public Optional<Customer> findByEmail(String email) {
        return customerRepository.findByEmail(email);
    }
    
    /**
     * Find customer by username
     * @param username Username
     * @return Optional containing customer if found
     */
    public Optional<Customer> findByUsername(String username) {
        return customerRepository.findByUsername(username);
    }
    
    /**
     * Find customer by phone
     * @param phone Phone number
     * @return Optional containing customer if found
     */
    public Optional<Customer> findByPhone(String phone) {
        return customerRepository.findByPhone(phone);
    }
    
    /**
     * Check if customer exists by email
     * @param email Customer email
     * @return true if exists, false otherwise
     */
    public boolean existsByEmail(String email) {
        return customerRepository.findByEmail(email).isPresent();
    }
}
