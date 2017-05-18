package com.zpark.service;

import java.util.List;

import com.zpark.entity.Category;

public interface CategoryService {
	public List<Category> queryAllCategory();
	public void addCategory(Category category);
	public Category queryCategoryById(String id);
	public void modifyCategory(Category category);
}
