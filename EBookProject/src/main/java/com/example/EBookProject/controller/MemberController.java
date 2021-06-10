package com.example.EBookProject.controller;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.EBookProject.model.service.impl.MemberServiceImpl;

@Controller
@RequestMapping("/member/*") // /member/ ()
public class MemberController {

	@Inject
	MemberServiceImpl service;
	
	@RequestMapping("login")
	public String loin(Locale locale, Model model) {

		return "member/login";
	}

	@RequestMapping("join")
	public String join(Locale locale, Model model) {

		return "member/join";
	}

	@RequestMapping("idcheck")
	@ResponseBody
	public String idcheck(@RequestBody String userid, HttpServletRequest request) {
				int idx=userid.indexOf('=');
				userid = userid.substring(idx+1);
				
				int result=service.Id_Check(userid);
				System.out.println(result);
		if(result == 0) {
			return "use"; // 사용할 수 있는 아이디
			
		} else {
			return "notuse"; // 이미 있는 아이디
			
		}
	}
}
