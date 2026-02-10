package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.Category;
import com.entity.Product;
import com.service.CategoryService;
import com.service.ProductService;

@Controller
public class CustomerController {

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private ProductService productService;

	@RequestMapping("/view-category")
	public String viewCategory(Model model) {
		List<Category> list = this.categoryService.getAllCategorySer();
		model.addAttribute("viewCategory", list);
		return "view-category";
	}

	@RequestMapping("/products-by-category")
	public String getProductByID(@RequestParam("category_id") int category_id, Model model) {
		List<Product> list = this.productService.getAllProductByCategory(category_id);
		model.addAttribute("products", list);
		return "customer_products";
	}

	// for coming back to dashboard page--------------------------------

}
