package com.zpark.test;

import java.util.UUID;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.zpark.dao.UserDAO;
import com.zpark.entity.User;
import com.zpark.service.UserService;

public class TestUser {
	@Test
	public void testSelectUser(){
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("com/zpark/spring/applicationContext.xml");
		UserDAO ud = (UserDAO) context.getBean("userDAO");
		User u = new User("admin", "admin");
		User user = ud.selectUser(u);
		System.out.println(user);
	}
	@Test
	public void testQueryUser(){
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("com/zpark/spring/applicationContext.xml");
		UserService us = (UserService) context.getBean("userServiceImpl");
		User u = new User("admin", "admin");
		User user = us.queryUser(u);
		System.out.println(user);
	}
	
}
