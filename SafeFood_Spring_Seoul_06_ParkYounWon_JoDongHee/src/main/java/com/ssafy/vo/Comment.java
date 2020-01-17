package com.ssafy.vo;

public class Comment {
	private int c_num;
	private int num;
	private String id;
	private String c_content;
	private String c_date;
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getC_date() {
		return c_date;
	}
	public void setC_date(String c_date) {
		this.c_date = c_date;
	}
	@Override
	public String toString() {
		return "Comment [c_num=" + c_num + ", num=" + num + ", id=" + id + ", c_content=" + c_content + ", c_date="
				+ c_date + "]";
	}
	
}
