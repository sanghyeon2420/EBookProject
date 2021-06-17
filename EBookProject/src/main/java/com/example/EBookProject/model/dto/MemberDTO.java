package com.example.EBookProject.model.dto;

import java.util.Date;


public class MemberDTO {
	
	private int user_no; // 회원번호
	private String userid; // 회원ID
	private String userpw; // 회원PW
	private String nickname; // 닉네임
	private String username; // 이름
	private String email; // 이메일
	private Date birthdate; // 생년월일
	private int cash; // 잔고
	private int login_class; // 가입타입 1 = 일반, 2 = 네이버, 3 = 카카오   로그인
	private int isAdmin; // 관리자여부, 1 = 일반회원, 2 = 관리자
	
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public int getCash() {
		return cash;
	}
	public void setCash(int cash) {
		this.cash = cash;
	}
	public int getLogin_class() {
		return login_class;
	}
	public void setLogin_class(int login_class) {
		this.login_class = login_class;
	}
	public int getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}
	@Override
	public String toString() {
		return "MemberDTO [user_no=" + user_no + ", userid=" + userid + ", userpw=" + userpw + ", nickname=" + nickname
				+ ", username=" + username + ", email=" + email + ", birthdate=" + birthdate + ", cash=" + cash
				+ ", login_class=" + login_class + ", isAdmin=" + isAdmin + "]";
	}
	
	

	

	
	
}
