package com.example.EBookProject.model.dao.impl;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.EBookProject.model.dao.PaymentDAO;
import com.example.EBookProject.model.dto.PaymentDTO;

@Repository
public class PaymentDAOImpl implements PaymentDAO{
	
	@Inject
	SqlSession sqlSession;

	@Override
	public PaymentDTO paymentbring(int user_no) {
		return sqlSession.selectOne("payment.paymentbring", user_no);
	}

	

}
