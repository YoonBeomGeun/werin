//package com.multi.werin.bbs;
//
//import java.util.List;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//
//@Controller
//public class BbsController{
//	
//	@Autowired
//	BbsDAO dao;
//	
////	@Autowired
////	BbscmtDAO dao2;
//	
//	@RequestMapping("/bbs/insert")
//	public String insert2(BbsVO bbsVO, Model model) {
//		int result = dao.insertPost(bbsVO);
//		String str = "";
//		model.addAttribute("result", result);
//		if (result == 1) {
//			str = "redirect:bbs?page=1";
//		}
//		return str;
//	}
//	
//	@RequestMapping("bbs/update")
//	public void update(BbsVO bbsVO, Model model) {
//		BbsVO bag = dao.one(bbsVO);
//		model.addAttribute("bag", bag);
//	}
//	
//	@RequestMapping("bbs/update2")
//	public void update2(BbsVO bbsVO, Model model) {
//		int result = dao.updatePost(bbsVO);
//		model.addAttribute("result", result);
//	}
//	
//	@RequestMapping("bbs/delete")
//	public void delete(int bbs_id, Model model) {
//		//System.out.println("post_id >> " + post_id);
//		int result = dao.deletePost(bbs_id);
//		model.addAttribute("result", result);
//	}
//	
//	@RequestMapping("bbs/bbs")
//	public void list2(PageVO pageVO, Model model) { // start, end
//		pageVO.setStartEnd();// start, end계산해주는 메서드
//		System.out.println(pageVO);
//		List<BbsVO> list = dao.list1(pageVO);
//		// 전체 페이지수 구하기
//		int count = dao.count(); // 전체게시물 수
//		System.out.println("전체 게시물수>> " + count);
//		int pages = count / 10;
//		if (count % 10 != 0) {
//			pages = count / 10 + 1;
//		}
//		// 모델로 views까지 페이지수를 넘겨야 페이지수 버튼을 만들 수 있음.
//		System.out.println("페이지당 가지고 온 게시물수>> " + list.size());
//		// views의 list1.jsp로 전달
//		model.addAttribute("list", list);
//		model.addAttribute("pages", pages);
//		model.addAttribute("count", count);
//	}
//	
//	@RequestMapping("bbs/bbs0")
//	public void list0(PageVO pageVO, Model model) {
//		pageVO.setStartEnd();
//		List<BbsVO> list = dao.list1(pageVO);
//		model.addAttribute("list", list);
//	}
//	
////	@RequestMapping("bbs/bbs2")
////	public void one(BbsVO bbsVO, Model model) {
////		// System.out.println("post_id : " + post_id);
////		BbsVO bag = dao.one(bbsVO);
////		List<BbscmtVO> list = dao2.list(bbsVO.getBbs_id());
////		model.addAttribute("bag", bag);
////		model.addAttribute("list", list);
////		System.out.println(bag);
////	}
//}