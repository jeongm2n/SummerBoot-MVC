package com.spring.summerboot2.branch;

public class WashlistVO {
	private int no;
	private String name;
	private String address;
	private int sites;
	private String tel;
	private String time;
	private String img;
	private String lat;
	private String lon;
	

	public WashlistVO(int no, String name, String address, int sites, String tel, String time, String img, String lat, String lon) {
		this.no = no;
		this.name = name;
		this.address = address;
		this.sites = sites;
		this.tel = tel;
		this.time = time;
		this.img = img;
		this.lat = lat;
		this.lon = lon;
	}
	
	public WashlistVO(int no, String address, int sites, String tel, String time, String img) {
		this.no = no;
		this.address = address;
		this.sites = sites;
		this.tel = tel;
		this.time = time;
		this.img = img;
	}
	
	public WashlistVO(int no, String address, int sites, String tel, String time) {
		this.no = no;
		this.address = address;
		this.sites = sites;
		this.tel = tel;
		this.time = time;
	}
	
	public WashlistVO(int no, String name, String address, int sites, String tel, String time) {
		this.no = no;
		this.name = name;
		this.address = address;
		this.sites = sites;
		this.tel = tel;
		this.time = time;
	}
	
	public WashlistVO(String name, String address, int sites, String tel, String time, String img, String lat, String lon) {
		this.name = name;
		this.address = address;
		this.sites = sites;
		this.tel = tel;
		this.time = time;
		this.img = img;
		this.lat = lat;
		this.lon = lon;
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
	public String getTel() {
		return tel;
	}
	
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getTime() {
		return time;
	}
	
	public void setTime(String time) {
		this.time = time;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLon() {
		return lon;
	}

	public void setLon(String lon) {
		this.lon = lon;
	}
	
}
