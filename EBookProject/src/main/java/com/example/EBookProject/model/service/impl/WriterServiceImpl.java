package com.example.EBookProject.model.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.EBookProject.model.dao.impl.WriterDAOImpl;
import com.example.EBookProject.model.dto.WriterDTO;
import com.example.EBookProject.model.service.WriterService;

@Service
public class WriterServiceImpl implements WriterService {
	
	@Inject
	WriterDAOImpl dao;
	
	@Override
	public WriterDTO writerinfo(int user_no) {
		return dao.writerinfo(user_no);
	}

	@Override
	public List<WriterDTO> writer_enter() {
		return dao.writer_enter();
	}

	@Override
	public WriterDTO writerbring(int writer_no) {
		return dao.writerbring(writer_no);
	}

}
