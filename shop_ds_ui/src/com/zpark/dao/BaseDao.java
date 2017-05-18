package com.zpark.dao;

import java.util.List;

public interface BaseDao<T> {
	public void insert(T t);
	public void delete(T t);
	public void update(T t);
	public List<T> selectAll();
	public T selectById(String id);
	//public List<T> selectByParentId(String id);
}
