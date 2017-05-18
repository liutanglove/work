package com.zpark.dao;

import java.util.List;

import com.zpark.entity.Category;

public interface CategoryDAO {
	public List<Category> selectAllCategory();
	public List<Category> selectSecondCategory(String parentId);
	public void insertCategory(Category categpry);
	public Category selectCategoryById(String id);
	public void updateCategory(Category category);
}
