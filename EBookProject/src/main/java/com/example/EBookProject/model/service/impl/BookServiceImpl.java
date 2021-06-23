package com.example.EBookProject.model.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.EBookProject.model.dao.impl.BookDAOImpl;
import com.example.EBookProject.model.dto.BookDTO;
import com.example.EBookProject.model.dto.BookcategoryDTO;
import com.example.EBookProject.model.dto.ContentDTO;
import com.example.EBookProject.model.service.BookService;

@Service
public class BookServiceImpl implements BookService {
	
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
		return dao.Bookdetail(ebook_no);
	}

	@Override
	public List<ContentDTO> contentdetail(int ebook_no) {
		return dao.contentdetail(ebook_no);
	}

	@Override
	public List<BookDTO> newbook() {
		return dao.newbook();
	}

	@Override
	public List<BookDTO> ranklist() {
		
		List<BookDTO> list=dao.ranklist();				
		for (int i = 0; i < 5; i++) {
			System.err.println(list.get(i));
		}		
		return list;
	}

	@Override
	public List<BookDTO> romancebook() {
		return dao.romancebook();
	}

	@Override
	public int detail_rank(int ebook_no) {
		return dao.detail_rank(ebook_no);
	}

	@Override
	public List<BookDTO> writerbook(int writer_no) {
		return dao.writerbook(writer_no);
	}

	@Override
	public void bookhits(int ebook_no) {
		dao.bookhits(ebook_no);
	}

	@Override
	public int contentCount(int ebook_no) {
		return dao.contentCount(ebook_no);
	}

	@Override
	public String contentName(int ebook_no, int contentlist) {
		return dao.contentName(ebook_no, contentlist);
	}
}
