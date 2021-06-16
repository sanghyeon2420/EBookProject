package com.example.EBookProject.model.dao.impl;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.EBookProject.model.dao.NoticDAO;
import com.example.EBookProject.model.dto.NoticDTO;
import com.example.EBookProject.model.service.NoticService;

@Repository
public class NoticDAOImpl  implements NoticService{

	@Inject
	SqlSession sqlSession;
	
	public List<NoticDTO> list() {
		return sqlSession.selectList("notic.list");
	}

	@Autowired
	private NoticDAO noticDAO;
	
	// 게시글 쓰기
		public void createNotic(NoticDTO vo) throws Exception {
			noticDAO.createNotic(vo);
		}

		// 게시글 수정
		public void updateNotic(NoticDTO vo) throws Exception {
			noticDAO.updateNotic(vo);
		}

		// 게시글 삭제
		public void deleteNotic(int notic_no) throws Exception {
			noticDAO.deleteNotic(notic_no);
		}
		
		// 게시글 삭제 체크
		public int checkNotic(int notic_no) throws Exception {
			return noticDAO.checkNotic(notic_no);
		}

		// 게시글 읽기
		public NoticDTO readNotic(int notic_no) throws Exception {
			return noticDAO.readNotic(notic_no);
		}
		
		// 게시글 목록
		public List<NoticDTO> listAllNotic(String searchOption, String keyword, int start, int end)
				throws Exception {
			return noticDAO.listAllNotic(searchOption, keyword, start, end);
		}
		
		// 이전글
		public NoticDTO previousB(int notic_no) throws Exception {
			return noticDAO.previousB(notic_no);
		}
		
		// 다음글
		public NoticDTO nextB(int notic_no) throws Exception {
			return noticDAO.nextB(notic_no);
		}
		// 조회수
		public void notic_viewCnt(int notic_no, HttpSession session) throws Exception {
			// 타이머 설정
			long update_time = 0;

			if (session.getAttribute("update_time_" + notic_no) != null) {
				// 최근에 조회수를 올린 시간
				update_time = (Long) session.getAttribute("update_time_" + notic_no);
			}
			long current_time = System.currentTimeMillis();
			// 일정 시간이 경과한 후 조회수 증가 처리
			if (current_time - update_time > 5 * 10000) {
				// 조회수 증가 처리
				noticDAO.notic_viewCnt(notic_no);
				// 조회수를 올린 시간 저장
				session.setAttribute("update_time_" + notic_no, current_time);
			}
		}

		// 게시글 갯수
		public int getCountNotic(String searchOption, String keyword) throws Exception {
			return noticDAO.getCountNotic(searchOption, keyword);
		}

}
