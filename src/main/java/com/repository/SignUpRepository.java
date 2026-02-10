package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.SignUp;

@Repository
public interface SignUpRepository extends JpaRepository<SignUp, Integer> {

    // Find user by username
    SignUp findByUsername(String username);

    // Find user by gmail
    SignUp findByGmail(String gmail);

    // Check if username exists
    boolean existsByUsername(String username);

    // Check if gmail exists
    boolean existsByGmail(String gmail);
}
