package com.example.EBookProject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.EBookProject.model.dto.MemberDTO;
import com.example.EBookProject.model.dto.MemoDTO;
import com.example.EBookProject.model.service.impl.MemoServiceImpl;

@Controller
@RequestMapping("/memo/*")
public class MemoController {
	
	@Inject
	MemoServiceImpl service;
	
	@RequestMapping("list")
	public ModelAndView list(HttpServletRequest request, String idx) {
		Map<String, Object> map= new HashMap<String, Object>();
		System.err.println("idx번호 =>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+idx);
		int ebook_no=Integer.parseInt(idx);
		List<MemoDTO> list = service.getMemoList(ebook_no);
		
		for (int i = 0; i < list.size(); i++) {
			System.err.println(list.get(i));
		}
		map.put("list", list);
		return new ModelAndView("memo/memo_list","map",map);
	}
	
	@RequestMapping("view")
	public String view(HttpServletRequest request, int idx) {
		MemoDTO dto = service.getMemoDetail(idx);
		//request.set
		return "book/pageBone";
	}
		
	@RequestMapping("insert")
	public String insert(@ModelAttribute("memo") MemoDTO dto) {
		service.memoInsert(dto);
		return "book/pageBone";
	}
	
	@RequestMapping("update")
	public String update(@ModelAttribute("memo") MemoDTO dto) {
		service.memoUpdate(dto);
		return "book/pageBone";
	}
	
	@RequestMapping("delete")
	public String delete(@RequestParam("idx") int idx) {
		service.memoDelete(idx);
		return "book/pageBone";
	}
}
