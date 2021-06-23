package com.example.EBookProject.model.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.EBookProject.model.dao.BoardDAO;
import com.example.EBookProject.model.dto.BoardDTO;
import com.example.EBookProject.model.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	BoardDAO boardDao;

	@Override
	public void createBoard(BoardDTO board_no) throws Exception {
		boardDao.createBoard(board_no);
	}

	@Override
	public void updateBoard(BoardDTO dto) throws Exception {

	}

	@Override
	public void deleteBoard(int board_no) throws Exception {

	}

	@Override
	public BoardDTO read(int board_no) {
		return null;
	}

	@Override
	public List<BoardDTO> listAll(int start, int end, String search_option, String keyword) throws Exception {
		return boardDao.listAll(start, end, search_option, keyword);
	}
	
	@Override
	public int countArticle(String search_option, String keyword) {
		return boardDao.countArticle(search_option, keyword);
	}
	
	@Override
	public void board_View_cnt(int board_no) throws Exception {

	}



}
