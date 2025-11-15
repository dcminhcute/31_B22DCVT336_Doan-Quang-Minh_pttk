package com.garage.service;

import com.garage.entity.Supplier;
import com.garage.repository.SupplierRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

/**
 * Supplier Service for Module 2 - Supplier Statistics
 */
@Service
@Transactional
public class SupplierService {
    
    @Autowired
    private SupplierRepository supplierRepository;
    
    /**
     * Get all suppliers
     */
    public List<Supplier> getAllSuppliers() {
        return supplierRepository.findAll();
    }
    
    /**
     * Get supplier by ID
     */
    public Optional<Supplier> getSupplierById(Long id) {
        return supplierRepository.findById(id);
    }
    
    /**
     * Get supplier by supplier code
     */
    public Optional<Supplier> getSupplierByCode(String supplierCode) {
        return supplierRepository.findBySupplierCode(supplierCode);
    }
    
    /**
     * Search suppliers by name
     */
    public List<Supplier> searchSuppliersByName(String name) {
        return supplierRepository.findBySupplierNameContainingIgnoreCase(name);
    }
    
    /**
     * Save or update supplier
     */
    public Supplier saveSupplier(Supplier supplier) {
        return supplierRepository.save(supplier);
    }
    
    /**
     * Delete supplier
     */
    public void deleteSupplier(Long id) {
        supplierRepository.deleteById(id);
    }
    
    /**
     * Get supplier statistics by imported quantity within date range
     * Returns list of maps containing: id, supplierName, supplierCode, totalQuantity
     */
    public List<Map<String, Object>> getSupplierStatisticsByQuantity(LocalDate startDate, LocalDate endDate) {
        List<Object[]> results = supplierRepository.getSupplierStatisticsByQuantity(startDate, endDate);
        List<Map<String, Object>> statistics = new ArrayList<>();
        
        for (Object[] row : results) {
            Map<String, Object> stat = new HashMap<>();
            stat.put("id", row[0]);
            stat.put("supplierName", row[1]);
            stat.put("supplierCode", row[2]);
            stat.put("totalQuantity", row[3]);
            statistics.add(stat);
        }
        
        return statistics;
    }
}
