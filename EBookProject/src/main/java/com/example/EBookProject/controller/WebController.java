package com.example.EBookProject.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.EBookProject.model.dto.BookDTO;
import com.example.EBookProject.model.dto.WriterDTO;
import com.example.EBookProject.model.service.impl.BookServiceImpl;
import com.example.EBookProject.model.service.impl.WriterServiceImpl;

@Controller
@RequestMapping("/web/*")
public class WebController {
	
	@Inject
	BookServiceImpl bookservice;
	
	@Inject
	WriterServiceImpl writerservice;
	
	@RequestMapping("search")
	public String search(HttpServletRequest request, Model model,String keyword) {
		System.out.println(keyword);
		
		List<BookDTO> searchbook = bookservice.searchbook(keyword);
		
		List<WriterDTO> searchwriter = writerservice.searchwriter(keyword);
		
		if (searchbook.get(0) != null) {
			request.getSession().getServletContext().setAttribute("searchbook", searchbook);
		}
		
		if (searchwriter.get(0) != null) {			
			request.getSession().getServletContext().setAttribute("searchwriter", searchwriter);
		}
		
		model.addAttribute("keyword",keyword);
		return "web/keyword";
	}
}
