package com.zpark.dao;

import java.util.List;

import com.zpark.entity.SpeItem;

public interface SpecItemDAO{
	public List<SpeItem> selectAll();
	public void insert(SpeItem si);
	public void delete(List<String> list);
	public SpeItem selectById(String id);
	public void update(SpeItem si);
}
