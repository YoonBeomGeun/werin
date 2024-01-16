package com.multi.werin.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RoomController {

	@Autowired
	RoomDAO roomDAO;
	
	@RequestMapping("gowith/checkRoom")
	public void insertChat(RoomVO roomVO, int gowith_id, String room_name, String room_member, Model model) {
		model.addAttribute("gowith_id", gowith_id);
		model.addAttribute("room_name", room_name);
		model.addAttribute("room_member", room_member);
		
		int result = roomDAO.countPick(roomVO);
		model.addAttribute("result", result);
		System.out.println(result);
	}
	
	@RequestMapping("gowith/insertRoom")
	public void insertRoom(RoomVO roomVO, Model model) {
		if(roomDAO.countPick(roomVO)==1) {
			RoomVO vo = roomDAO.pick(roomVO);
			model.addAttribute("vo", vo);
		} else {
			int result = roomDAO.insert(roomVO);
			model.addAttribute("result", result);
			model.addAttribute("roomVO", roomVO);
		}
		System.out.println(roomDAO.countPick(roomVO));
	}
	
	@RequestMapping("gowith/oneRoom")
	public void oneRoom(int room_id, Model model) {
		RoomVO vo = roomDAO.one(room_id);
		model.addAttribute("vo", vo);
	}

}
