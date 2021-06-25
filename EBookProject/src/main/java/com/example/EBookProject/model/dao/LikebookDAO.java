package com.example.EBookProject.model.dao;

import com.example.EBookProject.model.dto.LikebookDTO;

public interface LikebookDAO {
	public int countLike(LikebookDTO dto); // 추천여부 확인
	public void insertLike(LikebookDTO dto); // 추천
	public void deleteLike(LikebookDTO dto); // 비추천
}
