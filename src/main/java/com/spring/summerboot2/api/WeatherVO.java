package com.spring.summerboot2.api;

public class WeatherVO {
	
	private String date;
	private String tmx;
	private String tmn;
	private String ampop;
	private String pmpop;
	
	public WeatherVO(String date, String ampop, String pmpop, String tmx, String tmn) {
		this.date = date;
		this.ampop = ampop;
		this.pmpop = pmpop;
		this.tmx = tmx;
		this.tmn = tmn;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTmx() {
		return tmx;
	}

	public void setTmx(String tmx) {
		this.tmx = tmx;
	}

	public String getTmn() {
		return tmn;
	}

	public void setTmn(String tmn) {
		this.tmn = tmn;
	}

	public String getAmpop() {
		return ampop;
	}

	public void setAmpop(String ampop) {
		this.ampop = ampop;
	}

	public String getPmpop() {
		return pmpop;
	}

	public void setPmpop(String pmpop) {
		this.pmpop = pmpop;
	}
	
	
}