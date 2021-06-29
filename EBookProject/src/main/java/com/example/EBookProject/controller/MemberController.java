package com.example.EBookProject.controller;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.EBookProject.model.dto.BookDTO;
import com.example.EBookProject.model.dto.MemberDTO;
import com.example.EBookProject.model.dto.WriterDTO;
import com.example.EBookProject.model.email.EmailDTO;
import com.example.EBookProject.model.service.email.EmailService;
import com.example.EBookProject.model.service.impl.BookServiceImpl;
import com.example.EBookProject.model.service.impl.MemberServiceImpl;
import com.example.EBookProject.model.service.impl.WriterServiceImpl;

@Controller
@RequestMapping("/member/*") // /member/ ()
public class MemberController {

	@Inject
	MemberServiceImpl service;
	
	@Inject
	WriterServiceImpl writerservice;
	
	@Inject
	EmailService emailservice;
	
	@Inject
	BookServiceImpl bookservice;
	
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
		
		WriterDTO writerdto=writerservice.writerinfo(loginDTO.getUser_no());
			
			session.setAttribute("member", loginDTO);
			session.setAttribute("writer", writerdto);
		
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
	
	
	@RequestMapping("search")
	public String search() {
		return "member/search";
	}
	
	@RequestMapping("searchid")
	public String searchid(String username, String nickname, String birthdate) throws Exception {
		MemberDTO dto=new MemberDTO();
		dto.setUsername(username);
		dto.setNickname(nickname);
		DateFormat dateFormat = new SimpleDateFormat ("yyMMdd");
		Date date = dateFormat.parse(birthdate);
		dto.setBirthdate(date);
		
		MemberDTO searchDTO=service.searchID(dto); // DB에서 넘어온
		EmailDTO emailDTO=new EmailDTO();
		emailDTO.setSenderName("EBookProject");
		emailDTO.setSenderMail("EBookProject@EBook.com");
		emailDTO.setReceiveMail(searchDTO.getEmail());
		emailDTO.setSubject("EBookProject 아이디찾기입니다.");
		emailDTO.setMessage(searchDTO.getUsername()+"님의 아이디는 "+searchDTO.getUserid()+"입니다.");
		
		emailservice.sendMail(emailDTO);
		
		
		return "member/search";
	}

	
	@RequestMapping("searchpw")
	public String searchpw(String userid, String username, String birthdate) throws Exception {
		MemberDTO dto=new MemberDTO();
		dto.setUserid(userid);
		dto.setUsername(username);
		DateFormat dateFormat = new SimpleDateFormat ("yyMMdd");
		Date date = dateFormat.parse(birthdate);
		dto.setBirthdate(date);
		
		
		MemberDTO searchDTO=service.searchPW(dto); // DB에서 넘어온 비밀번호
		
		EmailDTO emailDTO=new EmailDTO();
		emailDTO.setSenderName("EBookProject");
		emailDTO.setSenderMail("EBookProject@EBook.com");
		emailDTO.setReceiveMail(searchDTO.getEmail());
		emailDTO.setSubject("EBookProject 비밀번호찾기입니다.");
		emailDTO.setMessage(searchDTO.getUsername()+"님의 비밀번호는 "+searchDTO.getUserpw()+"입니다.");
		
		emailservice.sendMail(emailDTO);
		
		
		return "member/search";
}
	@RequestMapping("viewdetail")
	public String viewWriter(HttpServletRequest request, HttpSession session) {
		  MemberDTO memberDTO=(MemberDTO)session.getAttribute("member");
		  WriterDTO writerDTO=(WriterDTO)session.getAttribute("writer");
		  
		  System.out.println(memberDTO);
		  System.out.println(writerDTO);
		  
		  request.setAttribute("memberDTO", memberDTO);
		  request.setAttribute("dto", writerDTO);
		  
		  List<BookDTO> list=bookservice.writerbook(writerDTO.getWriter_no());
		  
		  request.setAttribute("list", list);
		return "member/writerinfo";
	}
	
	@RequestMapping("update")
	public String update() {
		return "member/settingUpdate";
	}
	
	@RequestMapping("memberUpdate")
	public String memberUpdate(HttpServletRequest request, int user_no) {
		MemberDTO dto = service.memberUpdate(user_no);
		request.setAttribute("dto", dto);
		return "member/memberUpdate";
	}
	
	
	
	@RequestMapping("updateMember")
	public String updateMember(HttpSession session,String userpw, String nickname, String email, String birthdate, int user_no) throws ParseException {
		DateFormat dateFormat = new SimpleDateFormat ("yyMMdd");
		Date date = dateFormat.parse(birthdate);
		MemberDTO dto = service.memberUpdate(user_no);
		dto.setBirthdate(date);
		dto.setUserpw(userpw);
		dto.setNickname(nickname);
		dto.setEmail(email);
		System.out.println(dto);
		service.updateMember(dto); // 회원정보 수정
		MemberDTO updatememberDTO=service.memberUpdate(user_no); // 수정된 회원정보를 갖고온다
		session.setAttribute("member", updatememberDTO); // 세션 "member"라는 key값으로 수정된 회원정보 저장!
		
		return "member/setting"; // view페이지 지정
	}
	
	@RequestMapping("deleteMember")
	public String deleteMember(HttpServletRequest request,int user_no){
		System.out.println("jsp에서 넘어온 유저넘버 번호 : "+user_no);
		MemberDTO dto=new MemberDTO();
		dto.setUser_no(user_no);
		HttpSession session=request.getSession();
		session.invalidate(); // 세션 초기화
		service.deleteMember(dto);
		
		return "redirect:/";
	}
	
	// 이용약관 연결
	@RequestMapping("terms")
	public String terms() {
		return "member/termsOfMember";
	}

	// 개인정보취급방침 연결
	@RequestMapping("privacy")
	public String privacy() {
		return "member/privacy_policy";
	}
}