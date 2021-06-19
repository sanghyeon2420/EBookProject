package com.example.EBookProject.model.dao.impl;

import java.util.List;

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



	
}
