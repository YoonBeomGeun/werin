package com.multi.werin.plan;

import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.multi.werin.member.MemberDAO;
import com.multi.werin.member.MemberVO;

@Controller
public class PlanController {
	@Autowired
	PlanDAO dao;

	 @RequestMapping("plan/addPlan")
	    public String addPlan(PlanVO vo, HttpSession session, Model model) {
	        // 로그인한 사용자의 아이디를 세션에서 가져옴
	        String writer = (String) session.getAttribute("loginId");

	        // 작성자 및 계획과 함께 저장할 스케줄 번호를 설정
	        vo.setPlan_writer(writer);

	        // 여행 날짜 정보를 추출하여 vo에 설정
	        Date startDate = vo.getPlan_start_date();
	        Date endDate = vo.getPlan_end_date();

	        int result = dao.insert(vo);

	        if (result == 1) {
	            return "redirect:/member/member.jsp";
	        } else {
	            return "redirect:/member/insert";
	        }
	    }

}
