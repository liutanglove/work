package com.zpark.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zpark.entity.Product;
import com.zpark.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private ProductService ps;
	@RequestMapping("/insertProduct")
	public String insertProduct(Product product,HttpServletRequest req){
		ps.addProduct(product, req);
		return "redirect:/product/queryAll";
	}
	@RequestMapping("/queryAll")
	public String queryAll(HttpServletRequest request){
		List<Product> list = ps.queryAllProduct();
		request.setAttribute("list", list);
		return "forward:/back/product/list.jsp";
	}
}
