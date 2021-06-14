package com.example.EBookProject.model.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.EBookProject.model.dao.BookDAO;
import com.example.EBookProject.model.dto.BookcategoryDTO;

@Repository
public class BookDAOImpl implements BookDAO {
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<BookcategoryDTO> bookcategory() {

		return sqlSession.selectList("book.bookcategory");
	}

}
