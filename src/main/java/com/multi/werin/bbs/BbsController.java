package com.multi.werin.bbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.multi.werin.member.MemberVO;
import com.multi.werin.member.PointService;
import com.multi.werin.trip.TripLikeVO;
import com.multi.werin.trip.TripVO;








@Controller
public class BbsController{
	
	@Autowired
	BbsDAO dao;
	
	@Autowired
	BbscmtDAO bbscmtDAO;
	
	@Autowired
	PointService pointService;
	
	@RequestMapping("/bbs/insert")
	public String insert2(BbsVO bbsVO,Model model, HttpSession session) {
		int result = dao.insertBbs(bbsVO);
		String str = "";
		model.addAttribute("result", result);
		if (result == 1) {
			str = "redirect:bbs?page=1";
		}
		MemberVO memberVO = new MemberVO();
		memberVO.setMember_id((String)session.getAttribute("loginId"));
		memberVO.setVariation(3);
		pointService.pointvariation(memberVO);
		pointService.updategrade(memberVO);
		memberVO.setMember_grade(pointService.callgrade(memberVO.getMember_id()));
		session.setAttribute("grade", memberVO.getMember_grade());
		return str;
	}
	
	@RequestMapping("bbs/update")
	public void update(BbsVO bbsVO, Model model) {
		BbsVO bag = dao.one(bbsVO);
		model.addAttribute("bag", bag);
	}
	
	@RequestMapping("bbs/update2")
	public void update2(BbsVO bbsVO, Model model) {
		int result = dao.updateBbs(bbsVO);
		model.addAttribute("result", result);
	}
	
	@RequestMapping("bbs/delete2")
	public void delete2(int bbs_id, Model model) {
		model.addAttribute("bbs_id", bbs_id);
	}
	
	@RequestMapping("bbs/delete")
	public void delete(int bbs_id, Model model, HttpSession session) {
		//System.out.println("post_id >> " + post_id);
		int result = dao.deleteBbs(bbs_id);
		MemberVO memberVO = new MemberVO();
		memberVO.setMember_id((String)session.getAttribute("loginId"));
		memberVO.setVariation(-3);
		pointService.pointvariation(memberVO);
		pointService.updategrade(memberVO);
		memberVO.setMember_grade(pointService.callgrade(memberVO.getMember_id()));
		session.setAttribute("grade", memberVO.getMember_grade());
		model.addAttribute("result", result);
	}
	
	

	
	@RequestMapping("bbs/bbs")
	public void list2(PageVO pageVO, Model model) { // start, end
		pageVO.setStartEnd();// start, end계산해주는 메서드
		System.out.println(pageVO);
		List<BbsVO> list = dao.list1(pageVO);
		// 전체 페이지수 구하기
		int count = dao.count(); // 전체게시물 수
		System.out.println("전체 게시물수>> " + count);
		int pages = count / 10;
		if (count % 10 != 0) {
			pages = count / 10 + 1;
		}
		// 모델로 views까지 페이지수를 넘겨야 페이지수 버튼을 만들 수 있음.
		System.out.println("페이지당 가지고 온 게시물수>> " + list.size());
		// views의 list1.jsp로 전달
		model.addAttribute("list", list);
		model.addAttribute("pages", pages);
		model.addAttribute("count", count);
		model.addAttribute("pageVO", pageVO);
	}
	
	

	
	
