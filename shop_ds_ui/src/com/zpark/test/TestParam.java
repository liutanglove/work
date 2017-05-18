package com.zpark.test;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.zpark.dao.ParamDAO;
import com.zpark.entity.Category;
import com.zpark.entity.ParaGroup;
import com.zpark.entity.ParaItem;
import com.zpark.service.ParamService;

public class TestParam {
	@Test
	public void testParagroup(){
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("com/zpark/spring/applicationContext.xml");
		ParamDAO pd = (ParamDAO) context.getBean("paramDAO");
		List<ParaGroup> list = pd.selectParaGroup(null,0,0);
		for (ParaGroup pg : list) {
			System.out.println(pg.toString());
			System.out.println("\t"+pg.getCategory().toString());
			for (ParaItem pi : pg.getItems()) {
				System.out.println("\t"+pi.toString());
			}
		}
	}
	@Test
	public void testInsertParam(){
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("com/zpark/spring/applicationContext.xml");
		ParamService ps = (ParamService) context.getBean("paramServiceImpl");
		ParaGroup pg = new ParaGroup(null, "参数组4", "5", "003", null, null);
		List<ParaItem> items = new ArrayList<ParaItem>();
		items.add(0, new ParaItem(null, "参数项1", "2", null,  null, null));
		items.add(1, new ParaItem(null, "参数项2", "6", null,  null, null));
		pg.setItems(items);
		ps.addParam(pg);
	}
	@Test
	public void testInsertParamDAO(){
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("com/zpark/spring/applicationContext.xml");
		ParamDAO pd = (ParamDAO) context.getBean("paramDAO");
		ParaGroup pg = new ParaGroup("007", "参数组4", "5", "003", new Timestamp(new Date().getTime()), new Timestamp(new Date().getTime()));
		pd.insertParaGroup(pg);
	}
	@Test
	public void testRemoveParamGroup(){
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("com/zpark/spring/applicationContext.xml");
		ParamService pd = (ParamService) context.getBean("paramServiceImpl");
		List<String> list = new ArrayList<String>();
		list.add("8765c2e7");
		list.add("d388031d");
		list.add("10744ed7");
		list.add("47799fe6");
		//pd.removeParaGroup(list);
	}
	@Test
	public void testSelectParaGroupById(){
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("com/zpark/spring/applicationContext.xml");
		ParamDAO pd = (ParamDAO) context.getBean("paramDAO");
		/*ParaGroup pg = pd.selectParaGroupById("001");
		System.out.println(pg.toString());
		for (ParaItem pi : pg.getItems()) {
			System.out.println(pi);
		}*/
	}
	@Test
	public void testUpdateParamGroup(){
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("com/zpark/spring/applicationContext.xml");
		ParamDAO pd = (ParamDAO) context.getBean("paramDAO");
		ParaGroup pg = new ParaGroup("001", "主体1", "11", "004", null, new Timestamp(new Date().getTime()));
		pd.updateParamGroup(pg);
	}
}
