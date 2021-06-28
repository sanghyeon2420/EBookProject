package com.example.EBookProject.model.dto;

public class MemoDTO {
	private int idx;
	private int user_no;
	private String memo;
	private String post_date;
	private String nickname;
	private int ebook_no;
	
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getEbook_no() {
		return ebook_no;
	}
	public void setEbook_no(int ebook_no) {
		this.ebook_no = ebook_no;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
	
	@Override
	public String toString() {
		return "MemoDTO [idx=" + idx + ", user_no=" + user_no + ", memo=" + memo + ", post_date=" + post_date
				+ ", nickname=" + nickname + ", ebook_no=" + ebook_no + "]";
	}

	
	
	
}
