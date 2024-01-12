package com.multi.werin.plan;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
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
	public String addPlan(PlanVO vo) {
		int result = dao.insert(vo);
		if (result == 1) {
			return "redirect:/member/member.jsp";
		} else {
			return "redirect:/member/insert";
		}
	}

}
