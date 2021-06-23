package com.example.EBookProject.model.dao;

import java.util.List;

import com.example.EBookProject.model.dto.WriterDTO;

public interface WriterDAO {
	public WriterDTO writerinfo(int user_no);
	public List<WriterDTO> writer_enter();
	public WriterDTO writerbring(int writer_no);
	public void updateHits(int writer_no);
}
