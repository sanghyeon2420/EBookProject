package com.example.EBookProject.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.EBookProject.model.dao.impl.MemberDAOImpl;
import com.example.EBookProject.model.dto.MemberDTO;
import com.example.EBookProject.model.service.impl.PaymentServiceImpl;

@Controller
@RequestMapping("/pay/*")
public class PaymentController {

	@Inject
	PaymentServiceImpl service;
	
	@Inject
	MemberDAOImpl memberService;
	
	@RequestMapping("productbuy")
	public String Productbuy() {
		return "pay/payment";
	}
	
	@ResponseBody
	@RequestMapping("cookiecharge")
	public void Cookiecharge(HttpSession session,int cookie) {
		int result=0;
		System.out.println(cookie);
		MemberDTO dto = (MemberDTO) session.getAttribute("member");
		
		service.contentsBuy(dto,cookie); // 쿠키 충전
		MemberDTO updateMemberDTO=memberService.memberUpdate(dto.getUser_no());
		session.setAttribute("member", updateMemberDTO);
		
	}
}
