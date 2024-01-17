package com.multi.werin.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.multi.werin.gowith.GowithDAO;

@Controller
public class RoomController {

	@Autowired
	RoomDAO roomDAO;
	
	@Autowired
	GowithDAO dao;
	
	@Autowired
	MessageDAO messageDAO;
	
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
			List<MessageVO> list = null;
			list = messageDAO.list(roomVO.getRoom_id());
			String host = dao.roomHost(roomVO.getGowith_id());
			RoomVO vo = roomDAO.pick(roomVO);
			model.addAttribute("host", host);
			model.addAttribute("vo", vo);
			model.addAttribute("list", list);
		} else {
			int result = roomDAO.insert(roomVO);
			String host = dao.roomHost(roomVO.getGowith_id());
			model.addAttribute("result", result);
			model.addAttribute("host", host);
			model.addAttribute("roomVO", roomVO);
		}
	}
	
	@RequestMapping("gowith/oneRoom")
	public void oneRoom(int room_id, Model model) {
		RoomVO vo = roomDAO.one(room_id);
		model.addAttribute("vo", vo);
	}

}
