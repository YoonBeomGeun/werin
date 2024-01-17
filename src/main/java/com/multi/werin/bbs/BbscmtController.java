package com.multi.werin.bbs;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class BbscmtController {
	//안녕하세요
	@Autowired
	BbscmtDAO bbscmtDAO;
	
	@RequestMapping("bbs/insertCmt")
	public void insertCmt(BbscmtVO bbscmtVO, BbsVO bbsVO, Model model) {
		System.out.println(bbscmtVO);
		int result = bbscmtDAO.insert(bbscmtVO);
		List<BbscmtVO> list = bbscmtDAO.list(bbsVO.getBbs_id());
		model.addAttribute("result", result);
		model.addAttribute("list", list);
		System.out.println("comment insert 결과 >>" + result);
	}
	
	@RequestMapping("bbs/updateCmt")
	public void updateCmt(BbscmtVO bbscmtVO, Model model) {
		int result = bbscmtDAO.update(bbscmtVO);
		model.addAttribute("result", result);
		model.addAttribute("bbscmtVO", bbscmtVO);
	}
	
	@RequestMapping("bbs/deleteCmt")
	public void deleteCmt(BbscmtVO bbscmtVO, int bbscmt_id, Model model) {
		int result = bbscmtDAO.delete(bbscmt_id);
		model.addAttribute("result", result);
		model.addAttribute("bbscmtVO", bbscmtVO);
	}
}
