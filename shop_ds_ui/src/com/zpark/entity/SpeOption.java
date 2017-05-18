package com.zpark.entity;

import java.util.Date;

public class SpeOption {
    private String id;

    private String name;

    private String imgUrl;

    private String parentid;

    private String sortnum;

    private Date createtime;

    private Date lastupdatetime;

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

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getParentid() {
        return parentid;
    }

    public void setParentid(String parentid) {
        this.parentid = parentid;
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

	@Override
	public String toString() {
		return "SpeOption [id=" + id + ", name=" + name + ", imgUrl=" + imgUrl
				+ ", parentid=" + parentid + ", sortnum=" + sortnum
				+ ", createtime=" + createtime + ", lastupdatetime="
				+ lastupdatetime + "]";
	}

	public SpeOption() {
		super();
	}

	public SpeOption(String id, String name, String imgUrl, String parentid,
			String sortnum, Date createtime, Date lastupdatetime) {
		super();
		this.id = id;
		this.name = name;
		this.imgUrl = imgUrl;
		this.parentid = parentid;
		this.sortnum = sortnum;
		this.createtime = createtime;
		this.lastupdatetime = lastupdatetime;
	}
    
}