package com.zpark.dao;

import java.util.List;

import com.zpark.entity.SpeOption;

public interface SpecOptionDAO{
	public List<SpeOption> selectAll();
	public SpeOption selectById(String id);
	public void insert(SpeOption so);
	public void update(SpeOption so);
	public void delete(List<String> list);
}
