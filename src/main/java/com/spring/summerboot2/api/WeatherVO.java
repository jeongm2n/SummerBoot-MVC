package com.spring.summerboot2.api;

public class WeatherVO {
	
	private String date;
	private int maxtemp;
	private int mintemp;
	private String pcp;
	
	public WeatherVO() {
		
	}
	
	public WeatherVO(String date, String pcp, int maxtemp, int mintemp) {
		this.date = date;
		this.pcp = pcp;
		this.maxtemp = maxtemp;
		this.mintemp = mintemp;
	}
}