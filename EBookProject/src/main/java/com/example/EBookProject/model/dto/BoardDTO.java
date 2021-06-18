package com.example.EBookProject.model.dto;

import java.util.Arrays;
import java.util.Date;

public class BoardDTO {
	
	private int board_no;	
	private int user_no;
	private String b_title;		//board 제목	
	private String b_content;	
	private Date b_write_date;	//작성날자
	private String nickname;
	private String user_ip;
	private int board_get;		//board 조회수
	private String board_hits;	//board 추천수
	private int is_view;		//게시물출력여부
	
	
	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public Date getB_write_date() {
		return b_write_date;
	}

	public void setB_write_date(Date b_write_date) {
		this.b_write_date = b_write_date;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUser_ip() {
		return user_ip;
	}

	public void setUser_ip(String user_ip) {
		this.user_ip = user_ip;
	}

	public int getBoard_get() {
		return board_get;
	}

	public void setBoard_get(int board_get) {
		this.board_get = board_get;
	}

	public String getBoard_hits() {
		return board_hits;
	}

	public void setBoard_hits(String board_hits) {
		this.board_hits = board_hits;
	}

	public int getIs_view() {
		return is_view;
	}

	public void setIs_view(int is_view) {
		this.is_view = is_view;
	}

	@Override
	public String toString() {
		return "BoardDTO [board_no=" + board_no + ", user_no=" + user_no + ", b_title=" + b_title + ", b_content="
				+ b_content + ", b_write_date=" + b_write_date + ", nickname=" + nickname + ", user_ip=" + user_ip
				+ ", board_get=" + board_get + ", board_hits=" + board_hits + ", is_view=" + is_view + "]";
	}
}