package com.example.EBookProject.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.EBookProject.model.dto.PaymentDTO;
import com.example.EBookProject.model.service.impl.PaymentServiceImpl;

@Controller
@RequestMapping("/payment/*")
public class PaymentController {

	@Inject
	PaymentServiceImpl service;
	
	@RequestMapping("paymentbring")
	public ModelAndView paymentbring(HttpServletRequest request, ModelAndView mav, int idx) {
		int user_no = idx;
		PaymentDTO dto = service.paymentbring(user_no);
		System.out.println(dto);
		mav.addObject("paymentdto", dto);
		mav.setViewName("payment/payment");
		
		return mav;
	}
	
}
