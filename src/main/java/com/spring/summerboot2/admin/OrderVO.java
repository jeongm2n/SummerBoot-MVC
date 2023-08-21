package com.spring.summerboot2.admin;

import java.sql.Date;

public class OrderVO {
	private String order_num;
	private String member_id;
	private int product_id;
	private String product_name;
	private int price;
	private int mount;
	private Date pur_date;
	private String address;
	
	OrderVO(String order_num, String member_id, int product_id, String product_name, int price, int mount, Date pur_date, String address) {
		this.order_num = order_num;
		this.member_id = member_id;
		this.product_id = product_id;
		this.product_name = product_name;
		this.price = price;
		this.mount = mount;
		this.pur_date = pur_date;
		this.address = address;
	}

	public String getOrder_num() {
		return order_num;
	}

	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getMount() {
		return mount;
	}

	public void setMount(int mount) {
		this.mount = mount;
	}

	public Date getPur_date() {
		return pur_date;
	}

	public void setPur_date(Date pur_date) {
		this.pur_date = pur_date;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
}
