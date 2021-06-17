package com.example.EBookProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/*") // board/ list <- 첫화면
public class BoardController {
	
	@RequestMapping("list") 
	public String List() {
		//  EBookProject/WEB-INF/views/boardlist.jsp
		return "board/boardlist";
	}
	

}
