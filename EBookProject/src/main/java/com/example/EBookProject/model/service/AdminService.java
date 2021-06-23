package com.example.EBookProject.model.service;

import java.util.List;

import com.example.EBookProject.model.dto.BoardDTO;
import com.example.EBookProject.model.dto.BookDTO;
import com.example.EBookProject.model.dto.MemberDTO;

public interface AdminService {
	public List<MemberDTO> memberlist();
	public List<BookDTO> booklist();
	public List<BoardDTO> booadlist();
}
