package com.multi.werin.bbs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;







@Controller
public class BbsController{
	
	@Autowired
	BbsDAO dao;
	
	@RequestMapping("/bbs/insert")
	public String insert2(BbsVO bbsVO, Model model) {
		int result = dao.insertPost(bbsVO);
		String str = "";
		model.addAttribute("result", result);
		if (result == 1) {
			str = "redirect:bbs?page=1";
		}
		return str;
	}
	
	@RequestMapping("bbs/update")
	public void update(BbsVO bbsVO, Model model) {
		BbsVO bag = dao.one(bbsVO);
		model.addAttribute("bag", bag);
	}
	
	@RequestMapping("bbs/update2")
	public void update2(BbsVO bbsVO, Model model) {
		int result = dao.updatePost(bbsVO);
		model.addAttribute("result", result);
	}
	
	@RequestMapping("delete")
	public void delete(int bbs_id, Model model) {
		//System.out.println("post_id >> " + post_id);
		int result = dao.deletePost(bbs_id);
		model.addAttribute("result", result);
	}
}