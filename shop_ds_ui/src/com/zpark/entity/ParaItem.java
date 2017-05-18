package com.zpark.entity;

import java.sql.Timestamp;

public class ParaItem {
    private String id;

    private String name;

    private String sortNum;

    private String gId;

    private Timestamp createTime;

    private Timestamp lastUpdateTime;

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

	public String getgId() {
		return gId;
	}

	public void setgId(String gId) {
		this.gId = gId;
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

	public ParaItem() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ParaItem(String id, String name, String sortNum, String gId,
			Timestamp createTime, Timestamp lastUpdateTime) {
		super();
		this.id = id;
		this.name = name;
		this.sortNum = sortNum;
		this.gId = gId;
		this.createTime = createTime;
		this.lastUpdateTime = lastUpdateTime;
	}

	@Override
	public String toString() {
		return "ParaItem [id=" + id + ", name=" + name + ", sortNum=" + sortNum
				+ ", gId=" + gId + ", createTime=" + createTime
				+ ", lastUpdateTime=" + lastUpdateTime + "]";
	}

   

    
}