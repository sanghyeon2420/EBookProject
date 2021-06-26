package com.example.EBookProject.model.service;

import java.util.List;

import com.example.EBookProject.model.dto.BookDTO;
import com.example.EBookProject.model.dto.BookcategoryDTO;
import com.example.EBookProject.model.dto.ContentDTO;
import com.example.EBookProject.model.dto.LikebookDTO;

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
	public void bookhits(int ebook_no,LikebookDTO likeDTO); //책 조회수 증가
	public List<BookDTO> searchbook(String keyword);  //검색창에서 검색 불러오기
	public int contentCount(int ebook_no); // 책 번호로 컨텐츠 최대값 출력
	public String contentName(int ebook_no,int contentlist); // 책 번호와 컨텐트리스트번호로 컨텐트 제목 출력
	public void bookget(int ebook_no); //책 번호로 조회수 증가
}
