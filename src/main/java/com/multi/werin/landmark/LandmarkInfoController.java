package com.multi.werin.landmark;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller // 싱글톤 + 컨트롤러 등록
public class LandmarkInfoController {
	
	@Autowired
	LandmarkInfoService service;
	
	@RequestMapping("landmark/LandmarkInfo")
	public void insert(String ko, Model model) throws Exception {
		StringBuilder json = service.insert(ko);
		
		model.addAttribute("json", json);
	}
	
	@RequestMapping("landmark/jejulist")
	public void list(String ko, Model model){
		service.list(ko, model);
	}

}
