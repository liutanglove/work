package com.zpark.entity;

public class SpeciDTO {
	private boolean isDirectory;
	private String name;
	private String url;
	private long size;
	private long lastModified;
	public boolean getIsDirectory() {
		return isDirectory;
	}
	public void setIsDirectory(boolean isDirectory) {
		this.isDirectory = isDirectory;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public long getSize() {
		return size;
	}
	public void setSize(long size) {
		this.size = size;
	}
	public long getLastModified() {
		return lastModified;
	}
	public void setLastModified(long lastModified) {
		this.lastModified = lastModified;
	}
	public SpeciDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SpeciDTO(boolean isDirectory, String name, String url, long size,
			long lastModified) {
		super();
		this.isDirectory = isDirectory;
		this.name = name;
		this.url = url;
		this.size = size;
		this.lastModified = lastModified;
	}
	@Override
	public String toString() {
		return "SpeciDTO [isDirectory=" + isDirectory + ", name=" + name
				+ ", url=" + url + ", size=" + size + ", lastModified="
				+ lastModified + "]";
	}
	
}
