package com.example.EBookProject.model.service;

import java.util.List;

import com.example.EBookProject.model.dto.MemoDTO;

public interface MemoService {
	public List<MemoDTO> getMemoList(int ebook_no);
	public MemoDTO getMemoDetail(int idx);
	public void memoInsert(MemoDTO dto);
	public void memoUpdate(MemoDTO dto);
	public void memoDelete(int idx);
}
