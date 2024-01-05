package com.multi.werin.gowith;

import java.util.List;

import javax.security.auth.callback.ConfirmationCallback;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GowithController {

	@Autowired
	GowithDAO dao;
	
	@RequestMapping("gowith/insert")
	public String insert(GowithVO gowithVO) {
		int result = dao.insert(gowithVO);
		String str = "";
		if(result==1) {
			str = "redirect:list1?page=1";
		}
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
	public void delete(int gowith_id, Model model) {
		int result = dao.delete(gowith_id);
		model.addAttribute("result", result);
	}
	
	@RequestMapping("gowith/one")
	public void one(GowithVO gowithVO, Model model) {
		dao.increaseView(gowithVO.getGowith_id());
		GowithVO vo = dao.one(gowithVO);
		model.addAttribute("vo", vo);
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
	
}
