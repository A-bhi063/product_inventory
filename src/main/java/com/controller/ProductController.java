package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.Category;
import com.entity.Product;
import com.service.CategoryService;
import com.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;

	@RequestMapping("/add-product")
	public String addCategoryProduct(@RequestParam("category_id") int id, Model m) {

		return "addProduct";

	}

	@PostMapping("/save-product")
	public String addOneProduct(@RequestParam int category_id, Product product) {

		Category category = categoryService.getCategoryById(category_id);
		product.setCategory(category);

		this.productService.saveProductCon(product);
		return "redirect:/manage-inventory";
	}

	@RequestMapping("/showProduct/{category_id}")
	public String viewProducts(@PathVariable("category_id") int category_id, Model model) {
		List<Product> list = productService.getAllProductByCategory(category_id);
		model.addAttribute("products", list);
		return "showProduct";

	}

	// //for search product by their name
	// @RequestMapping("/search")
	// public String searchProducts(@RequestParam("keyword") String keyword, Model
	// model) {
	//
	// List<Product> products = productService.searchProducts(keyword);
	// model.addAttribute("products", products);
	// model.addAttribute("keyword", keyword);
	//
	// return "search-results"; // JSP page to show results
	// }

	// delete product
	// @GetMapping("/deleteProduct/{id}")
	// public String deleteProductById(@PathVariable int id) {
	// productService.deleteProductById(id);
	// return "redirect:/showProduct";
	// }

}
