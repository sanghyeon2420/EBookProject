package com.example.EBookProject.model.dao.impl;

import java.util.HashMap;
import java.util.Map;

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

	@Override
	public int contentBuy(int user_no, int contents_no) {
		Map<String, Object> map = new HashMap<>();
		map.put("user_no",user_no);
		map.put("contents_no", contents_no);
		return sqlSession.update("payment.buy",map);
		
	}

	@Override
	public void contentResult(int user_no, int contents_no) {
		Map<String, Object> map = new HashMap<>();
		map.put("user_no",user_no);
		map.put("contents_no", contents_no);
		sqlSession.insert("payment.result",map);		
	}

	

}
