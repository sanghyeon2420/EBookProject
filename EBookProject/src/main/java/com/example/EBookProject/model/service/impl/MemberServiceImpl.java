package com.example.EBookProject.model.service.impl;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.EBookProject.model.dao.impl.MemberDAOImpl;
import com.example.EBookProject.model.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	MemberDAOImpl dao;

	@Override
	public int Id_Check(String userid) {
		
		return dao.Id_Check(userid);
	}
}
