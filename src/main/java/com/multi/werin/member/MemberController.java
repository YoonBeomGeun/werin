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
	@PostMapping("member/idChk") // 아이디 중복확인 체크
	//@RequestMapping("idChk")
	@ResponseBody
	public String idChk(MemberVO vo) throws Exception {
		int result = dao.idChk(vo);
		System.out.println(result);
		return String.valueOf(result);
	}
	
	// 회원가입
	@RequestMapping(value = "member/insert")
	public String insert(MemberVO vo) {
		int result = dao.insert(vo);
		if(result == 1) {
			return "redirect:/member/member.jsp";
		}else {
			return "redirect:/member/insert";
		}
	}
	
	// 로그인
	 @RequestMapping(value = "member/loginProcess", method = RequestMethod.POST)
	    public String loginProcess(MemberVO vo, HttpSession session, Model model) {
	        MemberVO member = dao.login(vo); // dao로 로그인 정보 확인하고 vo를 통해 membervo객체로 반환
	        if (member != null) { // 로그인 성공 여부 판단
	            // 로그인 성공시
	            session.setAttribute("loginId", member.getMember_id()); // 사용자 아이디 저장
	            session.setAttribute("loggedInUser", member);  // 사용자 객체 저장
	            return "redirect:/main/main.jsp"; // 로그인 후 이동할 페이지 경로
	        } else {
	            // 로그인 실패시
	        	model.addAttribute("state", 0); // state값 0
	            return "forward:/member/login.jsp"; // 로그인 실패 시 이동할 페이지 경로 (에러 메시지를 전달할 수도 있음)
	        }
	    }
	 
	 @RequestMapping(value = "member/logout")
	    public String logout(HttpSession session) {
	        session.invalidate(); // 세션 무효화하여 로그아웃
	        return "redirect:/member/login.jsp"; // 로그인 페이지로 다시 리다이렉트
	    }
	 
	 
}
