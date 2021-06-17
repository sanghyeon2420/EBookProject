package com.example.EBookProject.model.service;

import java.util.List;

import com.example.EBookProject.model.dto.BookDTO;
import com.example.EBookProject.model.dto.BookcategoryDTO;
import com.example.EBookProject.model.dto.ContentDTO;

public interface BookService {
	public List<BookcategoryDTO> bookcategory();
	public List<BookDTO> booklist(int category_no); // 장르별 도서목록
	public BookDTO bookdetail(int ebook_no);
	public List<ContentDTO> contentdetail(int ebook_no);
}
