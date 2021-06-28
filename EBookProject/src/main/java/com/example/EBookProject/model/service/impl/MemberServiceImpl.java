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

	@Override
	public MemberDTO searchID(MemberDTO dto) {
		return dao.searchID(dto);
	}

	@Override
	public MemberDTO searchPW(MemberDTO dto) {
		return dao.searchPW(dto);
	}
	
	@Override
	//회원 정보 수정을 위한 정보 출력
	public MemberDTO memberUpdate(int user_no) {
		return dao.memberUpdate(user_no);
	}
	
	@Override
	//회원 정보 수정
	public void updateMember(MemberDTO dto) {
		dao.updateMember(dto);
	}
	
	@Override 
	// 회원 탈퇴 
	public void deleteMember(MemberDTO dto) {
		dao.deleteMember(dto);	
	}
}
