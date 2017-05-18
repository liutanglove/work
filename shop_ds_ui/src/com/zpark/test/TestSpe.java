package com.zpark.test;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.zpark.dao.SpecItemDAO;
import com.zpark.dao.SpecOptionDAO;
import com.zpark.entity.SpeItem;
import com.zpark.entity.SpeOption;


public class TestSpe {
	@Test
	public void testSelectSpe(){
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("com/zpark/spring/applicationContext.xml");
		SpecItemDAO sd = (SpecItemDAO) context.getBean("specItemDAO");
		List<SpeItem> list = sd.selectAll();
		for (SpeItem si : list) {
			System.out.println(si);
			for (SpeOption so : si.getList()) {
				System.out.println("\t"+so);
			}
		}
	}
	@Test
	public void testInsertSpe(){
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("com/zpark/spring/applicationContext.xml");
		SpecItemDAO sd = (SpecItemDAO) context.getBean("specItemDAO");
		SpeItem si = new SpeItem("009", "尺码", "文本", null, "5", new Timestamp(new Date().getTime()), new Timestamp(new Date().getTime()));
		sd.insert(si);
	}
	@Test
	public void testInsertSpeOption(){
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("com/zpark/spring/applicationContext.xml");
		SpecOptionDAO sod = (SpecOptionDAO) context.getBean("specOptionDAO");
		SpeOption so = new SpeOption("013", "38", null, "007", "2", new Timestamp(new Date().getTime()), new Timestamp(new Date().getTime()));
		sod.insert(so);
	}
	@Test
	public void testQueryById(){
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("com/zpark/spring/applicationContext.xml");
		SpecItemDAO sd = (SpecItemDAO) context.getBean("specItemDAO");
		SpeItem item = sd.selectById("001");
		System.out.println(item);
		for (SpeOption so : item.getList()) {
			System.out.println(so);
		}
	}
	@Test
	public void testUpdate(){
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("com/zpark/spring/applicationContext.xml");
		SpecItemDAO sd = (SpecItemDAO) context.getBean("specItemDAO");
		SpeItem si = new SpeItem("006", "尺码11", "文本", null, "5", new Timestamp(new Date().getTime()), new Timestamp(new Date().getTime()));
		sd.update(si);
	}
	@Test
	public void testUpdateOption(){
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("com/zpark/spring/applicationContext.xml");
		SpecOptionDAO sod = (SpecOptionDAO) context.getBean("specOptionDAO");
		SpeOption so = new SpeOption("012", "38", null, "006", "2", new Timestamp(new Date().getTime()), new Timestamp(new Date().getTime()));
		sod.update(so);
	}
	
}
