package com.garage.dao;

import com.garage.entity.Supplier;
import com.garage.repository.SupplierRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

/**
 * Supplier DAO for Module 2 - Supplier Statistics
 * Data Access Object for Supplier entity
 */
@Component
public class SupplierDAO implements DAO<Supplier, Long> {
    
    @Autowired
    private SupplierRepository supplierRepository;
    
    @Override
    public Supplier save(Supplier supplier) {
        return supplierRepository.save(supplier);
    }
    
    @Override
    public Optional<Supplier> findById(Long id) {
        return supplierRepository.findById(id);
    }
    
    @Override
    public List<Supplier> findAll() {
        return supplierRepository.findAll();
    }
    
    @Override
    public void deleteById(Long id) {
        supplierRepository.deleteById(id);
    }
    
    @Override
    public boolean existsById(Long id) {
        return supplierRepository.existsById(id);
    }
    
    @Override
    public long count() {
        return supplierRepository.count();
    }
    
    /**
     * Find supplier by supplier code
     * @param supplierCode Supplier code
     * @return Optional containing supplier if found
     */
    public Optional<Supplier> findBySupplierCode(String supplierCode) {
        return supplierRepository.findBySupplierCode(supplierCode);
    }
    
    /**
     * Search suppliers by name (case-insensitive)
     * @param name Supplier name to search
     * @return List of suppliers matching the name
     */
    public List<Supplier> findBySupplierNameContaining(String name) {
        return supplierRepository.findBySupplierNameContainingIgnoreCase(name);
    }
    
    /**
     * Find suppliers by city
     * @param city City name
     * @return List of suppliers in that city
     */
    public List<Supplier> findByCity(String city) {
        return supplierRepository.findByCity(city);
    }
    
    /**
     * Get supplier list with imported quantities within date range
     * @param startDate Start date
     * @param endDate End date
     * @return List of Object arrays containing supplier statistics
     */
    public List<Object[]> getSupplierListWithQuantity(LocalDate startDate, LocalDate endDate) {
        return supplierRepository.getSupplierStatisticsByQuantity(startDate, endDate);
    }
    
    /**
     * Get supplier with details (for viewing supplier information)
     * @param supplierId Supplier ID
     * @return Optional containing supplier with full details
     */
    public Optional<Supplier> getSupplierWithDetails(Long supplierId) {
        return supplierRepository.findById(supplierId);
    }
}
