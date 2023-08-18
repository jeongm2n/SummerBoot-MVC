package com.spring.summerboot2.pay;

public class ProductVO {
	private int product_id;
	private int quantity;
	private String name;
	private int price;
	private String img;
	
	public ProductVO(int product_id, String name, int quantity, int price, String img) {
		this.product_id = product_id;
		this.name = name;
		this.quantity = quantity;
		this.price = price;
		this.img = img;
	}
	
	public int getProduct_id() { return product_id;}
	public void setProduct_id(int product_id) { this.product_id = product_id;}
	
	public int getQuantity() { return quantity;}
	public void setQuantity(int quantity) { this.quantity = quantity;}
	
	public String getName() { return name;}
	public void setName(String name) { this.name = name;}
	
	public int getPrice() { return price;}
	public void setPrice(int price) { this.price = price;}
	
	public String getImg() { return img;}
	public void setImg(String img) { this.img = img;}

}