package com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {

    // Find orders by user ID
    List<Order> findByUserId(int userId);

    // Find orders by status
    List<Order> findByStatus(String status);
}
