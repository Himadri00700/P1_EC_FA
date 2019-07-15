package com.ecomm.dao;

import java.util.List;

import com.ecomm.model.Product;

public interface ProductDAO {
	
	public boolean addProduct(Product product);
	
	public boolean updateProduct(Product product);
	
	public boolean deleteProduct(Product product);
	
	public List<Product> listProducts();
	
	public List<Product> listProductsCategoryWise(int categoryId);
	
	public Product getProduct(int productId);

}
