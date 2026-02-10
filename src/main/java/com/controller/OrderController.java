package com.controller;

import java.util.List;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.Order;
import com.entity.Product;
import com.service.OrderService;
import com.service.ProductService;

@Controller
public class OrderController {

	@Autowired
	private ProductService productService;

	@Autowired
	private OrderService orderService;

	@RequestMapping("/add-to-buy")
	public String buyProduct(@RequestParam("productId") int productId, Model m) {

		Product product = productService.getProductById(productId);
		m.addAttribute("product", product);

		return "buy-product-page";
	}

	@RequestMapping("/place-order")
	public String placeOrder(
			@RequestParam("productId") int productId,
			@RequestParam("quantity") int quantity,
			@RequestParam("address") String address,
			HttpSession session,
			Model m) {

		int userId = (int) session.getAttribute("user_id");

		Product product = productService.getProductById(productId);

		// Check available quantity before placing order-------------------

		if (product.getQuantity() < quantity) {
			m.addAttribute("error", "Requested product/ quantity of product not available");
			m.addAttribute("product", product);
			return "buy-product-page";
		}

		// ⭐ Reduce product quantity-----------------------------------
		productService.reduceQuantity(productId, quantity);

		// Create order
		Order order = new Order();
		order.setProduct(product);
		order.setQuantity(quantity);
		order.setAddress(address);
		order.setUserId(userId);
		order.setTotalPrice(product.getPrice() * quantity);

		orderService.saveOrder(order);

		m.addAttribute("order", order);
		m.addAttribute("product", product);

		return "order-success";
	}

	// show orders in myOrder option---------------------------

	@GetMapping("/my-orders")
	public String viewMyOrders(HttpSession session, Model m) {
		// Get logged-in user
		Object loggedUser = session.getAttribute("loggedUser");
		if (loggedUser == null) {
			return "redirect:/login"; // not logged in
		}

		int userId = (int) session.getAttribute("user_id");

		// Fetch orders for this user
		List<Order> orders = orderService.getOrdersByUserId(userId);
		m.addAttribute("orders", orders);

		return "my-orders";
	}

	// get details of a specific contumer using userID
	@RequestMapping("/order-customer")
	public String getCustomerDetailsById(@RequestParam("userId") int userId, Model model) {
		List<Order> orderList = orderService.getOrdersByUserId(userId);
		model.addAttribute("orders", orderList);
		return "admin_customer_orders";
	}

}
