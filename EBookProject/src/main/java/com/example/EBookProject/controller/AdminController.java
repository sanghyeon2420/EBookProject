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
import com.example.EBookProject.model.dto.NoticDTO;
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
			
			List<NoticDTO> noticlist=service.noticlist();
			request.setAttribute("notic_list", noticlist);
			
			
			request.setAttribute("listtype", listtype);
		
		return "member/admin";
	}

	@RequestMapping("deleteMember")
	public String deleteMember(int user_no){
		System.out.println("jsp에서 넘어온 유저넘버 번호 : "+user_no);
		MemberDTO dto=new MemberDTO();
		dto.setUser_no(user_no);
		
		service.deleteMember(dto);
		
		return "redirect:/admin/list?listtype=member";
	}
	
	@RequestMapping("deleteBook")
	public String deleteBook(int ebook_no) {
		System.out.println("jsp에서 넘어온 책 번호 : " +ebook_no);
		BookDTO dto = new BookDTO();
		dto.setEbook_no(ebook_no);
		
		service.deleteBook(dto);
		//int result=service.deleteBook(dto);
		//System.out.println("결과수행 : "+result);
		return "redirect:/admin/list?listtype=book";
	}

	@RequestMapping("deleteboard")
	public String deleteboard(int board_no) {
		System.out.println("jsp에서 넘어온 게시판 번호 : " +board_no);
		BoardDTO dto = new BoardDTO();
		dto.setBoard_no(board_no);
		service.deleteboard(dto);
		return "redirect:/admin/list?listtype=board";
	}
	
	
	@RequestMapping("deletenotic")
	public String deletenotic(int notic_no) {
		System.out.println("jsp에서 넘어온 게시판 번호 : " +notic_no);
		NoticDTO dto = new NoticDTO();
		dto.setNotic_no(notic_no);
		service.deletenotic(dto);
		return "redirect:/admin/list?listtype=notic";
	}
	
	@RequestMapping("cookiemanager") 
	public String cookiemanager(int user_no, int cash) {
		System.out.println("jsp에서 넘어온 고객 번호 : "+ user_no);
		System.out.println("jsp에서 입력된 쿠키 값 : "+ cash);
		MemberDTO dto = new MemberDTO();
		dto.setUser_no(user_no);
		dto.setCash(cash);
		
		service.cookiemanager(dto);
		
		return "redirect:/admin/list?listtype=member";
		
	}

}
