package com.spring.summerboot2.branch;

public class WashlistVO {
	private int no;
	private String name;
	private String address;
	private int sites;
	private String img;
	
	WashlistVO(int no, String name, String address, int sites, String img) {
		this.no = no;
		this.name = name;
		this.address = address;
		this.sites = sites;
		this.img = img;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getSites() {
		return sites;
	}
	public void setSites(int sites) {
		this.sites = sites;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
}
