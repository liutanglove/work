package com.zpark.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.zpark.entity.Product;

public interface ProductService {
	public void addProduct(Product product,HttpServletRequest req);
	public List<Product> queryAllProduct();
}
