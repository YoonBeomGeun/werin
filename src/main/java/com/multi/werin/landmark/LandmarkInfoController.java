package com.multi.werin.landmark;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller // 싱글톤 + 컨트롤러 등록
public class LandmarkInfoController {
	
	@Autowired
	LandmarkInfoService infoservice;
	
	@Autowired
	LandmarkPageService pageservice;
	
	@RequestMapping("landmark/LandmarkInsert1")
	public void insert (Model model) throws Exception {
		infoservice.api();
		System.out.println("-----");
	}
	
	@RequestMapping("landmark/jejulist")
	public void list(String ko, Model model){
		infoservice.list(ko, model);
	}
	
	@RequestMapping("landmark/Landmarkdelete1")
	public void delete1 (Model model) throws Exception {
		infoservice.delete1();
	}
	
	@RequestMapping("landmark/LandmarkInsert2")
	public void insert2 (Model model) throws Exception {
		pageservice.api2();
		System.out.println("-----");
	}
	
	@RequestMapping("landmark/jejupage")
	public void list2(String ko, Model model){
		pageservice.list2(ko, model);
	}
	
	@RequestMapping("landmark/Landmarkdelete2")
	public void delete2 (Model model) throws Exception {
		pageservice.delete2();
	}
	
}
