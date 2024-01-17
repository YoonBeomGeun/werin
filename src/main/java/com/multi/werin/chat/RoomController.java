package com.multi.werin.chat;

import java.util.ArrayList;
import java.util.Collection;
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
	public void insertChat(RoomVO roomVO, int gowith_id, String room_name, String room_host, String room_member, Model model) {
		model.addAttribute("gowith_id", gowith_id);
		model.addAttribute("room_name", room_name);
		model.addAttribute("room_host", room_host);
		model.addAttribute("room_member", room_member);
		
		int result = roomDAO.countPick(roomVO);
		model.addAttribute("result", result);
		System.out.println(result);
	}
	
	@RequestMapping("gowith/insertRoom")
	public void insertRoom(RoomVO roomVO, Model model) {
		List<MessageVO> list = null;
		String host = "";
		if(roomDAO.countPick(roomVO)==1) {
			host = dao.roomHost(roomVO.getGowith_id());
			RoomVO vo = roomDAO.pick(roomVO);
			list = messageDAO.list(vo.getRoom_id());
			model.addAttribute("host", host);
			model.addAttribute("vo", vo);
			model.addAttribute("list", list);
		} else {
			int result = roomDAO.insert(roomVO);
			host = dao.roomHost(roomVO.getGowith_id());
			model.addAttribute("result", result);
			model.addAttribute("host", host);
			model.addAttribute("roomVO", roomVO);
		}
		List<RoomVO> list1 = roomDAO.roomList(roomVO.getRoom_member());
		model.addAttribute("list1", list1);
		
	}


}