	@RequestMapping("bbs/bbs2")
	public void one(BbsVO bbsVO,int bbs_id, HttpSession session, Model model, BbslikeVO likeVO) {
		// System.out.println("post_id : " + post_id);
		dao.increaseBbsView(bbsVO.getBbs_id());
		String member_id = "";
		if(session.getAttribute("loginId") != null) {
			member_id = (String)session.getAttribute("loginId");
		}
		likeVO.setMember_id(member_id);
		int cmt = bbscmtDAO.countCmt(bbsVO.getBbs_id());
		System.out.println(" likeVO : " + likeVO);
		BbslikeVO vo2= dao.likeCheck(likeVO);
		System.out.println("추천 상태"+vo2);
		BbsVO bag = dao.one(bbsVO);
		List<BbscmtVO> list = bbscmtDAO.list(bbsVO.getBbs_id());
		model.addAttribute("bag", bag);
		model.addAttribute("list", list);
		model.addAttribute("vo2", vo2);
		model.addAttribute("cmt", cmt);
	}
	
	
	@RequestMapping("bbs/bbs0")
	public void list0(PageVO pageVO, Model model) {
		pageVO.setStartEnd();//page, start, end
		System.out.println("페이지브오"+ pageVO);
		List<BbsVO> list = dao.list1(pageVO);
		System.out.println("게시물 리스트" + list);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("bbs/getSearchList")
	public String getSearchList(PageVO pageVO, Model model) {
		pageVO.setStartEnd();
		
	    System.out.println("getSerchList");
	    System.out.println("pageVO  "+ pageVO);
	    List<BbsVO> result = dao.getSearchList(pageVO);
	    System.out.println("bbsvo 리스트"+result);
	    System.out.println("result.size()"+ result.size());
	    
	    int count=  dao.count2(pageVO); // 전체게시물 수 
	    int pages = count / 10;
		if (count % 10 != 0) {
			pages = count / 10 + 1;
		}
		System.out.println("시작페이지"+pageVO.getStart()+"끝"+pageVO.getEnd());
		System.out.println("페이지" + pages +"게시물 수" + count);
	    model.addAttribute("list", result);
	    model.addAttribute("pages", pages);
	    model.addAttribute("count", count);
	    model.addAttribute("keyword", pageVO.getKeyword());
	    model.addAttribute("type", pageVO.getType());
	    model.addAttribute("kind", pageVO.getKind());
	    return "bbs/bbs";  
	
	}
	
	
//	@RequestMapping("bbs/getSearchList")
//	@ResponseBody
//	public Map<String, Object> getSearchList(PageVO pageVO, Model model) {
//	    Map<String, Object> response = new HashMap<>();
//
//	    pageVO.setStartEnd();
//	    List<BbsVO> result = dao.getSearchList(pageVO);
//	    int count = dao.count2(); // 전체게시물 수
//	    int pages = count / 10;
//	    if (count % 10 != 0) {
//	        pages = count / 10 + 1;
//	    }
//
//	    response.put("list", result);
//	    response.put("pages", pages);
//	    response.put("count", count);
//	    response.put("keyword", pageVO.getKeyword());
//	    response.put("type", pageVO.getType());
//
//	    return  response;
//	}
//	
	@RequestMapping("bbs/bbs00")
	@ResponseBody
	public String list3(PageVO pageVO, Model model) {
		pageVO.setStartEnd();
		List<BbsVO> list = dao.list2(pageVO);
		model.addAttribute("list", list);
		return "bbs/bbs"; 
	}
	
	@RequestMapping("bbs/updateLike")
	@ResponseBody
	public int updateLike(int bbs_id, BbsVO vo, BbslikeVO likeVO, 
			@SessionAttribute("loginId") String member_id) { 
		 //1. loginId 를 member_id에 넣고, trip_id 받아와서	
		System.out.println("bbs_id >>> " + bbs_id);
		System.out.println(" member_id  :" + member_id);
		likeVO.setMember_id(member_id);  // 로그인한 유저의 id값 받아와서 likeVO에 set
		System.out.println(" likeVO : " + likeVO);
	     //2. dao.likeCheck 실행
		BbslikeVO bag2 = dao.likeCheck(likeVO); // vo2가 왜 null인지
		System.out.println(bag2);
		//3. null 이면 추천, 비추천을 아직 안눌렀다는 것이므로 
		// null이 뜨는데, 이게 select like state 한 결과가 없다는 건지?
		if(bag2 == null) {
			dao.insertLike(likeVO); // like_state가 0인 채로 db에 insert하고
			dao.updateLike(vo); // 추천수가 1 증가한다.
		}
		 // select like_state from trip_like where member_id = #{member_id} and trip_id = #{trip_id}
		 // 멤버아이디, 트립아이디가 likeVO에 다 들어있는데 왜 null인지
		 
		 System.out.println("토탈라이크 >> " + vo.getBbs_total_like());
		 return vo.getBbs_total_like();
		
		
	}
	
	@RequestMapping("bbs/updateDislike")
	@ResponseBody
	public int updateDislike(int bbs_id, BbsVO vo,BbslikeVO likeVO, 
			@SessionAttribute("loginId") String member_id) {
		likeVO.setMember_id(member_id);
		BbslikeVO bag2 = dao.likeCheck(likeVO);
		if(bag2 == null) {
			dao.insertDislike(likeVO);
			dao.updateDislike(vo);
		}
		System.out.println("토탈라이크 >> " + vo.getBbs_total_like());
		//model.addAttribute("total_like", vo.getTrip_total_like());
		return vo.getBbs_total_like();
	}

	
}