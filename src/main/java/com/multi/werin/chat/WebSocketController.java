package com.multi.werin.chat;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebSocketController {
	
	@MessageMapping("/{roomId}")
	@SendTo("/topic/{roomId}") //채팅방 이름 {roomId}
	public MessageVO send(@DestinationVariable int roomId, MessageVO messageVO) {
		//from, text만 {roomId}채팅방에 가입한 브라우저로 그대로 보내고 싶은 경우 
		Date date = new Date();		
		messageVO.setMessage_sent_at(date.getHours() + "시 " + date.getMinutes() + "분");
		//System.out.println("messageVO === " + messageVO);
		return messageVO; 
		//return에 뒤에 있는 vo가 가입한 브라우저에 도착
	}

}
