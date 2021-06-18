package com.example.EBookProject.model.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.EBookProject.model.dao.BoardDAO;
import com.example.EBookProject.model.dto.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public void createBoard(BoardDTO board_no) throws Exception {
		sqlSession.insert("board.insert", board_no);
	}

	@Override
	public void updateBoard(BoardDTO dto) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteBoard(int board_no) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public BoardDTO read(int board_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDTO> listAll(int start, int end, String search_option, String keyword) throws Exception {
		return sqlSession.selectList("board.listAll");
	}

	@Override
	public void board_View_cnt(int board_no) throws Exception {
		// TODO Auto-generated method stub

	}

}
