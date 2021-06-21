package com.example.EBookProject.model.dto;

public class WriterDTO {
	private int writer_no;
	private String w_name;
	private int w_hits;
	private int user_no;
	private String imagefile_no;
	
	public String getImagefile_no() {
		return imagefile_no;
	}
	public void setImagefile_no(String imagefile_no) {
		this.imagefile_no = imagefile_no;
	}
	public int getWriter_no() {
		return writer_no;
	}
	public void setWriter_no(int writer_no) {
		this.writer_no = writer_no;
	}
	public String getW_name() {
		return w_name;
	}
	public void setW_name(String w_name) {
		this.w_name = w_name;
	}
	public int getW_hits() {
		return w_hits;
	}
	public void setW_hits(int w_hits) {
		this.w_hits = w_hits;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	@Override
	public String toString() {
		return "WriterDTO [writer_no=" + writer_no + ", w_name=" + w_name + ", w_hits=" + w_hits + ", user_no="
				+ user_no + ", imagefile_no=" + imagefile_no + "]";
	}
	
	
	
	
}
