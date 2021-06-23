package com.example.EBookProject.controller;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.EBookProject.model.dto.MemberDTO;
import com.example.EBookProject.model.dto.WriterDTO;
import com.example.EBookProject.model.service.impl.MemberServiceImpl;
import com.example.EBookProject.model.service.impl.WriterServiceImpl;

@Controller
@RequestMapping("/member/*") // /member/ ()
public class MemberController {

	@Inject
	MemberServiceImpl service;
	
	@Inject
	WriterServiceImpl writerservice;
	
	
	@RequestMapping("login")
	public String loin(Locale locale, Model model) {

		return "member/login";
	}
	
	@ResponseBody
	@RequestMapping("login/proc") // 로그인 성공여부
	public String loin_proc(HttpServletRequest request, HttpSession session, String userid, String userpw) {
		MemberDTO dto= new MemberDTO();
		System.out.println(userid);
		System.out.println(userpw);
		dto.setUserid(userid);
		dto.setUserpw(userpw);
		int check = service.logincheck(dto);
		System.out.println(check);
		String result=String.valueOf(check);
		return result;
	}
	
	
	@RequestMapping("login/success") // 로그인 성공시 페이지 이동
	public String login_success(MemberDTO dto, HttpSession session) {
		System.out.println("dto:"+dto.getUserid());
		System.out.println("dto:"+dto.getUserpw());
		
		MemberDTO loginDTO=service.LoginInfo(dto); 
		session.setAttribute("member", loginDTO);
		
		WriterDTO writerdto=writerservice.writerinfo(loginDTO.getUser_no());
		
		if (dto != null) {
			session.setAttribute("writer", writerdto);
		}
		
		return "redirect:/";
	}
	
	@RequestMapping("join")
	public String join(Locale locale, Model model) {
		
		return "member/join";
	}
	
	@ResponseBody
	@RequestMapping("join/proc") // 회원가입 
	public void join_proc(String userid, String userpw, String username, String nickname, String email, String birthdate) throws ParseException {
		// String 타입을 Date 타입으로 변환
		DateFormat dateFormat = new SimpleDateFormat ("yyMMdd");
		Date date = dateFormat.parse(birthdate);
		System.out.println(date);
		MemberDTO dto = new MemberDTO();
		
		
		
		dto.setUserid(userid);
		dto.setUserpw(userpw);
		dto.setUsername(username);
		dto.setNickname(nickname);
		dto.setEmail(email);
		dto.setBirthdate(date);
		
		System.out.println(userid);
		System.out.println(userpw);
		System.out.println(username);
		System.out.println(nickname);
		System.out.println(email);
		System.out.println(birthdate);
		
		service.SignUp(dto);


	}

	
	@ResponseBody
	@RequestMapping("idcheck")
	public String idcheck(String userid, HttpServletRequest request) {
				System.out.println("view에서 넘어온 userid="+userid);
				int result=service.Id_Check(userid);
				System.out.println(result);
		if(result == 0) {
			return "use"; // 사용할 수 있는 아이디
			
		} else {
			return "notuse"; // 이미 있는 아이디
			
		}
	}
	
	@ResponseBody
	@RequestMapping("nicknamecheck")
	public String nicknamecheck(String nickname, HttpServletRequest request){
				System.out.println("view에서 넘어온 nickname="+nickname);
				
				int result=service.NickCheck(nickname);
				System.out.println(result);
		if(result == 0) {
			return "use"; // 사용할 수 있는 닉네임
			
		} else {
			return "notuse"; // 이미 있는 닉네임
			
		}
	}
	
	
	@RequestMapping("logout")
	public String Logout(HttpServletRequest request) {
		//"index";
		//url http://localhost:8080/EBookProject/member/index.jsp
		
		request.getSession().invalidate(); // 세션 무효화
		return "redirect:/"; 
	};
	
	@RequestMapping("setting")
	public String setting() {
		return "member/setting";
	}
	
	
	@RequestMapping("admin")
	public String admin() {
		return "member/admin";
	}
}
