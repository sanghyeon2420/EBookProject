package com.example.EBookProject.model.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.EBookProject.model.dao.BookDAO;
import com.example.EBookProject.model.dao.impl.BookDAOImpl;
import com.example.EBookProject.model.dto.BookcategoryDTO;

@Service
public class BookServiceImpl implements BookDAO {
	
	@Inject
	BookDAOImpl dao;
	
	
	@Override
	public List<BookcategoryDTO> bookcategory() {

		return dao.bookcategory();
	}

}
