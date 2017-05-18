package com.zpark.service;

import java.util.List;

import com.zpark.entity.ParaGroup;
import com.zpark.entity.SpeItem;

public interface SpeItemService {
	public List<SpeItem> queryAllSpeItem();
	public void insertSpeItem(SpeItem si);
	public void deleteSpeItem(String ids);
	public SpeItem queryById(String id);
	public void modify(SpeItem si);
}
