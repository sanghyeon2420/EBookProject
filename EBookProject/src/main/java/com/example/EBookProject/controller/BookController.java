package com.example.EBookProject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/book/*")
public class BookController {
	
	@RequestMapping("list")
	public String BookList(String idx) {
			System.out.println(idx);
			return "book/booklist";
	}
	
}
