package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.Category;
import com.entity.Order;
import com.entity.Product;
import com.entity.SignUp;
import com.service.CategoryService;
import com.service.OrderService;
import com.service.ProductService;
import com.service.SignupService;

@Controller
public class AdminController {

	@Autowired
	private SignupService signupService;

	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private OrderService orderService;

	@GetMapping("/admin-dashboard")
	public String showAdminDashboard(Model model) {
		// Get statistics for dashboard
		long totalProducts = productService.getAllProductDetails().size();
		long totalCategories = categoryService.getAllCategorySer().size();
		long totalOrders = orderService.getAllOrders().size();
		long totalCustomers = signupService.getAllCustomerDetails().size();

		model.addAttribute("totalProducts", totalProducts);
		model.addAttribute("totalCategories", totalCategories);
		model.addAttribute("totalOrders", totalOrders);
		model.addAttribute("totalCustomers", totalCustomers);

		return "adminDashboard";
	}

	@GetMapping("/manage-customers")
	public String showCustomers(Model model) {

		List<SignUp> list = this.signupService.getAllCustomerDetails();
		model.addAttribute("lists", list);
		return "show-customer";
	}

	// Delete customer by ID
	@GetMapping("/delete-customer")
	public String deleteCustomer(@RequestParam("customer_id") int id) {
		signupService.deleteCustomerById(id);
		return "redirect:/manage-customers";
	}

	@GetMapping("/manage-inventory")
	public String manageInventory(Model model) {
		List<Category> categories = categoryService.getAllCategorySer();
		model.addAttribute("categories", categories);
		return "manageInventory";
	}

	@GetMapping("/manage-products")
	public String manageProducts(Model model) {
		List<Product> list = productService.getAllProductDetails();
		model.addAttribute("products", list);
		return "showProduct";
	}

	@GetMapping("/view-orders")
	public String viewAllOrders(Model model) {
		List<Order> list = orderService.getAllOrders();
		model.addAttribute("orders", list);
		return "admin_customer_orders";
	}

	@GetMapping("/deleteProduct/{id}")
	public String deleteProductById(@PathVariable int id) {
		productService.deleteProductById(id);
		return "redirect:/manage-products";
	}
}
