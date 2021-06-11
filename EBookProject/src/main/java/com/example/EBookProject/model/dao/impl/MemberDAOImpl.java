package com.example.EBookProject.model.dao.impl;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.example.EBookProject.model.dao.MemberDAO;
import com.example.EBookProject.model.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImpl.class);
	
	@Inject
	SqlSession sqlSession;

	@Override
	public int Id_Check(String userid) {
		
		return sqlSession.selectOne("member.selectCount",userid);
	}

	@Override
	public MemberDTO LoginInfo(MemberDTO dto) {
		System.out.println("daoimpl호출");
		System.out.println("MemberDAOImpl : "+dto);
//		Map<String, String> map = new HashMap<>();
//		map.put("userid", dto.getUserid());
//		map.put("userpw", dto.getUserpw());
		return sqlSession.selectOne("member.selectLoginInfo", dto);
	}
}
