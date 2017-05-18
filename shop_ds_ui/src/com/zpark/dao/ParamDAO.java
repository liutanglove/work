package com.zpark.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zpark.entity.Category;
import com.zpark.entity.ParaGroup;
import com.zpark.entity.ParaItem;

public interface ParamDAO {
	public Category selectCategory(String id);
	public List<ParaGroup> selectParaGroup(@Param("id")String id,@Param("rows")Integer rows,@Param("page")Integer page);
	public List<ParaItem> selectParaItem(String id);
	public void insertParaGroup(ParaGroup pg);
	public void insertParaItem(ParaItem pi);
	public void deleteParaItem(List<String> list);
	public void updateParamItem(ParaItem pi);
	public void updateParamGroup(ParaGroup pg);
	public void deleteParaItems(List<String> list);
}
