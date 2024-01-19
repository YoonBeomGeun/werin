package com.multi.werin.plan;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.annotation.RequestScope;

@Controller
public class ScheduleController {
	@Autowired
	ScheduleDAO dao;

	@RequestMapping("schedule/addSchedule")
	@ResponseBody
	public int addSchedule(@RequestBody ScheduleVO vo) {
		System.out.println("@Controller addSchedule");
		System.out.println("ScheduleVO : " + vo);

		vo.setSchedule_plan_no(vo.getSchedule_plan_no());

		int result = dao.insert(vo);

		return result;
	}
}
