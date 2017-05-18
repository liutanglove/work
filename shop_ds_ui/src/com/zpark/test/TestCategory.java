package com.zpark.test;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import oracle.sql.TIMESTAMP;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.zpark.dao.CategoryDAO;
import com.zpark.entity.Category;

public class TestCategory {
	@Test
	public void testCategory(){
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("com/zpark/spring/applicationContext.xml");
		CategoryDAO cd = (CategoryDAO) context.getBean("categoryDAO");
		List<Category> list = cd.selectAllCategory();
		for (Category c1 : list) {
			System.out.println(c1);
		}
	}
	@Test
	public void testInsertCategory(){
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("com/zpark/spring/applicationContext.xml");
		CategoryDAO cd = (CategoryDAO) context.getBean("categoryDAO");
		Category ca = new Category("14", "T血衫", "2", "004", new Timestamp(new Date().getTime()),new Timestamp(new Date().getTime()));
		cd.insertCategory(ca);
	}
	@Test
	public void testSelectCategoryById(){
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("com/zpark/spring/applicationContext.xml");
		CategoryDAO cd = (CategoryDAO) context.getBean("categoryDAO");
		Category ca = cd.selectCategoryById("14");
		System.out.println(ca);
	}
	@Test
	public void testUpdateCategory(){
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("com/zpark/spring/applicationContext.xml");
		CategoryDAO cd = (CategoryDAO) context.getBean("categoryDAO");
		Category ca = new Category();
		ca.setId("14");
		ca.setName("衬衫");
		ca.setLastUpdateTime(new Timestamp(new Date().getTime()));
		cd.updateCategory(ca);
	}
}
