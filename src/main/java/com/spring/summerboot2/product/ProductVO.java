package com.spring.summerboot2.product;

public class ProductVO {
	private int product_id;
	private String name;
	private int amount;
	private int price;
	private String img;
	
	public ProductVO(int product_id, String name, int amount, int price, String img) {
		this.product_id = product_id;
		this.name = name;
		this.amount = amount;
		this.price = price;
		this.img = img;
	}
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
}
