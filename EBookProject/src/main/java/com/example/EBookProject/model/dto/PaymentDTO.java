package com.example.EBookProject.model.dto;

import java.util.Date;

public class PaymentDTO {
	private int payment_id;  //결제 번호
	private int prd_id;  //쿠키 상품 정보
	private int user_no;  //회원 번호
	private Date payment_date;  //구매일
	public int getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}
	public int getPrd_id() {
		return prd_id;
	}
	public void setPrd_id(int prd_id) {
		this.prd_id = prd_id;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	@Override
	public String toString() {
		return "PaymentDTO [payment_id=" + payment_id + ", prd_id=" + prd_id + ", user_no=" + user_no
				+ ", payment_date=" + payment_date + "]";
	}
	
	
}
