package com.multi.werin.landmark;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class LandmarkInfoService {

	@Autowired
	LandmarkInfoDAO dao;
	
	@Autowired
	Landmarkdb1 db1;
	
    public void api() {
    	//파라메터 배열
    	String[] list = {"국립공원", "군립병원"};
    	
    	//Landmarkdb1 api = new Landmarkdb1();
    	
    	for(String s : list) {
    		List<LandmarkApiVO> items = db1.getLandmarkItems();

	        for (LandmarkApiVO item : items) {
	            System.out.println(item);
	            dao.insert(item);
	        }
    	}
    }
    
	public void list(String ko, Model model) {
		//db처리하기 전 전처리/후처리 
		//db처리 요청 
		List<LandmarkInfoVO> list = dao.list(ko);
		System.out.println(list.size());
		//views/list.jsp까지 넘어가야 함.==>Model 
		//model을 이용해서 검색결과인 list를 jejulist.jsp까지 넘기자
		model.addAttribute("list", list);
	}

	public void delete1() {
    	dao.delete1();
    }
	
	
	
}

