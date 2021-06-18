package com.example.EBookProject.model.dto;

import java.sql.Date;

public class ContentDTO {
	private int contents_no;
	private int ebook_no;
	private int viewcontent_price;
	private Date content_date;
	private int completion;
	private String content_name;
	private int contentlist;
	public int getContentlist() {
		return contentlist;
	}
	public void setContentlist(int contentlist) {
		this.contentlist = contentlist;
	}
	public int getContents_no() {
		return contents_no;
	}
	public void setContents_no(int contents_no) {
		this.contents_no = contents_no;
	}
	public int getEbook_no() {
		return ebook_no;
	}
	public void setEbook_no(int ebook_no) {
		this.ebook_no = ebook_no;
	}
	public int getViewcontent_price() {
		return viewcontent_price;
	}
	public void setViewcontent_price(int viewcontent_price) {
		this.viewcontent_price = viewcontent_price;
	}
	public Date getContent_date() {
		return content_date;
	}
	public void setContent_date(Date content_date) {
		this.content_date = content_date;
	}
	public int getCompletion() {
		return completion;
	}
	public void setCompletion(int completion) {
		this.completion = completion;
	}
	public String getContent_name() {
		return content_name;
	}
	public void setContent_name(String content_name) {
		this.content_name = content_name;
	}
	@Override
	public String toString() {
		return "ContentDTO [contents_no=" + contents_no + ", ebook_no=" + ebook_no + ", viewcontent_price="
				+ viewcontent_price + ", content_date=" + content_date + ", completion=" + completion
				+ ", content_name=" + content_name + ", contentlist=" + contentlist + "]";
	}	
	
}
