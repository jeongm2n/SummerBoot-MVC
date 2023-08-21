package com.spring.summerboot2.reservation;

public class ReservationVO {
	private int res_no;
	private int carwash_no;
	private String member_id;
	private String res_date;
	private int site;
	private String startTime;
	private String useTime;
	private String qr_img;

	public ReservationVO(String startTime, String useTime) {
		this.startTime=startTime;
		this.useTime=useTime;
	}
	
	public ReservationVO(int res_no, String member_id, String res_date, int site, String startTime, String useTime) {
		this.res_no = res_no;
		this.member_id = member_id;
		this.res_date = res_date;
		this.site = site;
		this.startTime = startTime;
		this.useTime = useTime;
	}

	public int getRes_no() {
		return res_no;
	}

	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}

	public int getCarwash_no() {
		return carwash_no;
	}

	public void setCarwash_no(int carwash_no) {
		this.carwash_no = carwash_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	public String getRes_date() {
		return res_date;
	}

	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}

	public int getSite() {
		return site;
	}

	public void setSite(int site) {
		this.site = site;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getUseTime() {
		return useTime;
	}

	public void setUseTime(String useTime) {
		this.useTime = useTime;
	}

	public String getQr_img() {
		return qr_img;
	}

	public void setQr_img(String qr_img) {
		this.qr_img = qr_img;
	}
}
