package com.example.EBookProject.model.service.impl;

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
	public void writerinsert(String w_name) {
		dao.writerinsert(w_name);
		
	}

}
