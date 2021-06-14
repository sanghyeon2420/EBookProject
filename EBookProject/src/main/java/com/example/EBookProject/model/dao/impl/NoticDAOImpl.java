package com.example.EBookProject.model.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.EBookProject.model.dao.NoticDAO;
import com.example.EBookProject.model.dto.NoticDTO;

@Repository
public class NoticDAOImpl  implements NoticDAO{

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<NoticDTO> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("notic.list");
	}

}
