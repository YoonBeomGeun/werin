package com.multi.werin.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	
	@Autowired
	MemberDAO dao;
	
	//요청하나당 함수하나!!!
	@PostMapping("member/idChk")
	//@RequestMapping("idChk")
	@ResponseBody
	public String idChk(MemberVO vo) throws Exception {
		int result = dao.idChk(vo);
		System.out.println(result);
		return String.valueOf(result);
	}
	
	@RequestMapping(value = "member/insert")
	public String insert(MemberVO vo) {
		int result = dao.insert(vo);
		if(result == 1) {
			return "redirect:/member/member.jsp";
		}else {
			return "redirect:/member/insert";
		}
	}
	
	 @RequestMapping(value = "member/loginProcess", method = RequestMethod.POST)
	    public String loginProcess(MemberVO vo, HttpSession session, Model model) {
	        MemberVO member = dao.login(vo);
	        if (member != null) {
	            // 로그인 성공
	            session.setAttribute("loginId", member.getMember_id());
	            return "redirect:/header.jsp"; // 로그인 후 이동할 페이지 경로
	        } else {
	            // 로그인 실패
	        	model.addAttribute("state", 0);
	            return "redirect:/member/login.jsp"; // 로그인 실패 시 이동할 페이지 경로 (에러 메시지를 전달할 수도 있음)
	        }
	    }
	 
}
