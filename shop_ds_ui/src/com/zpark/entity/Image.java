package com.zpark.entity;

public class Image {
    private String id;

    private String imgUrlLarge;

    private String productid;

    private String imgUrlSmall;

    private String imgUrlMiddle;

    private String title;

    private String sortNum;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getImgUrlLarge() {
        return imgUrlLarge;
    }

    public void setImgUrlLarge(String imgUrlLarge) {
        this.imgUrlLarge = imgUrlLarge;
    }

    public String getProductid() {
        return productid;
    }

    public void setProductid(String productid) {
        this.productid = productid;
    }

    public String getImgUrlSmall() {
        return imgUrlSmall;
    }

    public void setImgUrlSmall(String imgUrlSmall) {
        this.imgUrlSmall = imgUrlSmall;
    }

    public String getImgUrlMiddle() {
        return imgUrlMiddle;
    }

    public void setImgUrlMiddle(String imgUrlMiddle) {
        this.imgUrlMiddle = imgUrlMiddle;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSortNum() {
        return sortNum;
    }

    public void setSortNum(String sortNum) {
        this.sortNum = sortNum;
    }

	public Image() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Image(String id, String imgUrlLarge, String productid,
			String imgUrlSmall, String imgUrlMiddle, String title,
			String sortNum) {
		super();
		this.id = id;
		this.imgUrlLarge = imgUrlLarge;
		this.productid = productid;
		this.imgUrlSmall = imgUrlSmall;
		this.imgUrlMiddle = imgUrlMiddle;
		this.title = title;
		this.sortNum = sortNum;
	}

	@Override
	public String toString() {
		return "Image [id=" + id + ", imgUrlLarge=" + imgUrlLarge
				+ ", productid=" + productid + ", imgUrlSmall=" + imgUrlSmall
				+ ", imgUrlMiddle=" + imgUrlMiddle + ", title=" + title
				+ ", sortNum=" + sortNum + "]";
	}
    
}