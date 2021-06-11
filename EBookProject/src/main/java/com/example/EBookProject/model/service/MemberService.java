package com.example.EBookProject.model.service;

import com.example.EBookProject.model.dto.MemberDTO;

public interface MemberService {
	public int Id_Check(String userid);
	public MemberDTO LoginInfo(MemberDTO dto);
	public int logincheck(MemberDTO dto);
}
