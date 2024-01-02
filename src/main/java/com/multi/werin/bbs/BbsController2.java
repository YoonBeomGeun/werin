package com.multi.werin.bbs;

import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class BbsController2 {
	
	@Autowired
	private BbsService bbsService;
	
	@Autowired
	BbsDAO dao;

	@Autowired
	BbscmtDAO dao2;

	@RequestMapping("bbs/insert2")
	public String insert2(BbsVO bbsVO, Model model) {
		int result = dao.insertPost(bbsVO);
		String str = "";
		model.addAttribute("result", result);
		if (result == 1) {
			str = "redirect:list2?page=1";
		}
		return str;
	}

//	@RequestMapping("insert2")
//	public void insert2(PostVO postVO, Model model) { //start, end
//		int result = dao.insertPost(postVO);
//		model.addAttribute("result", result);
//	}

//	@RequestMapping("update")
//	public String update(PostVO postVO) {
//		int result = dao.updatePost(postVO);
//		String str = ""; if(result==1) { str = "redirect:list2?page=1"; str =
//		"update.jsp"; } else { str = "no"; }
//		return str;
//		
//	}
	
	@RequestMapping("bbs/update")
	public void update(BbsVO bbsVO, Model model) {
		BbsVO bag = dao.one(bbsVO);
		model.addAttribute("bag", bag);
	}
	
	@RequestMapping("bbs/update2")
	public void update2(BbsVO bbsVO, Model model) {
		int result = dao.updatePost(bbsVO);
		model.addAttribute("result", result);
//		String str = "";
//		if(result==1) {
//			str = "redirect:list2?page=1";
//		} else {
//			str = "no";
//		}
//		return str;
	}

	@RequestMapping("bbs/delete")
	public void delete(int post_id, Model model) {
		//System.out.println("post_id >> " + post_id);
		int result = dao.deletePost(post_id);
		model.addAttribute("result", result);
	}

	@RequestMapping("bbs/list2")
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
	}

//	@RequestMapping("one")
//	public void one(int post_id, Model model) {
//		//System.out.println("post_id : " + post_id);
//		PostVO bag = dao.one(post_id);
//		model.addAttribute("bag", bag);
//		System.out.println(bag);
//	}

	@RequestMapping("bbs/one")
	public void one(BbsVO bbsVO, Model model) {
		// System.out.println("post_id : " + post_id);
		BbsVO bag = dao.one(bbsVO);
		List<BbscmtVO> list = dao2.list(bbsVO.getPost_id());
		model.addAttribute("bag", bag);
		model.addAttribute("list", list);
		System.out.println(bag);
	}

}
