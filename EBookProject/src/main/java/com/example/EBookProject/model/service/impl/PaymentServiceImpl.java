package com.example.EBookProject.model.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.EBookProject.model.dao.impl.PaymentDAOImpl;
import com.example.EBookProject.model.dto.MemberDTO;
import com.example.EBookProject.model.dto.PaymentDTO;
import com.example.EBookProject.model.service.PaymentService;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Inject
	PaymentDAOImpl dao;

	@Override
	public PaymentDTO paymentbring(int user_no) {
		return dao.paymentbring(user_no);
	}

	@Override
	public int contentsBuy(MemberDTO dto,int cookie) {
		
		
		return dao.contentBuy(dto,cookie);
	}


}
