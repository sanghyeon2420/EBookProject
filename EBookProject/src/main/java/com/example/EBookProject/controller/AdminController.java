package com.example.EBookProject.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.EBookProject.model.dto.BoardDTO;
import com.example.EBookProject.model.dto.BookDTO;
import com.example.EBookProject.model.dto.MemberDTO;
import com.example.EBookProject.model.service.impl.AdminServiceImpl;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Inject
	AdminServiceImpl service;
	
	@RequestMapping("list")
	public String memberlist(HttpServletRequest request,String listtype) {
		System.out.println(listtype);
		
			List<MemberDTO> memberlist=service.memberlist();
			request.setAttribute("member_list",memberlist);			
			List<BookDTO> booklist=service.booklist();
			request.setAttribute("book_list", booklist);
			List<BoardDTO> boardlist=service.booadlist();
			request.setAttribute("board_list", boardlist);
			
			
			request.setAttribute("listtype", listtype);
		
		return "member/admin";
	}

	@RequestMapping("deleteMember")
	public String deleteMember(int user_no){
		System.out.println("jsp에서 넘어온 유저넘버 번호 : "+user_no);
		MemberDTO dto=new MemberDTO();
		dto.setUser_no(user_no);
		
		service.delectMember(dto);
		
		return "redirect:/admin/list?listtype=member";
	}
	
	

	

}
