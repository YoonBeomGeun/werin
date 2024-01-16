package com.multi.werin.trip;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
			return "forward:/trip/list?page=1"; // 
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
			return "forward:/trip/list?page=1";
		}
		else {
			int trip_id = (int)request.getAttribute("trip_id");
			return "forward:/trip/update"; // 수정에 실패했을 경우 다시 수정페이지로 이동시키기
		}
	}
	
	
	@RequestMapping("trip/remove")
	public String delete(TripVO vo) {
		System.out.println("remove vo 값>>>"+ vo);
		int result = dao.delete(vo);
		System.out.println(result);
		if(result == 1) {
			return "forward:/trip/list?page=1";
		}else { // 삭제X 일때 돌아갈 페이지
			return "redirect:index_bbs.jsp";
		}
	}

	@RequestMapping("trip/list")
	public void list(PageVO1 pageVO, Model model) {
		System.out.println();
		pageVO.setStartEnd();
		System.out.println(pageVO);
		List<TripVO> list = dao.list(pageVO);
		int count = dao.count();
		System.out.println("전체 게시물의 수 >>" + count);
		int pages = count / 10;
		if(count % 10 !=0) {
			pages = count / 10 + 1;
		}
		System.out.println(list);
		System.out.println(pageVO);
		// views의 list.jsp로 전달
		model.addAttribute("list", list);
		model.addAttribute("pages", pages);
		model.addAttribute("count", count);
		
		
		/*
		 * if(count > 0) { return "trip/list?page=1"; }else { return
		 * "redirect:main.jsp"; // 게시된 글이 없을때 }
		 */		 
	}
	
	@RequestMapping("trip/one")
	public String one(int trip_id, Model model) {
		
		service.incrementCount(trip_id);
		
		TripVO vo = dao.one(trip_id);
		
		//triplike tripstate where trip_id, member_id 
		//model tripstate save
		//select tripstate from triplike where 
		System.out.println("Tripvo =>" + vo);
		
		
		System.out.println("Tripvo =>" + vo);
		
		model.addAttribute("vo", vo);
		
		if(vo.getTrip_id()!= 0) {
			return "trip/one";
		}else {
			return "redirect:main.jsp";
		}
	}
	@RequestMapping("trip/updateLike")
	@ResponseBody
	public int updateLike(TripVO vo) { 
		/*
		 * dao.updateLike2(vo2); if(vo2.getLike_check()==1) {
		 * model.addAttribute("alert","이미 추천 혹은 비추천을 눌렀습니다."); }else {
		 */
			dao.updateLike(vo);
			System.out.println("토탈라이크 >> " + vo.getTrip_total_like());
			return vo.getTrip_total_like();
			/* } */
		
	}
	
	@RequestMapping("trip/updateDislike")
	@ResponseBody
	public int updateDislike(TripVO vo) {
		dao.updateDislike(vo);
		System.out.println("토탈라이크 >> " + vo.getTrip_total_like());
		//model.addAttribute("total_like", vo.getTrip_total_like());
		return vo.getTrip_total_like();
	}
}
