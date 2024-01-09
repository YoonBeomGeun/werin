package com.multi.werin.member;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberService {
	 @RequestMapping("/header")
	public String somePage(HttpSession session, Model model) {
        String loggedInUserId = (String) session.getAttribute("loginId");
        if (loggedInUserId != null) {
            // 사용자가 로그인되어 있음, 필요한 경우 더 많은 정보 검색
            MemberVO loggedInUser = (MemberVO) session.getAttribute("loggedInUser");
            // 사용자 정보를 모델에 추가하거나 필요한 작업 수행
            model.addAttribute("loggedInUser", loggedInUser);
        }
        // 나머지 로직 계속 진행
        return "header.jsp";
    }
}
