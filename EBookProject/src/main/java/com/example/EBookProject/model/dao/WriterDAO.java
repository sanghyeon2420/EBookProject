package com.example.EBookProject.model.dao;

import com.example.EBookProject.model.dto.WriterDTO;

public interface WriterDAO {
	public WriterDTO writerinfo(int user_no);
	public void writerinsert(String w_name);
	
}
