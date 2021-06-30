package com.example.EBookProject.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.EBookProject.model.dao.impl.LikebookDAOImpl;
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

	@Inject
	LikebookDAOImpl likedao;

	@RequestMapping("list")
	public ModelAndView BookList(ModelAndView mav, int idx) {
		mav.setViewName("book/booklist");
		System.out.println(idx);

		List<BookDTO> list = service.booklist(idx);

		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
		String category = list.get(0).getB_category();
		System.out.println("카테고리: =====>>>>>" + category);
		mav.addObject("category", category);
		mav.addObject("list", list);

		return mav;
	}

	@RequestMapping("detail")
	public ModelAndView detail(HttpServletRequest request, ModelAndView mav, int idx, HttpSession session) {
		int ebook_no = idx;
		BookDTO dto = service.Bookdetail(ebook_no);
		System.err.println(dto);
		mav.addObject("bookdto", dto);
		// EBookProject/WEB-INF/views/boardlist.jsp
		mav.setViewName("book/pageBone");

		// 랭크 순위 불러오기
		int rank = service.detail_rank(idx);
		System.out.println("랭크순위" + rank);
		mav.addObject("rank", rank);

		// content 불러오기
		List<ContentDTO> list = service.contentdetail(ebook_no);
		mav.addObject("list", list);
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}

		LikebookDTO likeBookdto = new LikebookDTO();
		likeBookdto.setLike_bookno(ebook_no);
		MemberDTO memberdto = (MemberDTO) session.getAttribute("member");
		likeBookdto.setLike_id(memberdto.getUser_no());
		int count = service.countLikebook(likeBookdto);

		mav.addObject("count", count);
		return mav;
	}

	@ResponseBody
	@RequestMapping("hits")
	public void hits(HttpServletRequest request, HttpSession session, String ebook_no, String count) {

		int ebook_num = Integer.parseInt(ebook_no);
		int countLike = Integer.parseInt(count);
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");

		LikebookDTO likeDTO = new LikebookDTO();
		likeDTO.setLike_bookno(ebook_num);
		likeDTO.setLike_id(memberDTO.getUser_no());

		System.err.println("카운트!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" + countLike);

		if (countLike == 0) { // 추천을 안함
			likedao.insertLike(likeDTO); // 추천테이블에 정보저장
		}

		if (countLike == 1) { // 추천을 함
			likedao.deleteLike(likeDTO);
		}

		int result = likedao.countLike(likeDTO);

		BookDTO dto = service.Bookdetail(ebook_num);
		request.setAttribute("bookdto", dto);
		request.setAttribute("count", result);
	}

	@RequestMapping("contentview")
	public String contentview(HttpSession session, Model model, int book, int content) {
		System.out.println("book = ebook_no =>" + book);
		System.out.println("content = contentlist =>" + content);

		// 조회수 증가처리
		// 타이머 설정
		long update_time = 0;

		if (session.getAttribute("update_time_" + book) != null) {
			// 최근에 조회수를 올린 시간
			update_time = (Long) session.getAttribute("update_time_" + book);
		}
		long current_time = System.currentTimeMillis();
		// 일정 시간이 경과한 후 조회수 증가 처리
		if (current_time - update_time > 5 * 10000) {
			// 조회수 증가 처리
			service.bookget(book);
			// 조회수를 올린 시간 저장
			session.setAttribute("update_time_" + book, current_time);
		}

		int contentCount = service.contentCount(book);
		BookDTO dto = service.Bookdetail(book);

		model.addAttribute("ebook_no", dto.getEbook_no());
		model.addAttribute("book", book);
		model.addAttribute("content", content);
		model.addAttribute("contentCount", contentCount);
		model.addAttribute("b_category", dto.getB_category());
		model.addAttribute("b_name", dto.getB_name());
		model.addAttribute("content_name", service.contentName(book, content));
		model.addAttribute("ebook_no", dto.getEbook_no());
		return "book/viewer"; // 이동할 페이지 지정
	}

	@RequestMapping("bookinsert")
	public String bookinsert(String b_name, String b_category, String b_intro, String nickname, String completion,
			@RequestParam("image") File file) {
		System.out.println(file.getName()); // 파일 이름 가져오기

		File src = new File("C:\\projectimage\\" + file.getName()); // 원본파일 경로명

		File dest = new File(
				"C:\\Users\\Kimsanghyeon\\git\\EBookProject\\EBookProject\\src\\main\\webapp\\resources\\images\\"
						+ b_category + "\\" + file.getName()); // 복사할 파일 경로, 이름

		int c;
		try {
			FileInputStream fi = new FileInputStream(src); // 파일 입력 바이트 스트림 생성
			FileOutputStream fo = new FileOutputStream(dest); // 파일 출력 바이트 스트림 생성

			while ((c = fi.read()) != -1) {
				fo.write((byte) c);
			}
			fi.close();
			fo.close();
			System.out.println(src.getPath() + "를 " + dest.getPath() + "로 복사하였습니다.");
		} catch (IOException e) {
			System.out.println("파일 오류 복사");
		}

		// 도서명으로된 디렉토리 생성
		File mkdirFile = new File(
				"C:\\Users\\Kimsanghyeon\\git\\EBookProject\\EBookProject\\src\\main\\webapp\\resources\\text\\"
						+ b_category + "\\" + b_name);
		mkdirFile.mkdir();

		System.out.println(b_name); // 도서명
		System.out.println(b_category); // 카테고리
		System.out.println(b_intro); // 작품 소개
		System.out.println(nickname); // 닉네임, 작가명
		System.out.println(completion); // 연재 continue 완결 finish

		BookDTO dto = new BookDTO();
		dto.setB_name(b_name);
		dto.setB_category(b_category);
		dto.setB_intro(b_intro);
		dto.setW_name(nickname);
		dto.setImagefileName(file.getName());

		// bookinfo 테이블에 저장
		service.insertBook(dto);

		return "redirect:/member/viewdetail";

	}

	// 개인정보취급방침 연결
	@RequestMapping("privacy")
	public String privacy() {
		return "member/privacy_policy";
	}

	// 이용약관 연결
	@RequestMapping("terms")
	public String terms() {
		return "member/termsOfMember";
	}

	@RequestMapping
	public String contentInsert(ContentDTO dto, String b_content, String b_title) {

		BookDTO bookDTO = service.Bookdetail(dto.getEbook_no());
			
		// 텍스트파일로 내용 쓰기
		dto.setContent_name(b_title);

		String fileName = "C:\\Users\\Kimsanghyeon\\git\\EBookProject\\EBookProject\\src\\main\\webapp\\resources\\text\\"
				+ bookDTO.getB_category() + "\\" + bookDTO.getB_name() + "\\" + service.selectContentlist(dto.getEbook_no()) + ".txt";

		System.out.println(b_content);

		System.out.println(dto);
		
		// DB에 추가
		service.insertContent(dto);
		
		try {

			// BufferedWriter 와 FileWriter를 조합하여 사용 (속도 향상)
			BufferedWriter fw = new BufferedWriter(new FileWriter(fileName, true));

			// 파일안에 문자열 쓰기
			fw.write(b_content);
			fw.flush();

			// 객체 닫기
			fw.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	
		return "aaaaaaaaaaaaaaaaaaaa";
	}
}