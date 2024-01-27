package com.multi.werin.gowith;

import java.util.List;

import javax.security.auth.callback.ConfirmationCallback;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.werin.chat.RoomDAO;
import com.multi.werin.member.MemberVO;
import com.multi.werin.member.PointService;

@Controller
public class GowithController {

	@Autowired
	GowithDAO dao;
	
	@Autowired
	GowithcmtDAO gowithcmtDAO;
	
	@Autowired
	RoomDAO roomDAO;
	
	@Autowired
	PointService pointService;
	
	@RequestMapping("gowith/insert")
	public String insert(GowithVO gowithVO, HttpSession session) {
		int result = dao.insert(gowithVO);
		String str = "";
		if(result==1) {
			str = "redirect:list1?page=1";
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
	
	@RequestMapping("gowith/update")
	public void update(GowithVO gowithVO, Model model) {
		GowithVO vo = dao.one(gowithVO);		
		model.addAttribute("vo", vo);
	}
	
	@RequestMapping("gowith/update2")
	public void update2(GowithVO gowithVO, int gowith_id, Model model) {
		System.out.println(gowithVO);
		System.out.println(gowith_id);
		int result = dao.update(gowithVO);
		model.addAttribute("result", result);
		model.addAttribute("gowith_id", gowith_id);
	}
	
	@RequestMapping("gowith/deleteConfirmed")
	public void deleteConfirmed(int gowith_id, Model model) {
		model.addAttribute("gowith_id", gowith_id);
	}
	
	@RequestMapping("gowith/delete")
	public void delete(int gowith_id, HttpSession session, Model model) {
		int result = dao.delete(gowith_id);
		model.addAttribute("result", result);
		MemberVO memberVO = new MemberVO();
		memberVO.setMember_id((String)session.getAttribute("loginId"));
		memberVO.setVariation(-3);
		pointService.pointvariation(memberVO);
		pointService.updategrade(memberVO);
		memberVO.setMember_grade(pointService.callgrade(memberVO.getMember_id()));
		session.setAttribute("grade", memberVO.getMember_grade());
	}
	
	@RequestMapping("gowith/one")
	public void one(GowithVO gowithVO, Model model) {
		dao.increaseView(gowithVO.getGowith_id());
		int room = roomDAO.countRoom(gowithVO.getGowith_id());
		int cmt = gowithcmtDAO.countCmt(gowithVO.getGowith_id());
		GowithVO vo = dao.one(gowithVO);
		List<GowithcmtVO> list = gowithcmtDAO.list(gowithVO.getGowith_id());
		model.addAttribute("vo", vo);
		model.addAttribute("room", room);
		model.addAttribute("cmt", cmt);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("gowith/list1")
	public void list1(PageVO pageVO, Model model) {
		pageVO.setStartEnd();
		List<GowithVO> list = dao.list1(pageVO);
		
		//전체 페이지 수 구하기
		int count = dao.count();
		int pages = count/9;
		if(count%9 != 0) {
			pages = count / 9 + 1;
		}
		//views/gowith로 전달
		model.addAttribute("list", list);
		model.addAttribute("pages", pages);
		model.addAttribute("count", count);
	}
	
	@RequestMapping("gowith/list0")
	public void list0(PageVO pageVO, Model model) {
		pageVO.setStartEnd();
		List<GowithVO> list = dao.list1(pageVO);
		model.addAttribute("list", list);
	}
	
//	@RequestMapping("gowith/updateLike")
//	@ResponseBody
//	public int updateLike(int gowith_id, String member_id, GowithLikeVO gowithLikeVO) {
//		int k = dao.totalLike(gowith_id);
//		if(dao.stateIn(gowithLikeVO)==1) {
//			if(dao.checkState(gowithLikeVO)==2) {
//				k=-1;
//				// alert
//			} else {
//				dao.changeState1(gowithLikeVO);
//				System.out.println(dao.checkState(gowithLikeVO));
//				k = dao.checkState(gowithLikeVO) == 1 ? dao.updateLike1(gowith_id) : dao.updateLike(gowith_id) - 1;//전체 +1 : //-1
//				if(dao.checkState(gowithLikeVO)==0) {k = 0;}
//			}
//		} else {
//			dao.insertLike(gowithLikeVO);
//			dao.changeState1(gowithLikeVO);
//			k = dao.totalLike(gowith_id) + 1;
//		}
//		return k;
//	}
	
	@RequestMapping("gowith/updateLike")
	@ResponseBody
	public int updateLike(int gowith_id, String member_id, GowithLikeVO gowithLikeVO) {
		int k1 = dao.totalLike(gowith_id);
		if(dao.stateIn(gowithLikeVO)==1) {
			if(dao.checkState(gowithLikeVO) == 1) {
				dao.deleteLike(gowithLikeVO);
				dao.updateLike2(gowith_id);
				k1 = dao.totalLike(gowith_id);
			} else {
				k1 = -1;
			}
		} else {
			dao.insertLike(gowithLikeVO);
			dao.updateLike1(gowith_id);
			k1 = dao.totalLike(gowith_id);
		}
		return k1;
	}
	
	@RequestMapping("gowith/updateDislike")
	@ResponseBody
	public int updateDislike(int gowith_id, String member_id, GowithLikeVO gowithLikeVO) {
		int k2 = dao.totalDislike(gowith_id);
		if(dao.stateIn(gowithLikeVO)==1) {
			if(dao.checkState(gowithLikeVO) == 2) {
				dao.deleteLike(gowithLikeVO);
				dao.updateDislike2(gowith_id);
				k2 = dao.totalDislike(gowith_id);
			} else {
				k2 = -1;
			}
		} else {
			dao.insertDislike(gowithLikeVO);
			dao.updateDislike1(gowith_id);
			k2 = dao.totalDislike(gowith_id);
		}
		return k2;
	}
	
}
