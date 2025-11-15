package com.garage.dao;

import java.util.List;
import java.util.Optional;

/**
 * Base DAO Interface
 * Generic Data Access Object interface for all entities
 * @param <T> Entity type
 * @param <ID> Primary key type
 */
public interface DAO<T, ID> {
    
    /**
     * Save or update an entity
     * @param entity Entity to save
     * @return Saved entity
     */
    T save(T entity);
    
    /**
     * Find entity by ID
     * @param id Entity ID
     * @return Optional containing the entity if found
     */
    Optional<T> findById(ID id);
    
    /**
     * Find all entities
     * @return List of all entities
     */
    List<T> findAll();
    
    /**
     * Delete entity by ID
     * @param id Entity ID to delete
     */
    void deleteById(ID id);
    
    /**
     * Check if entity exists by ID
     * @param id Entity ID
     * @return true if exists, false otherwise
     */
    boolean existsById(ID id);
    
    /**
     * Count total entities
     * @return Total count
     */
    long count();
}
