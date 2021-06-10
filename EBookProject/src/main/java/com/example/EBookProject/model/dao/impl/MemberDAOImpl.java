package com.example.EBookProject.model.dao.impl;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.EBookProject.model.dao.MemberDAO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject
	SqlSession sqlSession;

	@Override
	public int Id_Check(String userid) {
		
		return sqlSession.selectOne("member.selectCount",userid);
	}
}
