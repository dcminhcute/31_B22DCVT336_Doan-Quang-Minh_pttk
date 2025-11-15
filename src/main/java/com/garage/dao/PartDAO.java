package com.garage.dao;

import com.garage.entity.Sparepart;
import com.garage.repository.SparepartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

/**
 * Part DAO (Sparepart DAO) for Module 2 - Supplier Statistics
 * Data Access Object for Sparepart entity
 */
@Component
public class PartDAO implements DAO<Sparepart, Long> {
    
    @Autowired
    private SparepartRepository sparepartRepository;
    
    @Override
    public Sparepart save(Sparepart sparepart) {
        return sparepartRepository.save(sparepart);
    }
    
    @Override
    public Optional<Sparepart> findById(Long id) {
        return sparepartRepository.findById(id);
    }
    
    @Override
    public List<Sparepart> findAll() {
        return sparepartRepository.findAll();
    }
    
    @Override
    public void deleteById(Long id) {
        sparepartRepository.deleteById(id);
    }
    
    @Override
    public boolean existsById(Long id) {
        return sparepartRepository.existsById(id);
    }
    
    @Override
    public long count() {
        return sparepartRepository.count();
    }
    
    /**
     * Find sparepart by part code
     * @param partCode Part code
     * @return Optional containing sparepart if found
     */
    public Optional<Sparepart> findByPartCode(String partCode) {
        return sparepartRepository.findByPartCode(partCode);
    }
    
    /**
     * Find spareparts by category
     * @param category Part category
     * @return List of spareparts in that category
     */
    public List<Sparepart> findByCategory(Sparepart.PartCategory category) {
        return sparepartRepository.findByCategory(category);
    }
    
    /**
     * Find spareparts with low stock (below minimum stock level)
     * @return List of spareparts with low stock
     */
    public List<Sparepart> findLowStockParts() {
        return sparepartRepository.findByCurrentStockLessThanMinStock();
    }
    
    /**
     * Search spareparts by name (case-insensitive)
     * @param partName Part name to search
     * @return List of spareparts matching the name
     */
    public List<Sparepart> findByPartNameContaining(String partName) {
        return sparepartRepository.findByPartNameContainingIgnoreCase(partName);
    }
    
    /**
     * Update sparepart stock
     * @param partId Part ID
     * @param quantity Quantity to add (positive) or subtract (negative)
     * @return Updated sparepart
     */
    public Sparepart updateStock(Long partId, int quantity) {
        Optional<Sparepart> sparepartOpt = sparepartRepository.findById(partId);
        if (sparepartOpt.isPresent()) {
            Sparepart sparepart = sparepartOpt.get();
            sparepart.setCurrentStock(sparepart.getCurrentStock() + quantity);
            return sparepartRepository.save(sparepart);
        }
        return null;
    }
}
