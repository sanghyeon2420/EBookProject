package com.example.EBookProject.model.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.EBookProject.model.dao.AdminDAO;
import com.example.EBookProject.model.dto.MemberDTO;

@Repository // Spring bean으로 등록 서버가 올라올때 객체 생성
public class AdminDAOImpl implements AdminDAO {
	
	@Inject
	SqlSession sqlSession; // null new로 안만듬
	
	
	@Override
	public List<MemberDTO> memberlist() {
		
		return sqlSession.selectList("member.memberlist"); // namespace.id
	}

}
