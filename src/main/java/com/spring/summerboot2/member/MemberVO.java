package com.spring.summerboot2.member;

public class MemberVO {
	private String id;
	private String pwd;
	private String name;
	private String tel;
	private int point;
	
	MemberVO(String id, String pwd, String name, String tel) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.tel = tel;
	}
	
	MemberVO(String id, String pwd, String name, String tel, int point) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.tel = tel;
		this.point = point;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
}
