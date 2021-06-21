package com.example.EBookProject.model.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.EBookProject.model.dao.WriterDAO;
import com.example.EBookProject.model.dto.WriterDTO;

@Repository
public class WriterDAOImpl implements WriterDAO {
	
	@Inject
	SqlSession sqlSession;
	
	
	@Override
	public WriterDTO writerinfo(int user_no) {
		return sqlSession.selectOne("writer.writerinfo",user_no);
	}


	@Override
	public List<WriterDTO> writer_enter() {
		return sqlSession.selectList("writer.writer_enter");
	}

}
