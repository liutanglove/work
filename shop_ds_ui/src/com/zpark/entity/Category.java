package com.zpark.entity;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public class Category {
    private String id;

    private String name;

    private String lev;

    private String parentId;

    private Timestamp createTime;

    private Timestamp lastUpdateTime;
    
    private List<Category> categorys;
    
    private List<ParaGroup> groups;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLev() {
		return lev;
	}

	public void setLev(String lev) {
		this.lev = lev;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public Timestamp getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}

	public Timestamp getLastUpdateTime() {
		return lastUpdateTime;
	}

	public void setLastUpdateTime(Timestamp lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	public List<Category> getCategorys() {
		return categorys;
	}

	public void setCategorys(List<Category> categorys) {
		this.categorys = categorys;
	}
	
	

	public List<ParaGroup> getGroups() {
		return groups;
	}

	public void setGroups(List<ParaGroup> groups) {
		this.groups = groups;
	}

	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Category(String id, String name, String lev, String parentId,
			Timestamp createTime, Timestamp lastUpdateTime) {
		super();
		this.id = id;
		this.name = name;
		this.lev = lev;
		this.parentId = parentId;
		this.createTime = createTime;
		this.lastUpdateTime = lastUpdateTime;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + ", lev=" + lev
				+ ", parentId=" + parentId + ", createTime=" + createTime
				+ ", lastUpdateTime=" + lastUpdateTime + ", categorys="
				+ categorys + "]";
	}

   
    
}