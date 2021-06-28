package com.example.EBookProject.model.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.EBookProject.model.dao.impl.MemoDAOImpl;
import com.example.EBookProject.model.dto.MemoDTO;
import com.example.EBookProject.model.service.MemoService;

@Service
public class MemoServiceImpl implements MemoService {

	@Inject
	MemoDAOImpl dao;

	@Override
	public List<MemoDTO> getMemoList(int ebook_no) {
		return dao.getMemoList(ebook_no);
	}

	@Override
	public MemoDTO getMemoDetail(int idx) {
		return dao.getMemoDetail(idx);
	}

	@Override
	public void memoInsert(MemoDTO dto) {
		dao.memoInsert(dto);
	}

	@Override
	public void memoUpdate(MemoDTO dto) {
		dao.memoUpdate(dto);
	}

	@Override
	public void memoDelete(int idx) {
		dao.getMemoDetail(idx);
	}
}
