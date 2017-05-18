package com.zpark.dao;

import java.util.List;

import com.zpark.entity.Product;

public interface ProductDAO {
	public void insertProduct(Product product);
	public List<Product> selectAllProduct();
}
