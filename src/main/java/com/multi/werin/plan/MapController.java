package com.multi.werin.plan;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MapController {
	@Autowired
	MapDAO dao;

	@RequestMapping("map/addMap")
	public String addMap(MapVO vo) {
		int result = dao.insert(vo);
		if (result == 1) {
			return "redirect:/member/member.jsp";
		} else {
			return "redirect:/member/insert";
		}
	}
}
