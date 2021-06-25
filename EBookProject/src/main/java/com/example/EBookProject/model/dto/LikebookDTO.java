package com.example.EBookProject.model.dto;

public class LikebookDTO {
	private int likeno; // 추천번호
	private int like_id; // 추천인
	private int like_bookno; // 책 번호
	
	public int getLikeno() {
		return likeno;
	}
	public void setLikeno(int likeno) {
		this.likeno = likeno;
	}
	public int getLike_id() {
		return like_id;
	}
	public void setLike_id(int like_id) {
		this.like_id = like_id;
	}
	public int getLike_bookno() {
		return like_bookno;
	}
	public void setLike_bookno(int like_bookno) {
		this.like_bookno = like_bookno;
	}
	
	@Override
	public String toString() {
		return "LikebookDTO [likeno=" + likeno + ", like_id=" + like_id + ", like_bookno=" + like_bookno + "]";
	}
	
	
}
