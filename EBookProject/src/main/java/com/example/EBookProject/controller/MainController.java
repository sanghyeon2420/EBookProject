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
import org.springframework.web.servlet.ModelAndView;

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
		
		List<BookcategoryDTO> booklist=bookservice.bookcategory(); // 상단 메뉴 목록
		List<NoticDTO>	noticlist=	noticservice.list(); // 공지사항 목록 
		
		// application 객체 사용 
		// getServletContext() -> Returns: The ServletContext object for the web application
		request.getSession().getServletContext().setAttribute("booklist", booklist);
		
		request.getSession().getServletContext().setAttribute("noticlist", noticlist);
		
		return "index";
	}
	
	@RequestMapping("notic")
	public ModelAndView notic(ModelAndView mav) {
		
//		mav.setViewName("notic"); // view 페이지  notic.jsp
//		
//		List<NoticDTO> list=noticservice.list();
//		for (int i = 0; i < list.size(); i++) {
//			System.out.println(list.get(i));
//		}
//		
//		mav.addObject("list", list); // ModelAndView 객체에 list(공지사항 목록)을 저장
		
		return mav;
	}
	
}
