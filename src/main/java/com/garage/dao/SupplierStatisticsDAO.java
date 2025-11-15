package com.garage.dao;

import com.garage.repository.SupplierRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Supplier Statistics DAO for Module 2 - Supplier Statistics
 * Specialized DAO for supplier statistics queries
 */
@Component
public class SupplierStatisticsDAO {
    
    @Autowired
    private SupplierRepository supplierRepository;
    
    @Autowired
    private SupplierDAO supplierDAO;
    
    /**
     * Get supplier list with imported quantities within date range
     * This method is called from the controller to retrieve statistics
     * @param startDate Start date
     * @param endDate End date
     * @return List of maps containing supplier statistics
     */
    public List<Map<String, Object>> getSupplierList(LocalDate startDate, LocalDate endDate) {
        // Call SupplierDAO to retrieve raw data
        List<Object[]> results = supplierDAO.getSupplierListWithQuantity(startDate, endDate);
        
        // Process and convert to List of Maps
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
    
    /**
     * Get detailed supplier statistics with additional information
     * @param supplierId Supplier ID
     * @param startDate Start date
     * @param endDate End date
     * @return Map containing detailed statistics
     */
    public Map<String, Object> getDetailedSupplierStatistics(Long supplierId, LocalDate startDate, LocalDate endDate) {
        Map<String, Object> statistics = new HashMap<>();
        
        // Get supplier statistics for the date range
        List<Object[]> results = supplierRepository.getSupplierStatisticsByQuantity(startDate, endDate);
        
        // Find the specific supplier in results
        for (Object[] row : results) {
            Long id = (Long) row[0];
            if (id.equals(supplierId)) {
                statistics.put("supplierId", row[0]);
                statistics.put("supplierName", row[1]);
                statistics.put("supplierCode", row[2]);
                statistics.put("totalQuantity", row[3]);
                statistics.put("startDate", startDate);
                statistics.put("endDate", endDate);
                break;
            }
        }
        
        return statistics;
    }
    
    /**
     * Get top suppliers by imported quantity
     * @param startDate Start date
     * @param endDate End date
     * @param limit Number of top suppliers to return
     * @return List of top suppliers
     */
    public List<Map<String, Object>> getTopSuppliers(LocalDate startDate, LocalDate endDate, int limit) {
        List<Map<String, Object>> allStatistics = getSupplierList(startDate, endDate);
        
        // Sort by totalQuantity descending
        allStatistics.sort((a, b) -> {
            Long qtyA = (Long) a.get("totalQuantity");
            Long qtyB = (Long) b.get("totalQuantity");
            return qtyB.compareTo(qtyA);
        });
        
        // Return top N suppliers
        return allStatistics.subList(0, Math.min(limit, allStatistics.size()));
    }
}
