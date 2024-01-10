package com.multi.werin.landmark;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class LandmarkInfoService {

	@Autowired
	LandmarkInfoDAO dao;
	
	public StringBuilder insert(String ko) {
		//db처리하기 전 전처리/후처리 
		//db처리 요청 
		return dao.insert(ko);
	}
	
	public void list(String ko, Model model) {
		//db처리하기 전 전처리/후처리 
		//db처리 요청 
		List<LandmarkInfoVO> list = dao.list(ko);
		System.out.println(list.size());
		//views/list.jsp까지 넘어가야 함.==>Model 
		//model을 이용해서 검색결과인 list를 list.jsp까지 넘기자.!
		model.addAttribute("list", list);
	}
	
	
	
}

