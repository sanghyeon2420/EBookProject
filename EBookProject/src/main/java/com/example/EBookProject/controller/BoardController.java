package com.example.EBookProject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView list() throws Exception {
		
		//검색 옵션(,,,)
		List<BoardDTO> list = boardService.listAll(0,0,"","");
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("board/boardlist");//이동할 페이지지정("이동할페이지");
		Map<String,Object> map = new HashMap<>();		
		map.put("blist", list);		//맵에 자료저장
		mav.addObject("map",map);				//데이터저장
		//  EBookProject/WEB-INF/views/boardlist.jsp
		//return "board/boardlist";
		return mav;
	}
}