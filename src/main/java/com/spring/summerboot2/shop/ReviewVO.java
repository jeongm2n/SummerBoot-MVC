package com.spring.summerboot2.shop;

public class ReviewVO {

	private String member_id;
	private int num;
	private int point;
	private String img;
	private String contents;
	private String date;
	private int product_id;
	private int carwash_no;
	
	public ReviewVO(String member_id, int point, String img, String contents, String date) {
		this.member_id = member_id;
		this.point = point;
		this.img = img;
		this.contents = contents;
		this.date = date;
	}
	
	
	public String getMember_id() { return member_id;}
	public void setMember_id(String member_id) { this.member_id = member_id;}
	
	public int getNum() { return num;}
	public void setNum(int num) { this.num = num;}
	
	public int getPoint() { return point;}
	public void setPoint(int point) { this.point = point;}
	
	public String getImg() { return img;}
	public void setImg(String img) { this.img = img;}
	
	public String getContents() { return contents;}
	public void setContents(String contents) { this.contents = contents;}
	
	public String getDate() { return date;}
	public void setDate(String date) { this.date = date;}
	
	public int getProduct_id() { return product_id;}
	public void setProduct_id(int product_id) { this.product_id = product_id;}
	
	public int getCarwash_no() { return carwash_no;}
	public void setCarwash_no(int carwash_no) { this.carwash_no = carwash_no;}

}
