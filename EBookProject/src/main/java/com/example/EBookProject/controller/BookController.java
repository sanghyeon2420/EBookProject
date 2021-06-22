package com.example.EBookProject.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.EBookProject.model.dto.BookDTO;
import com.example.EBookProject.model.dto.ContentDTO;
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
			String category=list.get(0).getB_category();
			System.out.println("카테고리: =====>>>>>"+category);
			mav.addObject("category", category);
			mav.addObject("list",list);
			
			return mav;
	}
	
	@RequestMapping("detail") 
	public ModelAndView detail(ModelAndView mav, int idx) {
		int ebook_no=idx;
		BookDTO dto =service.Bookdetail(ebook_no);
		System.err.println(dto); 
		mav.addObject("bookdto",dto);
		//  EBookProject/WEB-INF/views/boardlist.jsp
		mav.setViewName("book/pageBone");
		
		// 랭크 순위 불러오기	
		int rank=service.detail_rank(idx);
		System.out.println("랭크순위"+rank);
		mav.addObject("rank",rank);	
			
		//content 불러오기
		List<ContentDTO> list = service.contentdetail(ebook_no);
		mav.addObject("list",list);
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
		
		return mav;
	}
	
	
	@RequestMapping("contentview")
	public String viewaaaaaaaaaaaaaaaaaaaaa(int contents_no) {
		System.out.println(contents_no);
		return "book/sdfasddsf";
	}

}
