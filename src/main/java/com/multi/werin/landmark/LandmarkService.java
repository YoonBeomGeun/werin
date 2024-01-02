package com.multi.werin.landmark;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Service
public class LandmarkService {
	
	@Autowired
	LandmarkDAO dao;
	
	public String insert(LandmarkVO landmarkVO) {
		int result = dao.insert(landmarkVO);
		if(result == 1) {
			return "landmark_insert";
		}else {
			return "landmark_insert.jsp";
		}
	}
	
	public void list(LandmarkVO landmarkVO , Model model) { 
		List<LandmarkVO> list = dao.list(landmarkVO);
		System.out.println(list.size());
		int count = dao.count(); //전체게시물 수
		int pages = count / 10;
		
		//views의 landmark_list.jsp에 model로 출력해온 db의 landmark를 list로 전달 
		model.addAttribute("list", list); // 조건에 맞는 row만 출력하기 위한 값 전달
		model.addAttribute("city", landmarkVO.getCity()); 
		model.addAttribute("pages", pages);
		model.addAttribute("count", count);
	}
	
	public void list2(PageVO pageVO , Model model) {
		pageVO.setStartEnd();
		List<LandmarkVO> list = dao.list2(pageVO);
		System.out.println(list.size());
		int count = dao.count(); //전체게시물 수
		int pages = count / 10;
		
		//views의 landmark_list.jsp에 model로 출력해온 db의 landmark를 list로 전달 
		model.addAttribute("list", list); // 조건에 맞는 row만 출력하기 위한 값 전달
		model.addAttribute("city", pageVO.getCity()); 
		model.addAttribute("pages", pages);
		model.addAttribute("count", count);
	}
	

	
}
