package com.example.EBookProject.model.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.EBookProject.model.dao.impl.NoticDAOImpl;
import com.example.EBookProject.model.dto.NoticDTO;
import com.example.EBookProject.model.service.NoticService;

@Service
public class NoticServiceImpl implements NoticService {

	@Inject
	NoticDAOImpl dao;
	
	@Override
	public List<NoticDTO> list() {
		return dao.list();
	}

}
