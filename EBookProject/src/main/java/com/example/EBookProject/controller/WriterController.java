package com.example.EBookProject.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.EBookProject.model.dto.BookDTO;
import com.example.EBookProject.model.dto.MemberDTO;
import com.example.EBookProject.model.dto.WriterDTO;
import com.example.EBookProject.model.service.impl.BookServiceImpl;
import com.example.EBookProject.model.service.impl.WriterServiceImpl;

@Controller
@RequestMapping("/writer/*")
public class WriterController {

	@Inject
	BookServiceImpl bookservice;

	@Inject
	WriterServiceImpl writerservice;

	@RequestMapping("viewdetail")
	public String viewWriter(HttpServletRequest request, int writer_no) {
		System.out.println("작가번호 : " + writer_no);
		List<BookDTO> list = bookservice.writerbook(writer_no);
		WriterDTO dto = writerservice.writerbring(writer_no);
		request.setAttribute("list", list);
		request.setAttribute("dto", dto);

		// localhost:8080/EBookProject/writer/resources/image/image.jpg
		return "member/writerintro";
	}

	@ResponseBody
	@RequestMapping("hits") // /writer/hits
	public String hits(String writer_no) {
		int writer_num = Integer.parseInt(writer_no);
		System.out.println("writer controller writer_no :====>>>" + writer_no);
		writerservice.updateHits(writer_num); // 추천수 증가
		WriterDTO dto = writerservice.writerbring(writer_num);
		return String.valueOf(dto.getW_hits());
	}

	@RequestMapping("insertBook")
	public String insertBook(HttpServletRequest request,HttpSession session) {
				
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member"); // session객체 "member"키값으로 값 가져오기
		WriterDTO writerDTO = (WriterDTO) session.getAttribute("writer");
		
		request.setAttribute("memberDTO", memberDTO); // request 객체에 memberDTO 저장
		request.setAttribute("writerDTO", writerDTO);
			
		return "member/writeinfo";
	}
	
	
}
