package com.example.EBookProject.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.EBookProject.model.dto.NoticDTO;

@Repository
public class NoticDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	@Inject
	SqlSession sqlSession;
	
	public List<NoticDTO> list() {
		return sqlSession.selectList("notic.list");
	};
	// 게시글 쓰기
	public void createNotic(NoticDTO vo) {
		mybatis.insert("NoticDAO.createBoard", vo);
	}

	// 게시글 수정
	public void updateNotic(NoticDTO vo) {
		mybatis.update("NoticDAO.updateBoard", vo);
	}

	// 게시글 삭제
	public void deleteNotic(int notic_no) {
		mybatis.update("NoticDAO.deleteBoard", notic_no);
	}
	
	// 게시글 삭제 체크
	public int checkNotic(int notic_no) throws Exception {
		return mybatis.selectOne("NoticDAO.checkBoard", notic_no);
	}

	// 게시글 읽기
	public NoticDTO readNotic(int notic_no) {
		return (NoticDTO) mybatis.selectOne("NoticDAO.readBoard", notic_no);
	}
	
	// 이전글
	public NoticDTO previousB(int notic_no) {
		return (NoticDTO) mybatis.selectOne("NoticDAO.previousB", notic_no);
	}

	// 다음글
	public NoticDTO nextB(int notic_no) {
		return (NoticDTO) mybatis.selectOne("NoticDAO.nextB", notic_no);
	}
	
	// 게시물 목록
	public List<NoticDTO> listAllNotic(String searchOption, String keyword, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("NoticDAO.listAllNotic", map);
	}

	// 조회수
	public void notic_viewCnt(int notic_no) {
		mybatis.update("NoticDAO.viewCnt", notic_no);
	}
	// 게시글 갯수
		public int getCountNotic(String searchOption, String keyword) throws Exception {
			Map<String, String> map = new HashMap<String, String>();
			map.put("searchOption", searchOption);
			map.put("keyword", keyword);
			return mybatis.selectOne("NoticDAO.getCountNotic", map);
		}
	
	
}
