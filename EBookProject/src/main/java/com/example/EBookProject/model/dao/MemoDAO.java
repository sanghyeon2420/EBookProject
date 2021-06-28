package com.example.EBookProject.model.dao;

import java.util.List;

import com.example.EBookProject.model.dto.MemoDTO;

//dao의 인터페이스
public interface MemoDAO {
	public List<MemoDTO> getMemoList(int ebook_no);
	public MemoDTO getMemoDetail(int idx);
	public void memoInsert(MemoDTO dto);
	public void memoUpdate(MemoDTO dto);
	public void memoDelete(int idx);
}
