package com.example.EBookProject.model.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.example.EBookProject.Pager;
import com.example.EBookProject.model.dto.NoticDTO;
import com.example.EBookProject.model.service.NoticService;

@Controller
@SessionAttributes("notic")

public class NoticServiceImpl{
	
	@Autowired
	private NoticService noticService;

	// 게시글 등록 뷰
	@RequestMapping("/write")
	public String write(NoticDTO vo) throws Exception {
		return "notic/write";
	}

	// 게시글 등록
	@RequestMapping(value = "/createNotic", method = RequestMethod.POST)
	public String createNotic(NoticDTO vo) throws Exception {
		noticService.createNotic(vo);
		return "notic/list";
	}

	// 게시글 수정 뷰
	@RequestMapping("/updateWrite")
	public String updateWrite(NoticDTO vo) throws Exception {
		return "notic/updateWrite";
	}

	// 게시글 수정
	@RequestMapping(value = "/updateNotic", method = RequestMethod.POST)
	public String updateNotic(NoticDTO vo) throws Exception {
		if (vo.getNotic_title() != null) {
			noticService.updateNotic(vo);
			return "notic/view";
		} else {
			return "notic/write";
		}
		// return "redirect:/board";
	}

	// 게시글 삭제
	@RequestMapping("/delete")
	public String deleteNotic(int notic_no) throws Exception {
		noticService.deleteNotic(notic_no); // 삭제 처리
		return "redirect:/Notic"; // 목록으로 이동
	}

	// 게시글 목록 + 검색 + 페이징
	@RequestMapping("/notic")
	public String listAllNotic(Model model, HttpSession session,
			@RequestParam(defaultValue = "notic_title") String searchOption,  // 기본값 제목
			@RequestParam(defaultValue = "") String keyword,				  // 기본값 null 
			@RequestParam(defaultValue = "") String search, 				
			@RequestParam(defaultValue = "1") int curPage)
			throws Exception {

		// 게시글 갯수 계산
		int count = noticService.getCountNotic(searchOption, keyword);

		session.setAttribute("searchOption", searchOption);
		session.setAttribute("keyword", keyword);
		session.setAttribute("search", search);
		session.setAttribute("curPage", curPage);

		// 페이지 관련 설정
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<NoticDTO> list = noticService.listAllNotic(searchOption, keyword, start, end); // 게시글 목록

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // map에 자료 저장
		map.put("count", count);
		map.put("pager", pager); // 페이지 네버게이션을 위한 변수
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("search", search);
		model.addAttribute("map", map);

		return "notic/list";
	}

	// 게시글 상세보기
	@RequestMapping("/view")
	public String readNotic(@RequestParam("notic_no") int notic_no, 
							@RequestParam("show") String show, Model model, HttpSession session, 
							@RequestParam(defaultValue = "notic_title") String searchOption,
							@RequestParam(defaultValue = "") String keyword, 
							@RequestParam(defaultValue = "") String search,
							@RequestParam(defaultValue = "1") int curPage) throws Exception {

		/* 게시글 예외처리 */
		// 삭제된 게시글울 읽으려고 하는 경우
		int checkNotic = noticService.checkNotic(notic_no);

		if (checkNotic == 0 && show.equals("N")) {
			return "notic/checkDel";
		}

		// 존재하지 않는 게시글에 접근하려는 경우
		else if (checkNotic == 0 && show.equals("Y")) {
			return "notic/checkNone";

		} else if (checkNotic == 1 && show.equals("N")) {
			return "notic/checkNone";
		}

		noticService.notic_viewCnt(notic_no, session); // 조회수
		model.addAttribute("notic", noticService.readNotic(notic_no)); // 게시글 읽기

		// 세션 저장
		searchOption = (String) session.getAttribute("searchOption");
		session.setAttribute("searchOption", searchOption);

		keyword = (String) session.getAttribute("keyword");
		session.setAttribute("keyword", keyword);

		search = (String) session.getAttribute("search");
		session.setAttribute("search", search);

//		curPage = (int) session.getAttribute("curPage");
		curPage = (Integer) session.getAttribute("curPage");
		session.setAttribute("curPage", curPage);

		NoticDTO plist = noticService.previousB(notic_no);
		NoticDTO nlist = noticService.nextB(notic_no);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("previousB", plist);
		map.put("nextB", nlist);
		model.addAttribute("map", map);

		return "notic/view";
	}
}
