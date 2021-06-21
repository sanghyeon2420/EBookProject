package com.example.EBookProject.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.EBookProject.model.dto.NoticDTO;


public interface NoticDAO {

	// 게시글 쓰기
	public void createNotic(NoticDTO vo);
	// 게시글 수정
	public void updateNotic(NoticDTO vo);
	// 게시글 삭제
	public void deleteNotic(int notic_no);	
	// 게시글 삭제 체크
	public int checkNotic(int notic_no) throws Exception;
	// 게시글 읽기
	public NoticDTO readNotic(int notic_no);	
	// 이전글
	public NoticDTO previousB(int notic_no);
	// 다음글
	public NoticDTO nextB(int notic_no) ;
	// 게시물 목록
	public List<NoticDTO> listAllNotic(String searchOption, String keyword, int start, int end);
	// 조회수
	public void notic_viewCnt(int notic_no);
	// 게시글 갯수
		public int getCountNotic (String searchOption, String keyword) throws Exception;
}
