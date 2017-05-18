package com.zpark.entity;

import java.sql.Timestamp;
import java.util.List;

public class ParaGroup {
    private String id;

    private String name;

    private String sortNum;

    private String cId;

    private Timestamp createTime;

    private Timestamp lastUpdateTime;
    
    private Category category;
    
    private List<ParaItem> items;

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

	public String getSortNum() {
		return sortNum;
	}

	public void setSortNum(String sortNum) {
		this.sortNum = sortNum;
	}

	public String getcId() {
		return cId;
	}

	public void setcId(String cId) {
		this.cId = cId;
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
	
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<ParaItem> getItems() {
		return items;
	}

	public void setItems(List<ParaItem> items) {
		this.items = items;
	}

	public ParaGroup() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public ParaGroup(String id, String name, String sortNum, String cId,
			Timestamp createTime, Timestamp lastUpdateTime) {
		super();
		this.id = id;
		this.name = name;
		this.sortNum = sortNum;
		this.cId = cId;
		this.createTime = createTime;
		this.lastUpdateTime = lastUpdateTime;
	}

	@Override
	public String toString() {
		return "ParaGroup [id=" + id + ", name=" + name + ", sortNum="
				+ sortNum + ", cId=" + cId + ", createTime=" + createTime
				+ ", lastUpdateTime=" + lastUpdateTime + ", items=" + items
				+ "]";
	}

	

    
}