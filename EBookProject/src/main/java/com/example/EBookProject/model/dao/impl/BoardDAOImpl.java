package com.example.EBookProject.model.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public void insertBoard(BoardDTO dto) {
		sqlSession.insert("board.insertBoard",dto);
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
		return (BoardDTO) sqlSession.selectOne("board.read", board_no);
	}

	@Override
	public List<BoardDTO> listAll(int start, int end, String search_option, String keyword) throws Exception {
		Map<String,Object> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("board.listAll",map);
	}

	@Override
	public int countArticle(String search_option, String keyword) { // 레코드 갯수 계산
		Map<String,Object> map=new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne("board.countArticle", map);
	}
	


	@Override
	public void boardDelete(int board_no) {
		sqlSession.update("board.boardDelete",board_no);
		
	}

	@Override
	public BoardDTO boardUpdate(int board_no) {
		return sqlSession.selectOne("board.boardUpdate",board_no);
		
	}

	@Override
	public void updateResult(BoardDTO dto) {
		sqlSession.update("board.updateResult", dto);
	}

	@Override
	public void boardget(int board_no) {
		sqlSession.update("board.boardget",board_no);
	}




}
