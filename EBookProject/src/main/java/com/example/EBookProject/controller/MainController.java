package com.example.EBookProject.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.EBookProject.model.dto.BookcategoryDTO;
import com.example.EBookProject.model.service.impl.BookServiceImpl;

@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Inject
	BookServiceImpl bookservice;
	
	@RequestMapping("/")
	public String index(HttpServletRequest request) {
		
		List<BookcategoryDTO> list=bookservice.bookcategory();
		request.setAttribute("list", list);
		
		return "index";
	}
	
	
}
