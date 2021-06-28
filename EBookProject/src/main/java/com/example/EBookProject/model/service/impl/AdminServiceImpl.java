package com.example.EBookProject.model.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.EBookProject.model.dao.impl.AdminDAOImpl;
import com.example.EBookProject.model.dto.BoardDTO;
import com.example.EBookProject.model.dto.BookDTO;
import com.example.EBookProject.model.dto.MemberDTO;
import com.example.EBookProject.model.dto.NoticDTO;
import com.example.EBookProject.model.service.AdminService;


@Service //bean으로 등록
public class AdminServiceImpl implements AdminService {
	
	@Inject
	AdminDAOImpl dao;
	
	@Override
	// 회원리스트 불러오기 
	public List<MemberDTO> memberlist() {
		return dao.memberlist();
	}

	@Override
	// 책리스트 불러오기 
	public List<BookDTO> booklist() {
		return dao.booklist();
	}

	@Override
	// 게시글리스트 불러오기 
	public List<BoardDTO> booadlist() {
		return dao.booadlist();
	}
	
	@Override
	public List<NoticDTO> noticlist() {
		return dao.noticlist();
	}

	@Override 
	// 회원 탈퇴 
	public void deleteMember(MemberDTO dto) {
		dao.deleteMember(dto);	
	}

	@Override
	// 책 삭제 
	public void deleteBook(BookDTO dto) {
		dao.deleteBook(dto);
	}

	@Override
	//게시글 삭제 
	public void deleteboard(BoardDTO dto) {
		dao.deleteboard(dto);
	}
	
	@Override
	// 공지사항 삭제 
	public void deletenotic(NoticDTO dto) {
		dao.deletenotic(dto);
		
	}
	
	@Override
	public void cookiemanager(MemberDTO dto) {
		dao.cookiemanager(dto);
	}

	@Override
	public void insertNotic(NoticDTO dto) {
		dao.insertNotic(dto);
		
	}

}
