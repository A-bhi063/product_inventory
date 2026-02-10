package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Cart;
import com.entity.Product;
import com.repository.CartRepository;

@Service
public class CartService {

	@Autowired
	private CartRepository cartRepository;

	public Cart addToCart(Cart cart) {
		if (cart == null) {
			throw new IllegalArgumentException("Cart cannot be null");
		}
		return this.cartRepository.save(cart);
	}

	public List<Cart> getCartByUser(int userId) {
		return cartRepository.findByUserId(userId);
	}

	@Transactional
	public void addProductToCart(int userId, Product product) {

		// Check if product already exists in cart
		List<Cart> userCarts = cartRepository.findByUserId(userId);
		Cart existing = userCarts.stream()
				.filter(cart -> cart.getProduct().getId() == product.getId())
				.findFirst()
				.orElse(null);

		if (existing != null) {
			// Product already exists → increase quantity
			existing.setQuantity(existing.getQuantity() + 1);
			cartRepository.save(existing);
		} else {
			// New cart item
			Cart cart = new Cart();
			cart.setProduct(product);
			cart.setUserId(userId);
			cart.setQuantity(1);

			cartRepository.save(cart);
		}
	}

	// delete items from cart
	public void deleteByCartId(int id) {
		cartRepository.deleteById(id);
	}

}
