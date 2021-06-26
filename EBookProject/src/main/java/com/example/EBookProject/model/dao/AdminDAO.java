package com.example.EBookProject.model.dao;

import java.util.List;

import com.example.EBookProject.model.dto.BoardDTO;
import com.example.EBookProject.model.dto.BookDTO;
import com.example.EBookProject.model.dto.MemberDTO;
import com.example.EBookProject.model.dto.NoticDTO;

public interface AdminDAO {
	
	// 목록 불러오기 
	public List<MemberDTO> memberlist();
	public List<BookDTO> booklist();
	public List<BoardDTO> booadlist();
	public List<NoticDTO> noticlist();
	
	// 관리자 삭제업무 
	public void deleteMember(MemberDTO dto);
	public void deleteBook(BookDTO dto);
	public void deleteboard(BoardDTO dto);
	public void deletenotic(NoticDTO dto);
	
	// 관리자 쿠키 수정 
	public void cookiemanager(MemberDTO dto);
	
	// 공지사항 쓰기 
	public void insertNotic(NoticDTO dto); 
}
