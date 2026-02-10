package com.controller;

import java.util.List;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.Cart;
import com.entity.Product;
import com.service.CartService;
import com.service.ProductService;

@Controller
public class CartController {

	@Autowired
	private ProductService productService;

	@Autowired
	private CartService cartService;

	@RequestMapping("/add-to-cart")
	public String addToCart(@RequestParam("productId") int productId,
			HttpSession session) {

		Integer userId = (Integer) session.getAttribute("user_id");

		if (userId == null) {
			return "redirect:/login";
		}

		Product product = productService.getProductById(productId);
		cartService.addProductToCart(userId, product);

		return "redirect:/products-by-category?category_id=69";
	}

	@RequestMapping("/view-cart")
	public String viewCart(HttpSession session, Model model) {

		Integer userId = (Integer) session.getAttribute("user_id");

		List<Cart> list = cartService.getCartByUser(userId);
		model.addAttribute("cartItems", list);

		return "cart";
	}

	// buy product by ID

	// @RequestMapping("/add-to-buy")
	// private void buy(@RequestParam("productId") int productId) {
	// this.productService.getProductById(productId);
	// }

	// delte product from cart

	@RequestMapping("/delete-cart")
	public String deleteCart(@RequestParam("id") int id) {
		cartService.deleteByCartId(id);
		return "redirect:/view-cart";

	}

}
