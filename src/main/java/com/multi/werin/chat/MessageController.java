package com.multi.werin.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessageController {
	
	@Autowired
	MessageDAO messageDAO;

	@RequestMapping("gowith/insertMessage")
	public void insertMessage(MessageVO messageVO, Model model) {
		//System.out.println("insertMessage : " + messageVO);
		int result = messageDAO.insert(messageVO);
		model.addAttribute("result", result);
	}
	
}
