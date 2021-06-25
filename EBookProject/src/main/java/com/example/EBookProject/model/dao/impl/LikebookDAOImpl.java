package com.example.EBookProject.model.dao.impl;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.EBookProject.model.dao.LikebookDAO;
import com.example.EBookProject.model.dto.LikebookDTO;

@Repository
public class LikebookDAOImpl implements LikebookDAO {
	
	@Inject
	SqlSession sqlSession;
	
	
	@Override
	public int countLike(LikebookDTO dto) {
		return sqlSession.selectOne("likebook.countLike",dto);
	}

	@Override
	public void insertLike(LikebookDTO dto) {
		sqlSession.insert("likebook.insertLike",dto);
	}

	@Override
	public void deleteLike(LikebookDTO dto) {
		sqlSession.delete("likebook.deleteLike",dto);
	}

}
