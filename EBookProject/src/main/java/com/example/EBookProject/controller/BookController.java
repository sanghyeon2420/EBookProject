package com.example.EBookProject.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.EBookProject.model.dto.BookDTO;
import com.example.EBookProject.model.dto.ContentDTO;
import com.example.EBookProject.model.dto.LikebookDTO;
import com.example.EBookProject.model.dto.MemberDTO;
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
	public ModelAndView detail(HttpServletRequest request,ModelAndView mav, int idx) {
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
		
			
		
		// 조회수 증가 처리
		
/*		// 쿠키 생성
		Cookie[] cookies=request.getCookies();
		
		// 비교하기 위해 새로운 쿠키
		Cookie viewCookie = null;
		
		// 쿠키가 있을 경우
		if(cookies != null && cookies.length > 0) {
			for(int i=0;i<cookies.length;i++) {
				
				// Cookie의 name이 cookie + ebook_no와 일치하는 쿠키를 viewCookie에 넣어줌
				if(cookies[i].getName().equals("cookie"+ebook_no)) {
					System.out.println("처음 쿠키가 생성한 뒤 들어옴.");
					viewCookie = cookies[i];
				}
			}
		}*/
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("hits")
	public String hits(HttpSession session,String ebook_no) {
		String result;
		
		int ebook_num = Integer.parseInt(ebook_no);
		MemberDTO memberDTO=(MemberDTO)session.getAttribute("member");
		
		System.out.println("book controller ebook_no :====>>>"+ebook_no);
		
		LikebookDTO likeDTO = new LikebookDTO();
		likeDTO.setLike_bookno(ebook_num);
		
		
		
		if(memberDTO != null) {
			likeDTO.setLike_id(memberDTO.getUser_no());
		} else {
			result="fail";
		}
			
		
		
		
		
		
		
		
		
		
		
		
		service.bookhits(ebook_num,likeDTO); //추천수 증가
		BookDTO dto=service.Bookdetail(ebook_num);
		result =String.valueOf(dto.getBook_hits());
		return result;
	}
	
	@RequestMapping("contentview")
	public String contentview(Model model,int book,int content) {
		System.out.println("book = ebook_no =>"+book);
		System.out.println("content = contentlist =>"+content);
		
		int contentCount=service.contentCount(book);
		BookDTO dto =service.Bookdetail(book);
		
		model.addAttribute("book",book);
		model.addAttribute("content",content);
		model.addAttribute("contentCount", contentCount);
		model.addAttribute("b_category",dto.getB_category());
		model.addAttribute("b_name",dto.getB_name());
		model.addAttribute("content_name", service.contentName(book, content));
		return "book/viewer"; // 이동할 페이지 지정
	}

}
