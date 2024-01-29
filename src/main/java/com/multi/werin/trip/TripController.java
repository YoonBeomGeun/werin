package com.multi.werin.trip;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.multi.werin.member.MemberVO;
import com.multi.werin.member.PointService;

@Controller
public class TripController {
	
	@Autowired
	PointService pointService;
	
	@Autowired
	TripDAOInterface dao;
	
	@Autowired
	TripService service;

	@RequestMapping("trip/insert")
	public String insert(TripVO vo, HttpSession session) {
		System.out.println("tripvo =>" + vo);
				
		int result = dao.insert(vo);
		MemberVO memberVO = new MemberVO();
		memberVO.setMember_id((String)session.getAttribute("loginId"));
		memberVO.setVariation(3);
		pointService.pointvariation(memberVO);
		pointService.updategrade(memberVO);
		memberVO.setMember_grade(pointService.callgrade(memberVO.getMember_id()));
		session.setAttribute("grade", memberVO.getMember_grade());
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
	public String delete(TripVO vo, HttpSession session) {
		System.out.println("remove vo 값>>>"+ vo);
		int result = dao.delete(vo);
		System.out.println(result);
		
		MemberVO memberVO = new MemberVO();
		memberVO.setMember_id((String)session.getAttribute("loginId"));
		memberVO.setVariation(-3);
		pointService.pointvariation(memberVO);
		pointService.updategrade(memberVO);
		memberVO.setMember_grade(pointService.callgrade(memberVO.getMember_id()));
		session.setAttribute("grade", memberVO.getMember_grade());
		if(result == 1) {
			return "forward:/trip/list?page=1";
		}else { // 삭제X 일때 돌아갈 페이지
			return "redirect:index_bbs.jsp";
		}
	}

	@RequestMapping("trip/list")
	public void list(TripPageVO pageVO, Model model) {
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
	public String one(int trip_id, HttpSession session,
			Model model , TripLikeVO likeVO) {
		
		String member_id = "";
		if(session.getAttribute("loginId") != null) {
			member_id = (String)session.getAttribute("loginId");
		}
		
		service.incrementCount(trip_id);
		
		System.out.println("trip_id : " + trip_id);
		TripVO vo = dao.one(trip_id);
		System.out.println("vo :" + vo);
		
		System.out.println(likeVO);
		  
		  
		System.out.println(" member_id  :" + member_id);
		  
		likeVO.setMember_id(member_id); 
		System.out.println(" likeVO : " + likeVO);
		TripLikeVO vo2 = dao.likeCheck(likeVO);
		 
		
		System.out.println("TripLikeVO =>" + vo2);
		  
		// null처리하기 (비로그인일떄)  
		//System.out.println("like_state =>" + vo2.getLike_state());
		 
		
		model.addAttribute("vo", vo);
		model.addAttribute("vo2", vo2);
		
		if(vo.getTrip_id()!= 0) {
			return "trip/one";
		}else {
			return "redirect:main.jsp";
		}
	}
	@RequestMapping("trip/updateLike")
	@ResponseBody
	public int updateLike(int trip_id, TripVO vo,TripLikeVO likeVO, 
			@SessionAttribute("loginId") String member_id) { 
		 //1. loginId 를 member_id에 넣고, trip_id 받아와서	
		System.out.println("trip_id >>> " + trip_id);
		System.out.println(" member_id  :" + member_id);
		likeVO.setMember_id(member_id);  // 로그인한 유저의 id값 받아와서 likeVO에 set
		System.out.println(" likeVO : " + likeVO);
	     //2. dao.likeCheck 실행
		TripLikeVO vo2 = dao.likeCheck(likeVO); // vo2가 왜 null인지
		System.out.println(vo2);
		//3. null 이면 추천, 비추천을 아직 안눌렀다는 것이므로 
		// null이 뜨는데, 이게 select like state 한 결과가 없다는 건지?
		if(vo2 == null) {
			dao.insertLike(likeVO); // like_state가 0인 채로 db에 insert하고
			dao.updateLike(vo); // 추천수가 1 증가한다.
		}
		 // select like_state from trip_like where member_id = #{member_id} and trip_id = #{trip_id}
		 
		 System.out.println("토탈라이크 >> " + vo.getTrip_total_like());
		 return vo.getTrip_total_like();
		
		
	}
	
	@RequestMapping("trip/updateDislike")
	@ResponseBody
	public int updateDislike(int trip_id, TripVO vo,TripLikeVO likeVO, 
			@SessionAttribute("loginId") String member_id) {
		likeVO.setMember_id(member_id);
		TripLikeVO vo2 = dao.likeCheck(likeVO);
		if(vo2 == null) { // like_state가 0,1 값 둘중 아무것도 가지지 않아서 --> 추천, 비추천을 누른 기록이 없다.
			dao.insertDislike(likeVO);
			dao.updateDislike(vo);
		}
		System.out.println("토탈라이크 >> " + vo.getTrip_total_like());
		//model.addAttribute("total_like", vo.getTrip_total_like());
		return vo.getTrip_total_like();
	}
}
