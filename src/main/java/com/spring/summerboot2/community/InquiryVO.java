package com.spring.summerboot2.community;

import java.sql.Timestamp;

public class InquiryVO {
	private int q_no;
	private String writer;
	private String category;
	private String title;
	private String content;
	private String secret;
	private Timestamp ins_date;
	private String answer;
	private Timestamp answer_date;
	private String state;
	
	InquiryVO(String writer, String category, String title, String content, String secret, String state) {
		this.writer = writer;
		this.category = category;
		this.title = title;
		this.content = content;
		this.secret = secret;
		this.state = state;
	}
	
	public InquiryVO(int q_no, String writer, String category, String title, String content, String secret, Timestamp ins_date, String answer, Timestamp answer_date, String state) {
		this.q_no = q_no;
		this.writer = writer;
		this.category = category;
		this.title = title;
		this.content = content;
		this.secret = secret;
		this.ins_date = ins_date;
		this.answer = answer;
		this.answer_date = answer_date;
		this.state = state;
	}
	
	public InquiryVO(String category, String title, Timestamp ins_date) {
		this.category = category;
		this.title = title;
		this.ins_date = ins_date;
	}
	
	public InquiryVO(int q_no, String answer, String state) {
		this.q_no = q_no;
		this.answer = answer;
		this.state = state;
	}
	
	public InquiryVO(String writer, String category, String title, String content, Timestamp ins_date) {
		this.writer = writer;
		this.category = category;
		this.title = title;
		this.content = content;
		this.ins_date = ins_date;
	}
	
	public int getQ_no() {
		return q_no;
	}
	public void setQ_no(int q_no) {
		this.q_no = q_no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	public Timestamp getIns_date() {
		return ins_date;
	}
	public void setIns_date(Timestamp ins_date) {
		this.ins_date = ins_date;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Timestamp getAnswer_date() {
		return answer_date;
	}
	public void setAnswer_date(Timestamp answer_date) {
		this.answer_date = answer_date;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
}
