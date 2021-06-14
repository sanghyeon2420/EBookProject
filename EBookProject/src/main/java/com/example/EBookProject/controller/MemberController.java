package com.example.EBookProject.controller;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	@RequestMapping("login/proc") // 로그인
	public String loin_proc(HttpSession session,MemberDTO dto) {
		
		int check = service.logincheck(dto);
		
		// check가 1이면 로그인 성공
		if(check == 1) {
			System.out.println("로그인 성공");
			MemberDTO login_success_DTO =service.LoginInfo(dto);
			System.out.println("db에서 가져온 회원정보 dto");
			System.out.println(login_success_DTO);
			
			session.setAttribute("MemberDTO", login_success_DTO);
			
			session.setAttribute("user_no", login_success_DTO.getUser_no());
			session.setAttribute("userid", login_success_DTO.getUserid());
			session.setAttribute("userpw", login_success_DTO.getUserpw());
			session.setAttribute("nickname", login_success_DTO.getNickname());
			session.setAttribute("username", login_success_DTO.getUsername());
			session.setAttribute("email", login_success_DTO.getEmail());
			session.setAttribute("birthdate", login_success_DTO.getBirthdate());
			session.setAttribute("cash", login_success_DTO.getCash());
			
			WriterDTO writerdto=writerservice.writerinfo(login_success_DTO.getUser_no());
			
			session.setAttribute("writer_no", writerdto.getWriter_no());
			session.setAttribute("w_name", writerdto.getW_name());
			session.setAttribute("w_hits", writerdto.getW_hits());
			
			
			if(login_success_DTO.getIsAdmin() == 2) { // 관리자
				return "admin"; // admin.jsp로 이동
			} else { // 일반회원이면
				return "redirect:/"; // 메인페이지로 이동
			}
		} else { // check가 0이면 로그인 실패
			System.out.println("로그인 실패");
			return "redirect:/member/login"; // 로그인 화면으로 돌아가기
		}
		
		
		

	}
	
	
	
	@RequestMapping("join")
	public String join(Locale locale, Model model) {
		
		return "member/join";
	}
	
	@RequestMapping("join/proc") // 회원가입 
	public String join_proc(MemberDTO dto) {
		System.out.println(dto);
		return "redirect:/";
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
	
	
	@RequestMapping("logout")
	public String Logout(HttpServletRequest request) {
		//"index";
		//url http://localhost:8080/EBookProject/member/index.jsp
		
		request.getSession().invalidate(); // 세션 무효화
		return "redirect:/"; 
	};
}
