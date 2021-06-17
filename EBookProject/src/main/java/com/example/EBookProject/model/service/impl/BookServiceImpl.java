package com.example.EBookProject.model.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.EBookProject.model.dao.BookDAO;
import com.example.EBookProject.model.dao.impl.BookDAOImpl;
import com.example.EBookProject.model.dto.BookDTO;
import com.example.EBookProject.model.dto.BookcategoryDTO;

@Service
public class BookServiceImpl implements BookDAO {
	
	@Inject
	BookDAOImpl dao;
	
	
	@Override
	public List<BookcategoryDTO> bookcategory() {

		return dao.bookcategory();
	}


	@Override
	public List<BookDTO> booklist(int category_no) {
		return dao.booklist(category_no);
	}


	@Override
	public BookDTO Bookdetail(int ebook_no) {
		// TODO Auto-generated method stub
		return dao.Bookdetail(ebook_no);
	}

}
