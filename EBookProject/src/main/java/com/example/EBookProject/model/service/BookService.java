package com.example.EBookProject.model.service;

import java.util.List;
import java.util.Map;

import com.example.EBookProject.model.dto.BookDTO;
import com.example.EBookProject.model.dto.BookcategoryDTO;
import com.example.EBookProject.model.dto.ContentDTO;

public interface BookService {
	public List<BookcategoryDTO> bookcategory();
	public List<BookDTO> booklist(int category_no); // 장르별 도서목록
	public List<ContentDTO> contentdetail(int ebook_no);  //콘텐츠 리스트
	public BookDTO Bookdetail(int ebook_no);  //장르별 책 불러오기
	public List<BookDTO> newbook(); //새로나온 책 리스트
	public List<BookDTO> ranklist();  //랭킹 리스트 불러오기
	public List<BookDTO> romancebook(); //로맨스 책 불러오기
	public int detail_rank(int ebook_no); // 도서별 랭크순위 출력
	public List<BookDTO> writerbook(int writer_no); //작가번호로 책 불러오기
}
