package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.entity.SignUp;
import com.repository.SignUpRepository;

@Service
public class SignupService {

	@Autowired
	private SignUpRepository signUpRepository;

	// save
	// SAVE with duplicate email check
	@Transactional
	public boolean saveDetails(SignUp signup) {
		// check if email already exists
		SignUp existing = signUpRepository.findByGmail(signup.getGmail());

		if (existing != null) {
			return false; // duplicate email
		}
		this.signUpRepository.save(signup);
		return true;
	}

	public SignUp getSingleDetails(String gmail, String password) {
		SignUp user = signUpRepository.findByGmail(gmail);
		if (user != null && user.getPassword().equals(password)) {
			return user;
		}
		return null;
	}

	public List<SignUp> getAllCustomerDetails() {
		return this.signUpRepository.findAll();
	}

	public void deleteCustomerById(int id) {
		signUpRepository.deleteById(id);
	}
}
