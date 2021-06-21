package com.example.EBookProject.model.dao.impl;

import java.util.HashMap;
import java.util.Map;

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
	public void writerinsert(String w_name) {
		int user_no=sqlSession.selectOne("writer.maxuserno");
		System.out.println("writerdao에있는 userno"+user_no );
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("w_name", w_name);
		map.put("user_no", user_no);
		
		sqlSession.insert("writer.writerinsert",map);
	}

}
