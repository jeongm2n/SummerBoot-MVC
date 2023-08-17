package com.spring.summerboot2.pay;

public class InformVO {


	private String tel;
	private String name;
	private int point;
	private String postcode;
	private String state;
	private String city;
	private String town;
	private String street_add;
	private String option_add;
	
	public InformVO(String tel, String name, int point) {
		this.tel = tel;
		this.name = name;
		this.point = point;
	}
	
	public InformVO(String tel , String name, String postcode, String state, String city, String town, String street_add, String option_add) {
		this.tel = tel;
		this.name = name;
		this.postcode = postcode;
		this.state = state;
		this.city = city;
		this.town = town;
		this.street_add = street_add;
		this.option_add = option_add;
	}
	
	public InformVO(String tel , String name, int point, String postcode, String state, String city, String town, String street_add, String option_add) {
		this.tel = tel;
		this.name = name;
		this.point = point;
		this.postcode = postcode;
		this.state = state;
		this.city = city;
		this.town = town;
		this.street_add = street_add;
		this.option_add = option_add;
	}
	
	public String getTel() { return tel;}
	public void setTel(String tel) { this.tel = tel;}
	
	public String getName() { return name;}
	public void setName(String name) { this.name = name;}
	
	public int getPoint() { return point;}
	public void setPoint(int point) { this.point = point;}
	
	public String getPostcode() { return postcode;}
	public void setPostcode(String postcode) { this.postcode = postcode;}
	
	public String getState() { return state;}
	public void setState(String state) { this.state = state;}
	
	public String getCity() { return city;}
	public void setCity(String city) { this.city = city;}
	
	public String getTown() { return town;}
	public void setTown(String town) { this.town = town;}
	
	public String getStreet_add() { return street_add;}
	public void setStreet_add(String street_add) { this.street_add = street_add;}
	
	public String getOption_add() { return option_add;}
	public void setOption_add(String option_add) { this.option_add = option_add;}
	
}
