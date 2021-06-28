package com.example.EBookProject.controller;

import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.EBookProject.common.Pager;
import com.example.EBookProject.model.dto.BoardDTO;
import com.example.EBookProject.model.dto.MemberDTO;
import com.example.EBookProject.model.service.BoardService;

@Controller
@RequestMapping("/board/*") // board/ list <- 첫화면
public class BoardController {
	@Inject
	BoardService boardService;

	@RequestMapping("insert")
	public String insert(HttpServletRequest request, BoardDTO dto, HttpSession session) {
		String ip = request.getRemoteAddr();

		if (ip.equals("0:0:0:0:0:0:0:1")) {
			try {
				ip = Inet4Address.getLocalHost().getHostAddress();
			} catch (UnknownHostException e) {
				e.printStackTrace();
			}
		}
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		dto.setUser_no(memberDTO.getUser_no());
		dto.setUser_ip(ip);

		System.out.println(dto);

		boardService.insertBoard(dto);

		// boardService.insertBoard(dto);

		// 목록 갱신
		return "redirect:/board/list";

	}

	@RequestMapping("write")
	public String write() {
		return "board/write";
	}

	@RequestMapping("list")
	public ModelAndView list(@RequestParam(defaultValue = "1") int curPage,
			@RequestParam(defaultValue = "all") String search_option, @RequestParam(defaultValue = "") String keyword)
			throws Exception {

		// 레코드 갯수 계산
		int count = boardService.countArticle(search_option, keyword);

		// 페이지 나누기 관련 처리
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<BoardDTO> list = boardService.listAll(start, end, search_option, keyword); // 목록

		ModelAndView mav = new ModelAndView();

		mav.setViewName("board/boardlist");// 이동할 페이지지정("이동할페이지");
		Map<String, Object> map = new HashMap<>();
		map.put("list", list); // 맵에 자료저장
		map.put("count", count);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("pager", pager);
		mav.addObject("map", map); // 데이터저장
		// EBookProject/WEB-INF/views/boardlist.jsp
		// return "board/boardlist";
		return mav;
	}

	@RequestMapping("view")
	public ModelAndView read(HttpSession session,@RequestParam("board_no") int board_no, HttpServletRequest request, ModelAndView mav)
			throws Exception {
		System.out.println(board_no);
		
		// 조회수 증가처리
		// 타이머 설정
		long update_time = 0;

		if (session.getAttribute("update_time_" + board_no) != null) {
			// 최근에 조회수를 올린 시간
			update_time = (Long) session.getAttribute("update_time_" + board_no);
		}
		long current_time = System.currentTimeMillis();
		// 일정 시간이 경과한 후 조회수 증가 처리
		if (current_time - update_time > 5 * 10000) {
			// 조회수 증가 처리
			boardService.boardget(board_no);
			
			// 조회수를 올린 시간 저장
			session.setAttribute("update_time_" + board_no, current_time);
		}

		BoardDTO dto = boardService.read(board_no);
		
		
		mav.addObject("boarddto", dto);
		mav.setViewName("board/boardDetail");
		System.out.println(dto);

		return mav;
	}

	@RequestMapping("deleteBoard")
	public String deleteBoard(int board_no) {
		System.out.println("jsp에서 넘어옵 보드넘버" + board_no);
		boardService.boardDelete(board_no);
		return "redirect:/board/list";
	}

	@RequestMapping("boardUpdate")
	public String updateBoard(HttpServletRequest request, int board_no) {
		BoardDTO dto = boardService.boardUpdate(board_no);
		request.setAttribute("dto", dto);
		return "board/boardUpdate";
	}

	@RequestMapping("updateResult")
	public String updateResult(String b_content, String b_title, int board_no) { // jsp에서 넘어온 BoardDTO dto
		BoardDTO dto = boardService.boardUpdate(board_no); // 수정할 게시글의 정보
		dto.setB_content(b_content); // 수정한 내용을 dto타입으로 저장
		dto.setB_title(b_title); // 수정한 제목을 dto타입으로 저장
		System.out.println("aa" + dto);
		boardService.updateResult(dto);
		return "redirect:/board/view?board_no="+board_no;
	}
}