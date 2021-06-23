package com.example.EBookProject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.EBookProject.common.Pager;
import com.example.EBookProject.model.dto.BoardDTO;
import com.example.EBookProject.model.service.BoardService;

@Controller
@RequestMapping("/board/*") // board/ list <- 첫화면
public class BoardController {
	
	@Inject
	BoardService boardService;
	
	@RequestMapping("insert")
	public String insert(@ModelAttribute BoardDTO dto, HttpSession session) throws Exception{
		//session.에 저장된 userid변수 값을 불러들임
		String nickname=(String)session.getAttribute("userid");
		dto.setNickname(nickname);
		//record가 저장됨
		boardService.createBoard(dto);
		//목록 갱신
		return "redirect:/board/list";
		
	}
	
	@RequestMapping("write")
	public String write() {
		return "board/write";
	}
	
	@RequestMapping("list") 
	public ModelAndView list(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="all") String search_option, @RequestParam(defaultValue="") String keyword) throws Exception {
		
		// 레코드 갯수 계산
		int count=boardService.countArticle(search_option, keyword);
		
		//페이지 나누기 관련 처리
		Pager pager=new Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		List<BoardDTO> list=boardService.listAll(start, end, search_option, keyword); // 목록

		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("board/boardlist");//이동할 페이지지정("이동할페이지");
		Map<String,Object> map = new HashMap<>();		
		map.put("list", list);		//맵에 자료저장
		map.put("count", count);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("pager", pager);
		mav.addObject("map",map);				//데이터저장
		//  EBookProject/WEB-INF/views/boardlist.jsp
		//return "board/boardlist";
		return mav;
	}
}