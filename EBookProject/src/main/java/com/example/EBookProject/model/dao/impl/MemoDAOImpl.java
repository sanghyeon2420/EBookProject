package com.example.EBookProject.model.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.EBookProject.model.dao.MemoDAO;
import com.example.EBookProject.model.dto.MemoDTO;

//dao bean으로 등록시키는 어노테이션
@Repository
public class MemoDAOImpl implements MemoDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<MemoDTO> getMemoList(int ebook_no) {
		return sqlSession.selectList("memo.memoList",ebook_no);
	}

	@Override
	public MemoDTO getMemoDetail(int idx) {
		return sqlSession.selectOne("memo.memoDetail", idx);
	}

	@Override
	public void memoInsert(MemoDTO dto) {
		sqlSession.insert("memo.memoInsert", dto);
	}
	
	@Override
	public void memoUpdate(MemoDTO dto) {
		sqlSession.update("memo.memoUpdate", dto);
	}

	@Override
	public void memoDelete(int idx) {
		sqlSession.delete("memo.memoDelete", idx);
	}
	
}
