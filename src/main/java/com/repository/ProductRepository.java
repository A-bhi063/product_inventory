package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {

    // Find products by category ID
    List<Product> findByCategoryId(int categoryId);

    // Search products by name (case insensitive, partial match)
    List<Product> findByNameContainingIgnoreCase(String name);
}
