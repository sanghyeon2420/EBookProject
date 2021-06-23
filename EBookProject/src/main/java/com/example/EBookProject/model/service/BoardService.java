package com.example.EBookProject.model.service;

import java.util.List;

import com.example.EBookProject.model.dto.BoardDTO;

public interface BoardService {
	
	public void createBoard(BoardDTO board_no) throws Exception;
	public void updateBoard(BoardDTO dto) throws Exception;	//글수정
	public void deleteBoard(int board_no) throws Exception;	//글삭제
	public BoardDTO read(int board_no);
	
	public int countArticle(String search_option, String keyword); // 레코드 갯수 계산
	
	//(start, end 페이지나누기 , 검색기능)
	public List<BoardDTO> listAll(int start, int end, String search_option, String keyword) throws Exception;
	
	//조회수 증가처리
	public void board_View_cnt(int board_no) throws Exception;
}
