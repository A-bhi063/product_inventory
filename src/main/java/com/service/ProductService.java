package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.entity.Product;
import com.repository.ProductRepository;

@Service
public class ProductService {

	@Autowired
	private ProductRepository productRepository;

	public Product saveProductCon(Product product) {
		if (product == null) {
			throw new IllegalArgumentException("Product cannot be null");
		}
		return this.productRepository.save(product);
	}

	public List<Product> getAllProductDetails() {
		return this.productRepository.findAll();
	}

	public List<Product> getAllProductByCategory(int category_id) {
		return this.productRepository.findByCategoryId(category_id);
	}

	public Product getProductById(int id) {
		return productRepository.findById(id).orElse(null);
	}

	// reduce quantity
	@Transactional
	public void reduceQuantity(int productId, int quantity) {
		Product product = getProductById(productId);
		if (product != null) {
			product.setQuantity(product.getQuantity() - quantity);
			productRepository.save(product);
		}
	}

	// for search product by their name
	public List<Product> searchProducts(String keyword) {
		return productRepository.findByNameContainingIgnoreCase(keyword);
	}

	// delete product
	public void deleteProductById(int id) {
		productRepository.deleteById(id);
	}

}
