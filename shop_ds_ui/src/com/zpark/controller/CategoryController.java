package com.zpark.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zpark.entity.Category;
import com.zpark.service.CategoryService;

@Controller
@RequestMapping("/category")
public class CategoryController {
	@Autowired
	private CategoryService cs;
	@RequestMapping("/queryAllCategory")
	public String queryAllCategory(HttpServletRequest request,String info){
		List<Category> list = cs.queryAllCategory();
		request.setAttribute("list", list);
		if("list".equals(info)){
			return "forward:/back/category/list.jsp";
		}else if("add".equals(info)){
			return "forward:/back/category/add.jsp";
		}else if("addParam".equals(info)){
			return "forward:/back/parOams/add.jsp";
		}else{
			return "forward:/back/product/add.jsp";
		}
	}
	@RequestMapping("/saveCategory")
	@ResponseBody
	public String saveCategory(Category category){
		try {
			cs.addCategory(category);
			return "保存成功";
		} catch (Exception e) {	
			System.out.println(e.getMessage());
			return e.getMessage();
		}
	}
	@RequestMapping("/queryCategoryById")
	public String queryCategoryById(String id,HttpServletRequest request){
		Category ca = cs.queryCategoryById(id);
		request.setAttribute("ca", ca);
		return "forward:/back/category/update.jsp";
	}
	@RequestMapping("/alterCategory")
	@ResponseBody
	public void alterCategory(Category category){
		cs.modifyCategory(category);
	}

}
