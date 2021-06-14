package com.example.EBookProject.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.EBookProject.model.dto.BookcategoryDTO;
import com.example.EBookProject.model.dto.NoticDTO;
import com.example.EBookProject.model.service.impl.BookServiceImpl;
import com.example.EBookProject.model.service.impl.NoticServiceImpl;
import com.example.EBookProject.model.service.impl.WriterServiceImpl;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Inject
	BookServiceImpl bookservice;
	
	@Inject
	NoticServiceImpl noticservice;
	
	
	
	@RequestMapping("/")
	public String index(HttpServletRequest request) {
		
		List<BookcategoryDTO> list=bookservice.bookcategory();
		
		
		// application 객체 사용 
		// getServletContext() -> Returns: The ServletContext object for the web application
		request.getSession().getServletContext().setAttribute("list", list);
		
		return "index";
	}
	
	@RequestMapping("notic")
	public String notic() {
		List<NoticDTO> list=noticservice.list();
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
		return "notic";
	}
	
}
