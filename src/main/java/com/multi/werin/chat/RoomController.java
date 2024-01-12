package com.multi.werin.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RoomController {

	@Autowired
	RoomDAO roomDAO;
	
	@RequestMapping("gowith/insertRoom")
	public void insertRoom(RoomVO roomVO, Model model) {
		int result = roomDAO.insert(roomVO);
		model.addAttribute("result", result);
		model.addAttribute("roomVO", roomVO);
	}
	
	@RequestMapping("gowith/oneRoom")
	public void oneRoom(int room_id, Model model) {
		RoomVO vo = roomDAO.one(room_id);
		model.addAttribute("vo", vo);
	}

}
