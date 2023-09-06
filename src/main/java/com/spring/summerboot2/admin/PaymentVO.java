package com.spring.summerboot2.admin;

public class PaymentVO {


	private String buyer_name;
	private String buyer_tel;
	private String pay_method;
	private String card_name;
	private String card_number;
	private String vbank_date;
	private String vbank_name;
	private String vbank_num;
	
	public PaymentVO(String buyer_name, String buyer_tel, String pay_method, String card_name, String card_number) {
		this.buyer_name = buyer_name;
		this.buyer_tel = buyer_tel;
		this.pay_method = pay_method;
		this.card_name = card_name;
		this.card_number = card_number;
	}
	
	public PaymentVO(String buyer_name, String buyer_tel, String pay_method, String vbank_date, String vbank_name, String vbank_num) {
		this.buyer_name = buyer_name;
		this.buyer_tel = buyer_tel;
		this.pay_method = pay_method;
		this.vbank_date = vbank_date;
		this.vbank_name = vbank_name;
		this.vbank_num = vbank_num;
	}

	public String getBuyer_name() { return buyer_name;}
	public void setBuyer_name(String buyer_name) { this.buyer_name = buyer_name;}
	
	public String getBuyer_tel() { return buyer_tel;}
	public void setBuyer_tel(String buyer_tel) { this.buyer_tel = buyer_tel;}
	
	public String getPay_method() { return pay_method;}
	public void setPay_method(String pay_method) { this.pay_method = pay_method;}
	
	public String getCard_name() { return card_name;}
	public void setCard_name(String card_name) { this.card_name = card_name;}
	
	public String getCard_number() { return card_number;}
	public void setCard_number(String card_number) { this.card_number = card_number;}
	
	public String getVbank_date() { return vbank_date;}
	public void setVbank_date(String vbank_date) { this.vbank_date = vbank_date;}
	
	public String getVbank_name() { return vbank_name;}
	public void setVbank_name(String vbank_name) { this.vbank_name = vbank_name;}
	
	public String getVbank_num() { return vbank_num;}
	public void setVbank_num(String vbank_num) { this.vbank_num = vbank_num;}
}
