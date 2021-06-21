package com.example.EBookProject.model.service;

import java.util.List;

import com.example.EBookProject.model.dto.WriterDTO;

public interface WriterService {
	public WriterDTO writerinfo(int user_no);
	public List<WriterDTO> writer_enter();
}
