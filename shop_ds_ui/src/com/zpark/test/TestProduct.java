package com.zpark.test;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import oracle.net.aso.p;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.zpark.dao.ImageDAO;
import com.zpark.dao.ProductDAO;
import com.zpark.entity.Image;
import com.zpark.entity.Product;

public class TestProduct {
	@Test
	public void testInsertproduct(){
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("com/zpark/spring/applicationContext.xml");
		ProductDAO pd = (ProductDAO) context.getBean("productDAO");
		Product p = new Product("001", "尚都比拉女装2013夏装新款蕾丝连衣裙 韩版修身雪纺打底", "002","001"+UUID.randomUUID().toString().substring(0,8), 998.00, 1000.00, "Y","100", "/back/img/5.gif", "aaa");
		pd.insertProduct(p);
	}
	@Test
	public void testInsertImage(){
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("com/zpark/spring/applicationContext.xml");
		ImageDAO id = (ImageDAO) context.getBean("imageDAO");
		Image image = new Image("001", "/back/img/1_large.jpg", "001", "/back/img/1_small.jpg", "/back/img/1_medium.jpg", "hehe", "1");
		id.insertImage(image);
	}
	@Test
	public void testSelectproduct(){
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("com/zpark/spring/applicationContext.xml");
		ProductDAO pd = (ProductDAO) context.getBean("productDAO");
		List<Product> list = pd.selectAllProduct();
		for (Product product : list) {
			System.out.println(product);
			System.out.println("\t"+product.getCategory().getName());
		}
	}
}
