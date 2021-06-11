package com.example.EBookProject.model.dao;

import com.example.EBookProject.model.dto.MemberDTO;

public interface MemberDAO {
	public int Id_Check(String userid);
	public MemberDTO LoginInfo(MemberDTO dto);
	public int logincheck(MemberDTO dto);
}
