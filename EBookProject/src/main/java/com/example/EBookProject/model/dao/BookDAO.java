package com.example.EBookProject.model.dao;

import java.util.List;

import com.example.EBookProject.model.dto.BookDTO;
import com.example.EBookProject.model.dto.BookcategoryDTO;
import com.example.EBookProject.model.dto.ContentDTO;

public interface BookDAO {
	public List<BookcategoryDTO> bookcategory();
	public List<BookDTO> booklist(int category_no); // 장르별 도서목록
	public BookDTO Bookdetail(int ebook_no); //장르별 책 불러오기
	public List<ContentDTO> contentdetail(int ebook_no); //책 장르별 콘텐츠 불러오기
	public List<BookDTO> newbook(); //새로 들어온 책 리스트 불러오기
	public List<BookDTO> ranklist(); //랭킹 리스트 불러오기
	public List<BookDTO> romancebook(); //로맨스 책 불러오기

}
