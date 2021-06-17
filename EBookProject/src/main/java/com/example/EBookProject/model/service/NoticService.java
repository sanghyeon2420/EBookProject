package com.example.EBookProject.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.EBookProject.model.dto.NoticDTO;

public interface NoticService {
	void createNotic(NoticDTO vo) throws Exception;					// 게시글 쓰기 
	void updateNotic(NoticDTO vo) throws Exception;					// 게시글 수정
	void deleteNotic(int notic_no) throws Exception;						// 게시글 삭제
	int checkNotic(int notic_no) throws Exception;						// 게시글 삭제 체크, 숨김
	NoticDTO readNotic(int notic_no) throws Exception;					// 게시글 읽기
	void notic_viewCnt(int notic_no, HttpSession session) throws Exception;	// 조회수
	NoticDTO previousB(int notic_no) throws Exception;					// 이전글
	NoticDTO nextB(int notic_no) throws Exception;						// 다음글
	List<NoticDTO> listAllNotic(String searchOption,String keyword,int start, int end) throws Exception;	// 게시글 목록
	int getCountNotic(String searchOption, String keyword)throws Exception;
}

