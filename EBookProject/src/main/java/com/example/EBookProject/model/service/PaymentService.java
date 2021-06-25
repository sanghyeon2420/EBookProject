package com.example.EBookProject.model.service;

import com.example.EBookProject.model.dto.PaymentDTO;

public interface PaymentService {
	public PaymentDTO paymentbring(int user_no); // 회원번호로 구매 불러오기
}
