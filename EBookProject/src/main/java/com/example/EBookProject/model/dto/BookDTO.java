package com.example.EBookProject.model.dto;

public class BookDTO {

	private int ebook_no; // 도서번호
	private int writer_no; // 작가번호
	private int category_no; // 장르번호
	private String b_name; // 도서이름
	private String b_category; // 장르이름
	private String w_name; // 작가이름
	private String b_intro; // 도서 소개
	private int book_get; // 도서 조회수
	private int book_hits; // 도서 추천수
	private String imagefileName; // 북 이미지이름

	public int getEbook_no() {
		return ebook_no;
	}

	public String getImagefileName() {
		return imagefileName;
	}

	public void setImagefileName(String imagefileName) {
		this.imagefileName = imagefileName;
	}

	public void setEbook_no(int ebook_no) {
		this.ebook_no = ebook_no;
	}

	public int getWriter_no() {
		return writer_no;
	}

	public void setWriter_no(int writer_no) {
		this.writer_no = writer_no;
	}

	public int getCategory_no() {
		return category_no;
	}

	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public String getB_category() {
		return b_category;
	}

	public void setB_category(String b_category) {
		this.b_category = b_category;
	}

	public String getW_name() {
		return w_name;
	}

	public void setW_name(String w_name) {
		this.w_name = w_name;
	}

	public String getB_intro() {
		return b_intro;
	}

	public void setB_intro(String b_intro) {
		this.b_intro = b_intro;
	}

	public int getBook_get() {
		return book_get;
	}

	public void setBook_get(int book_get) {
		this.book_get = book_get;
	}

	public int getBook_hits() {
		return book_hits;
	}

	public void setBook_hits(int book_hits) {
		this.book_hits = book_hits;
	}

	@Override
	public String toString() {
		return "BookDTO [ebook_no=" + ebook_no + ", writer_no=" + writer_no + ", category_no=" + category_no
				+ ", b_name=" + b_name + ", b_category=" + b_category + ", w_name=" + w_name + ", b_intro=" + b_intro
				+ ", book_get=" + book_get + ", book_hits=" + book_hits + ", imagefileName=" + imagefileName + "]";
	}

	
}
