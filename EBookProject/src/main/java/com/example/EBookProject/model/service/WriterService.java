package com.example.EBookProject.model.service;

import com.example.EBookProject.model.dto.WriterDTO;

public interface WriterService {
	public WriterDTO writerinfo(int user_no);
	public void writerinsert(String w_name);
}
