package com.spring.summerboot2.shop;

public class ProductVO {

	private int product_id;
	private String name;
	private int price;
	private int amount;
	private String img;
	private String category;
	private String description;
	private int rating;
	
	public ProductVO(int product_id, String name, int amount, int price, String img, String category) {
		this.product_id = product_id;
		this.name = name;
		this.amount = amount;
		this.price = price;
		this.img = img;
		this.category = category;
	}
	
	public ProductVO(int product_id, String name, int price, int amount, String img, String category, String description, int rating) {
		this.product_id = product_id;
		this.name = name;
		this.price = price;
		this.amount = amount;
		this.img = img;
		this.category = category;
		this.description = description;
		this.rating = rating;
	}
	
	public ProductVO(int product_id, String name, int price, int amount, String img, String category, int rating) {
		this.product_id = product_id;
		this.name = name;
		this.price = price;
		this.amount = amount;
		this.img = img;
		this.category = category;
		this.rating = rating;
	}
	
	public int getProduct_id() {return product_id;}
	public void setProduct_id(int product_id) {this.product_id = product_id;}
	
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	
	public int getPrice() {return price;}
	public void setPrice(int price) {this.price = price;}
	
	public int getAmount() {return amount;}
	public void setAmount(int amount) {this.amount = amount;}
	
	public String getImg() {return img;}
	public void setImg(String img) {this.img = img;}
	
	public String getCategory() {return category;}
	public void setCategory(String category) {this.category = category;}
	
	public String getDescription() {return description;}
	public void setDescription(String description) {this.description = description;}
	
	public int getRating() {return rating;}
	public void setRating(int rating) {this.rating = rating;}

}
