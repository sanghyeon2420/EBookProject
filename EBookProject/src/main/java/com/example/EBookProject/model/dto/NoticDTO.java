package com.example.EBookProject.model.dto;

import java.sql.Date;

public class NoticDTO {
	private int notic_no;
	private String notic_content;
	private String notic_title;
	private Date notic_regdate;
	
	public int getNotic_no() {
		return notic_no;
	}
	public void setNotic_no(int notic_no) {
		this.notic_no = notic_no;
	}
	public String getNotic_content() {
		return notic_content;
	}
	public void setNotic_content(String notic_content) {
		this.notic_content = notic_content;
	}
	
	public String getNotic_title() {
		return notic_title;
	}
	public void setNotic_title(String notic_title) {
		this.notic_title = notic_title;
	}
	public Date getNotic_regdate() {
		return notic_regdate;
	}
	public void setNotic_regdate(Date notic_regdate) {
		this.notic_regdate = notic_regdate;
	}
	
	@Override
	public String toString() {
		return "NoticDTO [notic_no=" + notic_no + ", notic_content=" + notic_content + ", notic_title=" + notic_title
				+ ", notic_regdate=" + notic_regdate + "]";
	}
	
	
	
	
	
}
