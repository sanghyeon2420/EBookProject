package com.example.EBookProject.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.EBookProject.model.dto.PaymentDTO;
import com.example.EBookProject.model.service.impl.PaymentServiceImpl;

@Controller
@RequestMapping("/pay/*")
public class PaymentController {

	@Inject
	PaymentServiceImpl service;
	
	@RequestMapping("productbuy")
	public String Productbuy() {
		return "pay/payment";
	}
	
}
