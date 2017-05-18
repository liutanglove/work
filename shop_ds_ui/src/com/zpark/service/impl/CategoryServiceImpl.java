package com.zpark.service.impl;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zpark.dao.CategoryDAO;
import com.zpark.entity.Category;
import com.zpark.service.CategoryService;
@Component
@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED,readOnly=false,rollbackFor=Exception.class)
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDAO cd;
	public List<Category> queryAllCategory() {
		try {
			return cd.selectAllCategory();
		} catch (Exception e) {
			throw new RuntimeException("查询失败！");
		}
		
	}
	public void addCategory(Category category) {
		category.setId(UUID.randomUUID().toString().substring(0, 8));
		String parentId = category.getParentId().split("-")[0];
		String lev = category.getParentId().split("-")[1];
		String Tlev = (Integer.parseInt(lev)+1)+"";
		category.setParentId(parentId);
		category.setLev(Tlev);
		category.setCreateTime(new Timestamp(new Date().getTime()));
		category.setLastUpdateTime(new Timestamp(new Date().getTime()));
		try {
			cd.insertCategory(category);
		} catch (Exception e) {
			throw new RuntimeException("插入失败！");
		}
		
	}
	public Category queryCategoryById(String id) {
		Category ca = cd.selectCategoryById(id);
		if(ca == null){
			throw new RuntimeException("没有该分类！");
		}else{
			return ca;
		}
	}
	public void modifyCategory(Category category) {
		category.setLastUpdateTime(new Timestamp(new Date().getTime()));
		try {
			cd.updateCategory(category);
		} catch (Exception e) {
			throw new RuntimeException("修改失败！");
		}
		
	}

}
