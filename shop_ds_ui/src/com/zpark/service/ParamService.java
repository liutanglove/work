package com.zpark.service;

import java.util.List;

import com.zpark.entity.Category;
import com.zpark.entity.ParaGroup;

public interface ParamService {
	public List<ParaGroup> queryParam(Integer rows,Integer page);
	public void addParam(ParaGroup pg);
	public void removeParaGroup(String ids);
	public ParaGroup queryParaGroup(String id);
	public void modifyParam(ParaGroup pg);
}
