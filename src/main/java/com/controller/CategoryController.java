package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entity.Category;
import com.service.CategoryService;

@Controller
public class CategoryController {

	@Autowired
	private CategoryService categoryService;

	@RequestMapping("/manage-categories")
	public String addCategorycont(Model model) {
		List<Category> list = categoryService.getAllCategorySer();
		model.addAttribute("categoryList", list);
		return "adminCategory";
	}

	@RequestMapping("/save-category")
	public String saveCategoryCont(@ModelAttribute Category category) {
		this.categoryService.saveCategorySer(category);
		return "redirect:/manage-inventory";
	}
}
