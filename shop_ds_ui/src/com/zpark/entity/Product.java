package com.zpark.entity;

import java.util.Date;
import java.util.List;

public class Product {
    private String id;

    private String name;

    private String cid;

    private String numb;

    private Double salePrice;

    private Double marketPrice;

    private String isPro;

    private String score;

    private String primaryImg;

    private String introduce;
    
    private Category category;
    
    private List<Image> list;

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

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

	public String getNumb() {
		return numb;
	}

	public void setNumb(String numb) {
		this.numb = numb;
	}

	public Double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(Double salePrice) {
        this.salePrice = salePrice;
    }

    public Double getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(Double marketPrice) {
        this.marketPrice = marketPrice;
    }

    public String getIsPro() {
        return isPro;
    }

    public void setIsPro(String isPro) {
        this.isPro = isPro;
    }

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getPrimaryImg() {
        return primaryImg;
    }

    public void setPrimaryImg(String primaryImg) {
        this.primaryImg = primaryImg;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<Image> getList() {
		return list;
	}

	public void setList(List<Image> list) {
		this.list = list;
	}

	public Product() {
		super();
	}

	public Product(String id, String name, String cid, String numb,
			Double salePrice, Double marketPrice, String isPro, String score,
			String primaryImg, String introduce) {
		super();
		this.id = id;
		this.name = name;
		this.cid = cid;
		this.numb = numb;
		this.salePrice = salePrice;
		this.marketPrice = marketPrice;
		this.isPro = isPro;
		this.score = score;
		this.primaryImg = primaryImg;
		this.introduce = introduce;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", cid=" + cid
				+ ", numb=" + numb + ", salePrice=" + salePrice
				+ ", marketPrice=" + marketPrice + ", isPro=" + isPro
				+ ", score=" + score + ", primaryImg=" + primaryImg
				+ ", introduce=" + introduce + ", category=" + category
				+ ", list=" + list + "]";
	}

	
    
}