package com.example.EBookProject.model.dao;

import java.util.List;

import com.example.EBookProject.model.dto.BookDTO;
import com.example.EBookProject.model.dto.BookcategoryDTO;

public interface BookDAO {
	public List<BookcategoryDTO> bookcategory();
	public List<BookDTO> booklist(int category_no); // 장르별 도서목록
	public BookDTO Bookdetail(int ebook_no);
}
