package com.example.EBookProject.model.dto;

import java.sql.Date;

public class MemberJoinDTO {
	private String userid; // 회원ID
	private String userpw; // 회원PW
	private String nickname; // 닉네임
	private String username; // 이름
	private String email; // 이메일
	private Date birhdate; // 생년월일
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getBirhdate() {
		return birhdate;
	}
	public void setBirhdate(Date birhdate) {
		this.birhdate = birhdate;
	}
	
	@Override
	public String toString() {
		return "MemberJoinDTO [userid=" + userid + ", userpw=" + userpw + ", nickname=" + nickname + ", username="
				+ username + ", email=" + email + ", birhdate=" + birhdate + "]";
	}
	
	
}
