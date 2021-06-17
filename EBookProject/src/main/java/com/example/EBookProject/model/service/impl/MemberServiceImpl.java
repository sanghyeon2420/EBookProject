package com.example.EBookProject.model.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.EBookProject.model.dao.impl.MemberDAOImpl;
import com.example.EBookProject.model.dto.MemberDTO;
import com.example.EBookProject.model.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	MemberDAOImpl dao;

	@Override
	public int Id_Check(String userid) {
		
		return dao.Id_Check(userid);
	}

	@Override
	public MemberDTO LoginInfo(MemberDTO dto) {
		return dao.LoginInfo(dto);
		
	}

	@Override
	public int logincheck(MemberDTO dto) {
		return dao.logincheck(dto);
	}

	@Override
	public int NickCheck(String nickname) {
		return dao.NickCheck(nickname);
	}

	@Override
	public void SignUp(MemberDTO dto) {
		dao.SignUp(dto);
	}
}
