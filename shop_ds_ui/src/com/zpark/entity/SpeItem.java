package com.zpark.entity;

import java.util.Date;
import java.util.List;

public class SpeItem {
    private String id;

    private String name;

    private String showType;

    private String note;

    private String sortnum;

    private Date createtime;

    private Date lastupdatetime;
   
    private List<SpeOption> list;

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

    public String getShowType() {
        return showType;
    }

    public void setShowType(String showType) {
        this.showType = showType;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getSortnum() {
        return sortnum;
    }

    public void setSortnum(String sortnum) {
        this.sortnum = sortnum;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Date getLastupdatetime() {
        return lastupdatetime;
    }

    public void setLastupdatetime(Date lastupdatetime) {
        this.lastupdatetime = lastupdatetime;
    }

	

	public List<SpeOption> getList() {
		return list;
	}

	public void setList(List<SpeOption> list) {
		this.list = list;
	}

	public SpeItem() {
		super();
	}

	public SpeItem(String id, String name, String showType, String note,
			String sortnum, Date createtime, Date lastupdatetime) {
		super();
		this.id = id;
		this.name = name;
		this.showType = showType;
		this.note = note;
		this.sortnum = sortnum;
		this.createtime = createtime;
		this.lastupdatetime = lastupdatetime;
	}

	@Override
	public String toString() {
		return "SpeItem [id=" + id + ", name=" + name + ", showType="
				+ showType + ", note=" + note + ", sortnum=" + sortnum
				+ ", createtime=" + createtime + ", lastupdatetime="
				+ lastupdatetime + "]";
	}
    
}