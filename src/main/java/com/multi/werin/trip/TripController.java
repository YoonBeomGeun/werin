package com.multi.werin.trip;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TripController {

	@Autowired
	TripDAO dao;

	@RequestMapping("trip/insert")
	public String insert(TripVO vo) {
		System.out.println("bbsvo =>" + vo);
				
		int result = dao.insert(vo);
		if (result == 1) {
			return "trip/insert";
		} else {

			return "redirect:trip/insert.jsp"; // 여행글 게시판 목록

		}
	}
	
	@RequestMapping("trip/update")
	public String update(int trip_id, Model model) {
		TripVO vo = dao.one(trip_id);
		model.addAttribute("vo", vo);
		if(vo.getTrip_id()!= 0) {
			return "trip/update";
		}else {
			return "redirect:main.jsp";
		}
	}
	
	@RequestMapping("trip/update2")
	public void update2(TripVO vo, Model model) {
		int result = dao.update(vo);
		model.addAttribute("result", result);
	}
	
	
	@RequestMapping("trip/delete")
	public String delete(TripVO vo) {
		int result = dao.delete(vo);
		if(result == 1) {
			return "trip/delete";
		}else { // 삭제X 일때 돌아갈 페이지
			return "redirect:index_bbs.jsp";
		}
	}
	
	@RequestMapping("trip/list")
	public String list(Model model) {
		List<TripVO> list = dao.list();
		model.addAttribute("list", list);
		if(list.size()>0) {
			return "trip/list";
		}else {
			return "redirect:main.jsp";
		}
	}
	
	@RequestMapping("trip/one")
	public String one(int trip_id, Model model) {
		TripVO vo = dao.one(trip_id);
		System.out.println("Tripvo =>" + vo);
		model.addAttribute("vo", vo);
		if(vo.getTrip_id()!= 0) {
			return "one";
		}else {
			return "redirect:main.jsp";
		}
	}
}
