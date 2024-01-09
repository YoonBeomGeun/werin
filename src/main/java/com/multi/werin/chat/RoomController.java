package com.multi.werin.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RoomController {

	@Autowired
	RoomDAO roomDAO;
	
	@RequestMapping("chat/insertRoom")
	public void insert() {
		
	}

}
