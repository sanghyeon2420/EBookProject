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
	public void insertBoard(BoardDTO dto) {
		boardDao.insertBoard(dto);

	}
	@Override
	public void updateBoard(BoardDTO dto) throws Exception {

	}

	@Override
	public void deleteBoard(int board_no) throws Exception {

	}

	@Override
	public BoardDTO read(int board_no) {
		return boardDao.read(board_no);
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
	@Override
	public void boardDelete(int board_no) {
		boardDao.boardDelete(board_no);
	}
	@Override
	public BoardDTO boardUpdate(int board_no) {
		return boardDao.boardUpdate(board_no);
		
	}
	@Override
	public void updateResult(BoardDTO dto) {
		boardDao.updateResult(dto);
		
	}
	@Override
	public void boardget(int board_no) {
		boardDao.boardget(board_no);
	}

}
