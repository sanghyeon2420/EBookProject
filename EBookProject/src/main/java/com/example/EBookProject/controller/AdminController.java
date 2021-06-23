package com.example.EBookProject.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.EBookProject.model.dto.MemberDTO;
import com.example.EBookProject.model.service.impl.AdminServiceImpl;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Inject
	AdminServiceImpl service;
	
	@RequestMapping("memberlist")
	public String memberlist(HttpServletRequest request) {
		List<MemberDTO> list=service.memberlist();
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
		request.setAttribute("memberlist",list);
		return "member/admin";
	}
}
