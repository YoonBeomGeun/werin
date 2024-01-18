<%@page import="java.util.List"%>
<%@page import="com.multi.werin.chat.MessageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<MessageVO> list = (List<MessageVO>)request.getAttribute("list");
%>
<%
	if(list.size()>=1) {
    	for (MessageVO vo2 : list) {
    		if(vo2.getMessage_sender().equals(session.getAttribute("loginId"))) {
%>
			<div class="sendTalk" id="talk_<%=vo2.getMessage_id()%>">
	      		<span style="font-weight: bold;"><%= vo2.getMessage_sender() %></span><br><br>
	          	<div class="talk-content" id="content_<%=vo2.getMessage_id()%>">
	              	<%=vo2.getMessage_content()%>
	          	</div><br>
	      	</div>
<%
    		} else {
%>
			<div class="receiveTalk" id="talk_<%=vo2.getMessage_id()%>">
      	<span style="font-weight: bold;"><%= vo2.getMessage_receiver() %></span><br><span style="font-weight: bold;" id="time"><%= vo2.getMessage_sent_at() %></span><br><br>
          <div class="talk-content" id="content_<%=vo2.getMessage_id()%>">
              <%=vo2.getMessage_content()%>
          </div>
      </div>
<%
         		}
         	}
} else {
     %>
		<p style="margin-left: 650px;">채팅을 시작하세요!</p>
<%
    }
%>