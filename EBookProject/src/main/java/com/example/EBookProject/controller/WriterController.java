package com.example.EBookProject.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.EBookProject.model.dto.BookDTO;
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
	public String viewWriter(HttpServletRequest request,int writer_no) {
		System.out.println("작가번호 : "+writer_no);
		List<BookDTO> list=bookservice.writerbook(writer_no);
		WriterDTO dto = writerservice.writerbring(writer_no);
		request.setAttribute("list", list);
		request.setAttribute("dto", dto);
		
		// localhost:8080/EBookProject/writer/resoureces/image/image.jpg
		return "member/writerintro";		
	}
}
