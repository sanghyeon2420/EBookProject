package com.example.EBookProject.model.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.example.EBookProject.model.dao.NoticDAO;
import com.example.EBookProject.model.dto.NoticDTO;
import com.example.EBookProject.model.service.NoticService;

@Repository
public class NoticDAOImpl  implements NoticDAO {
	
	@Inject
	SqlSessionTemplate mybatis;

	// 게시글 쓰기
	public void createNotic(NoticDTO vo) {
		mybatis.insert("NoticDAO.createNotic", vo);
	}

	// 게시글 수정
	public void updateNotic(NoticDTO vo) {
		mybatis.update("NoticDAO.updateNotic", vo);
	}

	// 게시글 삭제
	public void deleteNotic(int notic_no) {
		mybatis.update("NoticDAO.deleteNotic", notic_no);
	}
	
	// 게시글 삭제 체크
	public int checkNotic(int notic_no) throws Exception {
		return mybatis.selectOne("NoticDAO.checkNotic", notic_no);
	}

	// 게시글 읽기
	public NoticDTO readNotic(int notic_no) {
		return (NoticDTO) mybatis.selectOne("NoticDAO.readNotic", notic_no);
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
		mybatis.update("NoticDAO.notic_viewCnt", notic_no);
	}
	// 게시글 갯수
		public int getCountNotic (String searchOption, String keyword) throws Exception {
			Map<String, String> map = new HashMap<String, String>();
			map.put("searchOption", searchOption);
			map.put("keyword", keyword);
			return mybatis.selectOne("NoticDAO.getCountNotic", map);
		}
	
}

	
