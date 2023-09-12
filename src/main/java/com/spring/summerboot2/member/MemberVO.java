package com.spring.summerboot2.member;

public class MemberVO {
	private String id;
	private String pwd;
	private String mem_name;
	private String tel;
	private String email;
	private String email_yn;
	private String address;
	private int point;
	
	MemberVO(String id, String pwd, String mem_name, String tel, String email, String email_yn, String address) {
		this.id = id;
		this.pwd = pwd;
		this.mem_name = mem_name;
		this.tel = tel;
		this.email = email;
		this.email_yn = email_yn;
		this.address = address;
	}
	
	MemberVO(String id, String pwd, String mem_name, String tel, String email, String email_yn, String address, int point) {
		this.id = id;
		this.pwd = pwd;
		this.mem_name = mem_name;
		this.tel = tel;
		this.email = email;
		this.email_yn = email_yn;
		this.address = address;
		this.point = point;
	}
	
	public MemberVO(String id, String mem_name, String tel, String address, int point, String email, String email_yn) {
		this.id = id;
		this.mem_name = mem_name;
		this.tel = tel;
		this.address = address;
		this.point = point;
		this.email = email;
		this.email_yn = email_yn;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail_yn() {
		return email_yn;
	}
	public void setEmail_yn(String email_yn) {
		this.email_yn = email_yn;
	}
}
