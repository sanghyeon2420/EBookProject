package com.example.EBookProject.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.EBookProject.model.dto.BookDTO;
import com.example.EBookProject.model.service.impl.BookServiceImpl;

@Controller
@RequestMapping("/book/*")
public class BookController {
	
	@Inject
	BookServiceImpl service;
	
	@RequestMapping("list")
	public ModelAndView BookList(ModelAndView mav,int idx) {
			mav.setViewName("book/booklist");
			System.out.println(idx);
			
			List<BookDTO> list=service.booklist(idx);
			
			for (int i = 0; i < list.size(); i++) {
				System.out.println(list.get(i));
			}
			
			mav.addObject("list",list);
			
			return mav;
	}
	
}
