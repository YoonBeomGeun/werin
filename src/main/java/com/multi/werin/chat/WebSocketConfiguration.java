package com.multi.werin.chat;

import org.springframework.context.annotation.Configuration;

import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.AbstractWebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfiguration extends AbstractWebSocketMessageBrokerConfigurer{

	@Override
	public void configureMessageBroker(MessageBrokerRegistry config) {
		config.enableSimpleBroker("/topic");
		//채팅방 만들 때 topic/app, topic/room
		config.setApplicationDestinationPrefixes("/app");
		//웹소켓 프로그램 이름 설정?? app
	}
	
	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		//실시간 채팅 요청할 때 주소 지정 /chat
		registry.addEndpoint("/chat");//자바 웹소켓 통신 주소 
		registry.addEndpoint("/chat").withSockJS();//자바 스크립트 웹소켓 통신 주소
	}
}
