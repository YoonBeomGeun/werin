package com.multi.werin.bbs;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.multi.werin.member.MemberVO;
import com.multi.werin.member.PointService;


@Controller
public class BbscmtController {
	//안녕하세요
	@Autowired
	BbscmtDAO bbscmtDAO;
	
	@Autowired
	PointService pointService;
	
	@RequestMapping("bbs/insertCmt")
	public void insertCmt(BbscmtVO bbscmtVO, BbsVO bbsVO, Model model, HttpSession session) {
		System.out.println(bbscmtVO);
		int result = bbscmtDAO.insert(bbscmtVO);
		List<BbscmtVO> list = bbscmtDAO.list(bbsVO.getBbs_id());
		model.addAttribute("result", result);
		model.addAttribute("list", list);
		MemberVO memberVO = new MemberVO();
		memberVO.setMember_id((String)session.getAttribute("loginId"));
		memberVO.setVariation(1);
		pointService.pointvariation(memberVO);
		System.out.println("comment insert 결과 >>" + result);
	}
	
	@RequestMapping("bbs/updateCmt")
	public void updateCmt(BbscmtVO bbscmtVO, Model model) {
		int result = bbscmtDAO.update(bbscmtVO);
		model.addAttribute("result", result);
		model.addAttribute("bbscmtVO", bbscmtVO);
	}
	
	@RequestMapping("bbs/deleteCmt")
	public void deleteCmt(BbscmtVO bbscmtVO, int bbscmt_id, Model model, HttpSession session) {
		int result = bbscmtDAO.delete(bbscmt_id);
		model.addAttribute("result", result);
		model.addAttribute("bbscmtVO", bbscmtVO);
		MemberVO memberVO = new MemberVO();
		memberVO.setMember_id((String)session.getAttribute("loginId"));
		memberVO.setVariation(-1);
		pointService.pointvariation(memberVO);
	}
}
