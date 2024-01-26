package com.multi.werin.gowith;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.multi.werin.member.MemberVO;
import com.multi.werin.member.PointService;

@Controller
public class GowithcmtController {

	@Autowired
	GowithcmtDAO gowithcmtDAO;
	
	@Autowired
	PointService pointService;
	
	@RequestMapping("gowith/insertCmt")
	public void insertCmt(GowithcmtVO gowithcmtVO, GowithVO gowithVO, HttpSession session, Model model) {
		System.out.println(gowithcmtVO);
		int result = gowithcmtDAO.insert(gowithcmtVO);
		List<GowithcmtVO> list = gowithcmtDAO.list(gowithVO.getGowith_id());
		model.addAttribute("result", result);
		model.addAttribute("list", list);
		MemberVO memberVO = new MemberVO();
		memberVO.setMember_id((String)session.getAttribute("loginId"));
		memberVO.setVariation(1);
		pointService.pointvariation(memberVO);
		System.out.println("comment insert 결과 >>" + result);
	}
	
	@RequestMapping("gowith/updateCmt")
	public void updateCmt(GowithcmtVO gowithcmtVO, Model model) {
		int result = gowithcmtDAO.update(gowithcmtVO);
		model.addAttribute("result", result);
		model.addAttribute("gowithcmtVO", gowithcmtVO);
	}
	
	@RequestMapping("gowith/deleteCmt")
	public void deleteCmt(GowithcmtVO gowithcmtVO, int gowithcmt_id, HttpSession session, Model model) {
		int result = gowithcmtDAO.delete(gowithcmt_id);
		model.addAttribute("result", result);
		model.addAttribute("gowithcmtVO", gowithcmtVO);
		MemberVO memberVO = new MemberVO();
		memberVO.setMember_id((String)session.getAttribute("loginId"));
		memberVO.setVariation(-1);
		pointService.pointvariation(memberVO);
	}
}
