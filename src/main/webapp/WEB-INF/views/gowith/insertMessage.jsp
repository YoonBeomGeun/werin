<%@page import="com.multi.werin.chat.MessageVO"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.springframework.web.context.annotation.RequestScope"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int result = (int)request.getAttribute("result");
	List<MessageVO> list = (List<MessageVO>)request.getAttribute("list");
	if(result == 1) {
		MessageVO messageVO = (MessageVO)request.getAttribute("messageVO");
		Gson gson = new Gson();
        String jsonComment = gson.toJson(messageVO);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonComment);
	}
%>