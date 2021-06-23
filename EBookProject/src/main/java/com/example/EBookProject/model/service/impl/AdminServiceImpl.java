package com.example.EBookProject.model.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.EBookProject.model.dao.impl.AdminDAOImpl;
import com.example.EBookProject.model.dto.BoardDTO;
import com.example.EBookProject.model.dto.BookDTO;
import com.example.EBookProject.model.dto.MemberDTO;
import com.example.EBookProject.model.service.AdminService;


@Service //bean으로 등록
public class AdminServiceImpl implements AdminService {
	
	@Inject
	AdminDAOImpl dao;
	
	
	@Override
	public List<MemberDTO> memberlist() {
		return dao.memberlist();
	}


	@Override
	public List<BookDTO> booklist() {
		return dao.booklist();
	}


	@Override
	public List<BoardDTO> booadlist() {
		return dao.booadlist();
	}

}
