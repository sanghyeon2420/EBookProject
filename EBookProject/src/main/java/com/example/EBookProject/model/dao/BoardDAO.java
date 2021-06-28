package com.example.EBookProject.model.dao;

import java.util.List;

import com.example.EBookProject.model.dto.BoardDTO;

public interface BoardDAO {
	
	public void insertBoard(BoardDTO dto); // 글등록
	public void updateBoard(BoardDTO dto) throws Exception;	//글수정
	public void deleteBoard(int board_no) throws Exception;	//글삭제
	public BoardDTO read(int board_no); //글 상세보기 
	
	public int countArticle(String search_option, String keyword); // 레코드 갯수 계산
	//(start, end 페이지나누기 , 검색기능)
	public List<BoardDTO> listAll(int start, int end, String search_option, String keyword) throws Exception;
	
	
	public void boardDelete(int board_no); // 게시판 게시물 삭제
	public BoardDTO boardUpdate(int board_no); // 게시판 게시물 수정
	public void updateResult(BoardDTO dto);
	
	public void boardget(int board_no); // 조회수 증가 처리
}
