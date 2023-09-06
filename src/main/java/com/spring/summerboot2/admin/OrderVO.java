package com.spring.summerboot2.admin;

import java.sql.Date;

public class OrderVO {
	private String order_num;
	private String member_id;
	private int product_id;
	private String img;
	private String product_name;
	private int price;
	private int mount;
	private Date pur_date;
	private String address;
	private String post;
	private String addr1;
	private String addr2;
	private int review;
	
//	결제 내역 연동을 위해 추가한 변수
	private int tracking;
	private String status;
	private String imp_uid;
	
	
	public OrderVO(String order_num, String member_id, int product_id, String product_name, int price, int mount,
			Date pur_date, String address) {
		super();
		this.order_num = order_num;
		this.member_id = member_id;
		this.product_id = product_id;
		this.product_name = product_name;
		this.price = price;
		this.mount = mount;
		this.pur_date = pur_date;
		this.address = address;
	}
	
//	결제내역 추가를 위해 만든 생성자
	OrderVO(String order_num, String member_id, int product_id, String product_name, int price, int mount, Date pur_date,String post, String addr1, String addr2, int tracking, String status, String imp_uid) {
		this.order_num = order_num;
		this.member_id = member_id;
		this.product_id = product_id;
		this.product_name = product_name;
		this.price = price;
		this.mount = mount;
		this.pur_date = pur_date;
		this.post = post;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.tracking = tracking;
		this.status = status;
		this.imp_uid = imp_uid;
	}
	
	public OrderVO(String order_num, int product_id, String img, String product_name, int price, int mount, Date pur_date, String post, String address, int tracking, String status, String imp_uid, int review) {
		this.order_num = order_num;
		this.product_id = product_id;
		this.img = img;
		this.product_name = product_name;
		this.price = price;
		this.mount = mount;
		this.pur_date = pur_date;
		this.post = post;
		this.address = address;
		this.tracking = tracking;
		this.status = status;
		this.imp_uid = imp_uid;
		this.review = review;
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
	
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
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

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	
	public int getReview() {
		return review;
	}
	
	public void setReview(int review) {
		this.review = review;
	}
	
	public int getTracking() {
		return tracking;
	}
	public void setTracking(int tracking) {
		this.tracking = tracking;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}

}
