package com.example.EBookProject.model.dao;

import com.example.EBookProject.model.dto.MemberDTO;
import com.example.EBookProject.model.dto.PaymentDTO;

public interface PaymentDAO {
	public PaymentDTO paymentbring(int user_no); // 회원번호로 구매 불러오기
	public int contentBuy(MemberDTO dto,int cookie);
	public void contentResult(int user_no,int contents_no);

}
