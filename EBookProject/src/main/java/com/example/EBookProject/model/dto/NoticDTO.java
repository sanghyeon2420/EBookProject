package com.example.EBookProject.model.dto;

import java.sql.Date;

public class NoticDTO {
	private int notic_no;						//번호
	private String notic_content;				//내용
	private String notic_title;					//제목
	private Date notic_regdate;					// 작성일 java.util.Date
	private int notic_viewcnt;					//조회수
	private String show;				// 화면 표시 여부
	
	
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

	public int getNotic_viewcnt() {
		return notic_viewcnt;
	}

	public void setNotic_viewcnt(int notic_viewcnt) {
		this.notic_viewcnt = notic_viewcnt;
	}

	public String getshow() {
		return show;
	}

	public void setshow(String show) {
		this.show = show;
	}

	@Override
	public String toString() {
		return "NoticDTO [notic_no=" + notic_no + ", notic_content=" + notic_content + ", notic_title=" + notic_title
				+ ", notic_regdate=" + notic_regdate + ", notic_viewcnt=" + notic_viewcnt +",show=" + show + "]" ;
	}
	
	
	
	
}
