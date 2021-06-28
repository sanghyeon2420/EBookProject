package com.example.EBookProject.model.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.EBookProject.model.dao.BookDAO;
import com.example.EBookProject.model.dto.BookDTO;
import com.example.EBookProject.model.dto.BookcategoryDTO;
import com.example.EBookProject.model.dto.ContentDTO;

@Repository
public class BookDAOImpl implements BookDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<BookcategoryDTO> bookcategory() {
		return sqlSession.selectList("book.bookcategory");
	}

	@Override
	public List<BookDTO> booklist(int category_no) {
		return sqlSession.selectList("book.list",category_no);
	}

	@Override
	public BookDTO Bookdetail(int ebook_no) {
		return sqlSession.selectOne("book.bookdetail", ebook_no);
	}

	@Override
	public List<ContentDTO> contentdetail(int ebook_no) {
		return sqlSession.selectList("book.contentdetail", ebook_no);  //sqlSession.selectList(namespace.select id)
	}

	@Override
	public List<BookDTO> newbook() {
		return sqlSession.selectList("book.newbook");
	}

	@Override
	public List<BookDTO> ranklist() {
		return sqlSession.selectList("book.ranklist");
	}

	@Override
	public List<BookDTO> romancebook() {
		return sqlSession.selectList("book.romancebook");
	}

	@Override
	public int detail_rank(int ebook_no) {
		return sqlSession.selectOne("book.bookrank",ebook_no);
	}

	@Override
	public List<BookDTO> writerbook(int writer_no) {
		return sqlSession.selectList("book.writerbook", writer_no);
	}

	@Override
	public void bookhits(int ebook_no) {
		sqlSession.update("book.bookhits", ebook_no);
	}

	@Override

	public List<BookDTO> searchbook(String keyword) {
		return sqlSession.selectList("book.searchbook", keyword);
		
	}

	public int contentCount(int ebook_no) {
		return sqlSession.selectOne("book.contentCount",ebook_no);
	}

	@Override
	public String contentName(int ebook_no, int contentlist) {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("ebook_no", ebook_no);
		map.put("contentlist", contentlist);
		
		
		
		return sqlSession.selectOne("book.contentName", map);
	}

	@Override
	public void bookget(int ebook_no) {
		sqlSession.update("book.bookget",ebook_no);
	}

}
