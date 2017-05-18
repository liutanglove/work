package com.zpark.entity;

import java.util.List;

public class ParaGroupDTO {
	private Integer total;
	private List<ParaGroup> rows;
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public List<ParaGroup> getRows() {
		return rows;
	}
	public void setRows(List<ParaGroup> rows) {
		this.rows = rows;
	}
	public ParaGroupDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ParaGroupDTO(Integer total, List<ParaGroup> rows) {
		super();
		this.total = total;
		this.rows = rows;
	}
	@Override
	public String toString() {
		return "ParaGroupDTO [total=" + total + ", rows=" + rows + "]";
	}
	
	
}
