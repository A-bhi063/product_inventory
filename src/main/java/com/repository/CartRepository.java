package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.Cart;

@Repository
public interface CartRepository extends JpaRepository<Cart, Integer> {

    // Find cart items by user ID
    List<Cart> findByUserId(int userId);

    // Delete cart items by user ID
    void deleteByUserId(int userId);
}
