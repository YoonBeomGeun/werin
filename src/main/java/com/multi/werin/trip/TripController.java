package com.multi.werin.trip;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TripController {

	@Autowired
	TripDAO dao;
	
	@Autowired
	TripService service;

	@RequestMapping("trip/insert")
	public String insert(TripVO vo) {
		System.out.println("tripvo =>" + vo);
				
		int result = dao.insert(vo);
		if (result == 1) {
			return "forward:/trip/list"; // 
		} else {

			return "redirect:insert.jsp"; // 여행글 게시판 목록

		}
	}
	
	@RequestMapping("trip/update")
	public String update(int trip_id, Model model, HttpServletRequest request) {
		TripVO vo = dao.one(trip_id);
		request.setAttribute("trip_id", trip_id); // update2에서 실패했을 때 다시 수정값들을 불러오기 위해 trip_id set하기
		model.addAttribute("vo", vo);
		if(vo.getTrip_id()!= 0) {
			return "trip/update";
		}else {
			return "redirect:main.jsp"; // 수정 상세페이지로 못갈 경우 
		}
	}
	
	@RequestMapping("trip/update2")
	public String update2(TripVO vo, Model model, HttpServletRequest request) {
		int result = dao.update(vo);
		model.addAttribute("result", result);
		if (result == 1) {
			return "forward:/trip/list";
		}
		else {
			int trip_id = (int)request.getAttribute("trip_id");
			return "forward:/trip/update"; // 수정에 실패했을 경우 다시 수정페이지로 이동시키기
		}
	}
	
	
	@RequestMapping("trip/remove")
	public String delete(TripVO vo) {
		int result = dao.delete(vo);
		if(result == 1) {
			return "forward:/trip/list";
		}else { // 삭제X 일때 돌아갈 페이지
			return "redirect:index_bbs.jsp";
		}
	}

	@RequestMapping("trip/list")
	public String list(Model model) {
		System.out.println("list");
		List<TripVO> list = dao.list();
		System.out.println(list.size());
		model.addAttribute("list", list);
		if(list.size()>0) {
			return "trip/list";
		}else {
			return "redirect:main.jsp";
		}
	}
	
	@RequestMapping("trip/one")
	public String one(int trip_id, Model model) {
		
		service.incrementCount(trip_id);
		
		TripVO vo = dao.one(trip_id);
		System.out.println("Tripvo =>" + vo);
		
		
		System.out.println("Tripvo =>" + vo);
		
		model.addAttribute("vo", vo);
		if(vo.getTrip_id()!= 0) {
			return "trip/one";
		}else {
			return "redirect:main.jsp";
		}
	}
	
}
