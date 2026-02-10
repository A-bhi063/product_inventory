package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entity.Category;
import com.repository.CategoryRepository;

@Service
public class CategoryService {

	@Autowired
	private CategoryRepository categoryRepository;

	@SuppressWarnings("null")
	public Category saveCategorySer(Category category) {
		return this.categoryRepository.save(category);
	}

	public List<Category> getAllCategorySer() {
		return this.categoryRepository.findAll();
	}

	public Category getCategoryById(int id) {
		return this.categoryRepository.findById(id).orElse(null);
	}
}
