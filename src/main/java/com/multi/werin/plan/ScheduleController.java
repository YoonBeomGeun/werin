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

@Controller
public class ScheduleController {
	@Autowired
	ScheduleDAO dao;

	@PostMapping("schedule/addSchedule")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> addSchedule(ScheduleVO vo) {
		Map<String, Object> response = new HashMap<>();
		int result = dao.insert(vo);
		if (result == 1) {
			response.put("status", "success");
			response.put("message", "일정이 성공적으로 추가되었습니다.");
		} else {
			response.put("status", "fail");
			response.put("message", "일정 추가에 실패했습니다.");
		}
		return ResponseEntity.ok(response);
	}
}
