package com.multi.werin.chat;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	
	@Autowired
	MessageDAO messageDAO;
	
	@MessageMapping("/chat")
	@SendTo("/topic/messages") //채팅방이름 messages
	public MessageVO send(MessageVO messageVO) {
		//from, text만 messages채팅방에 가입한 브라우저로 그대로 보내고 싶은 경우 
		Date date = new Date();
		int message_id = messageVO.getMessage_id();
		int room_id = messageVO.getRoom_id();
		String message_receiver = messageVO.getMessage_receiver();
		String message_sender = messageVO.getMessage_sender();
		String message_content = messageVO.getMessage_content();
		
		messageVO.setMessage_sent_at(date.getHours() + "시 " + date.getMinutes() + "분");
		return messageVO; 
		//return에 뒤에 있는vo가 가입한 브라우저에 도착
	}
	
	@RequestMapping("gowith/insertMessage")
	public void insertMessage(MessageVO messageVO, Model model) {
		int result = messageDAO.insert(messageVO);
		model.addAttribute("result", result);
	}

}
