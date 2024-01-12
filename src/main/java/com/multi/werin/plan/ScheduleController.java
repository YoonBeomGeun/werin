package com.multi.werin.plan;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class ScheduleController {
	@Autowired
	ScheduleDAO dao;

	@PostMapping("schedule/addSchedule")
	@ResponseBody
	public String addSchedule(ScheduleVO vo) {
		int result = dao.insert(vo);
		if (result == 1) {
			return "redirect:/member/member.jsp";
		} else {
			return "redirect:/member/insert";
		}
	}
}
