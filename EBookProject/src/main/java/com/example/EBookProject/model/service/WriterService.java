package com.example.EBookProject.model.service;

import java.util.List;

import com.example.EBookProject.model.dto.WriterDTO;

public interface WriterService {
	public WriterDTO writerinfo(int user_no);  //작가 번호와 같은 user 번호 조회
	public List<WriterDTO> writer_enter();  //책 쓴 작가 조회
	public WriterDTO writerbring(int writer_no);  //작가 번호로 상세조회
	public void updateHits(int writer_no);  //작가 조회수 증가

}
