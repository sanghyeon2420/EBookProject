package com.example.EBookProject.model.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.EBookProject.model.dao.AdminDAO;
import com.example.EBookProject.model.dto.BoardDTO;
import com.example.EBookProject.model.dto.BookDTO;
import com.example.EBookProject.model.dto.MemberDTO;
import com.example.EBookProject.model.dto.NoticDTO;

@Repository // Spring bean으로 등록 서버가 올라올때 객체 생성
public class AdminDAOImpl implements AdminDAO {
	
	@Inject
	SqlSession sqlSession; // null new로 안만듬
	
	
	@Override
	public List<MemberDTO> memberlist() {
		return sqlSession.selectList("member.memberlist"); // namespace.id
	}

	@Override
	public List<BookDTO> booklist() {
		return sqlSession.selectList("book.booklist");
	}

	@Override
	public List<BoardDTO> booadlist() {
		return sqlSession.selectList("board.boardlist");
	}

	@Override
	public List<NoticDTO> noticlist() {
		return sqlSession.selectList("NoticDAO.noticlist");
	}
	
	@Override
	public void deleteMember(MemberDTO dto) {
		sqlSession.delete("member.deletemember", dto);
	
	}

	@Override
	public void deleteBook(BookDTO dto) {
		sqlSession.delete("book.deleteBook", dto);
	}

	@Override
	public void deleteboard(BoardDTO dto) {
		sqlSession.delete("board.deleteboard", dto);
	}
	
	@Override
	public void deletenotic(NoticDTO dto) {
		sqlSession.delete("notic.deletenotic", dto);
		
	}
	
	@Override
	public void cookiemanager(MemberDTO dto) {
		sqlSession.update("member.cookiemanager", dto);
	}

	


}
