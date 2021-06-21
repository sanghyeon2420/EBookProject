package com.example.EBookProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/writer/*")
public class WriterController {

	@RequestMapping("viewdetail")
	public String viewWriter(int writer_no) {
		System.out.println("작가번호 : "+writer_no);
		// localhost:8080/EBookProject/writer/resoureces/image/image.jpg
		return "member/writer";		
	}
}
