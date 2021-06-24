package com.example.EBookProject.model.dao;

import java.util.List;

import com.example.EBookProject.model.dto.BoardDTO;
import com.example.EBookProject.model.dto.BookDTO;
import com.example.EBookProject.model.dto.MemberDTO;

public interface AdminDAO {
	public List<MemberDTO> memberlist();
	public List<BookDTO> booklist();
	public List<BoardDTO> booadlist();
	public void deleteMember(MemberDTO dto);
	public void deleteBook(BookDTO dto);
	public void deleteboard(BoardDTO dto);
	public void cookiemanager(MemberDTO dto);
}
