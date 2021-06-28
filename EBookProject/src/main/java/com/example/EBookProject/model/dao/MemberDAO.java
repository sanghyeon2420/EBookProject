package com.example.EBookProject.model.dao;

import com.example.EBookProject.model.dto.MemberDTO;

public interface MemberDAO {
	public int Id_Check(String userid);
	public MemberDTO LoginInfo(MemberDTO dto);
	public int logincheck(MemberDTO dto);
	public int NickCheck(String nickname);
	public void SignUp(MemberDTO dto);
	public MemberDTO memberUpdate(int user_no);
	public void updateMember(MemberDTO dto);
	public void deleteMember(MemberDTO dto);
	
	// 아이디와 비밀번호 찾기
	public MemberDTO searchID(MemberDTO dto);
	public MemberDTO searchPW(MemberDTO dto);
}
