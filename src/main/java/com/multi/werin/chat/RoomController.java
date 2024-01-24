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
		List<MessageVO> list = new ArrayList<>();
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
			model.addAttribute("list", list);
			System.out.println("과연 roomVO에는 뭐가 들어있을까? "+roomVO);
			System.out.println("list는 null인가? " + list);
		}
		List<RoomVO> list1 = roomDAO.roomList(roomVO.getRoom_member());
		model.addAttribute("list1", list1);
		
	}
	
	@RequestMapping("gowith/selectRoom")
	public void selectRoom(int room_id, Model model) {
		RoomVO vo = roomDAO.one(room_id);
		List<MessageVO> list = messageDAO.list(room_id);
		List<RoomVO> list1 = roomDAO.roomList(vo.getRoom_member());
		String host = dao.roomHost(vo.getGowith_id());
		model.addAttribute("vo", vo);
		model.addAttribute("host", host);
		model.addAttribute("list", list);
		model.addAttribute("list1", list1);
		System.out.println("vo는 있는가? " + vo);
	}
	
	@RequestMapping("gowith/deleteRoomConfirmed")
	public void deleteRoomConfirmed(int room_id, Model model) {
		model.addAttribute("room_id", room_id);
	}
	
	@RequestMapping("gowith/deleteRoom")
	public void deleteRoom(int room_id, Model model) {
		int result = roomDAO.deleteRoom(room_id);
		model.addAttribute("result", result);
	}


}
