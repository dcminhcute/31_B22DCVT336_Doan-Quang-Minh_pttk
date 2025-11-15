package com.garage.service;

import com.garage.entity.Customer;
import com.garage.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
import java.util.Optional;

/**
 * Customer Service for Module 1 - Appointment Booking
 */
@Service
@Transactional
public class CustomerService {
    
    @Autowired
    private CustomerRepository customerRepository;
    
    /**
     * Get all customers
     */
    public List<Customer> getAllCustomers() {
        return customerRepository.findAll();
    }
    
    /**
     * Get customer by ID
     */
    public Optional<Customer> getCustomerById(Long id) {
        return customerRepository.findById(id);
    }
    
    /**
     * Get customer by user ID
     */
    public Optional<Customer> getCustomerByUserId(Long userId) {
        return customerRepository.findByUserId(userId);
    }
    
    /**
     * Get customer by email
     */
    public Optional<Customer> getCustomerByEmail(String email) {
        return customerRepository.findByEmail(email);
    }
    
    /**
     * Get customer by username
     */
    public Optional<Customer> getCustomerByUsername(String username) {
        return customerRepository.findByUsername(username);
    }
    
    /**
     * Save or update customer
     */
    public Customer saveCustomer(Customer customer) {
        return customerRepository.save(customer);
    }
    
    /**
     * Delete customer by ID
     */
    public void deleteCustomer(Long id) {
        customerRepository.deleteById(id);
    }
    
    /**
     * Check if customer exists by email
     */
    public boolean existsByEmail(String email) {
        return customerRepository.findByEmail(email).isPresent();
    }
}
