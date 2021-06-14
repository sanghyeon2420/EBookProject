package com.example.EBookProject.model.dto;

public class NoticDTO {
	private int notic_no;
	private String notic_content;
	
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
	
	@Override
	public String toString() {
		return "NoticDTO [notic_no=" + notic_no + ", notic_content=" + notic_content + "]";
	}
	
	
	
}
