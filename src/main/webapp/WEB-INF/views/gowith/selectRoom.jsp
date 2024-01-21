<%@page import="com.multi.werin.chat.RoomVO"%>
<%@page import="java.util.List"%>
<%@page import="com.multi.werin.chat.MessageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	RoomVO vo = null;
	String host =(String)request.getAttribute("host");
	List<MessageVO> list = (List<MessageVO>)request.getAttribute("list");
	List<RoomVO> roomList = (List<RoomVO>)request.getAttribute("list1");
	
	if((Integer)request.getAttribute("result")==null) {
		vo = (RoomVO)request.getAttribute("vo");
	} else {
		vo = (RoomVO)request.getAttribute("roomVO");
	}
	System.out.println("size" + vo);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
    
    function sendMessage() {
		console.log("sendMessage 호출됨")
		//누가 
		/* var from = document.getElementById("from").value */
		//var from = $('#from').val()
		//입력한 내용 
		var text = document.getElementById("t1").value
		var room_id= <%=vo.getRoom_id()%>
		var message_receiver= "<%=host%>"
		var message_sender= "${sessionScope.loginId}"
		var message_content= $("#t1").val()
		
		
		//stompClient.send()
		stompClient.send("/app/chat", {}, JSON.stringify({
			"message_sender" : message_sender,
			"message_content" : text,
			"message_receiver" : message_receiver
		}))
		$('#t1').val("")
		$("#t1").attr("placeholder", "댓글을 입력하세요.");
		var chatBox = document.getElementById("result");
        chatBox.scrollTop = chatBox.scrollHeight;
	}
    
    $(function() {
		$("#t1").keydown(function(event) {
		    if (event.which === 13 && !event.shiftKey) { // Enter 키 코드 == 13 이면서 Shift 키가 눌리지 않았을 때
		        event.preventDefault(); // 기본 Enter 동작 방지
		        $("#b1").click(); // b1 버튼 클릭
		    } else if (event.which === 13 && event.shiftKey) { // Enter 키 코드 == 13 이면서 Shift 키가 눌렸을 때
		        $("#t1").append("<br>"); // 줄바꿈 추가
		    }
		});
		
		$("#b1").click(function() {
			console.log("b1 click")
			
			console.log("ajax 호출전")
			
			$.ajax({
				url: "insertMessage",
				data: {	
					room_id: <%=vo.getRoom_id()%>,
					message_receiver : message_receiver,
					message_sender: "${sessionScope.loginId}",
					message_content: $("#t1").val()
				},
				dataType: "json",
				success: function(response) {
					alert("등록되었습니다.");
					sendMessage()
					
				}
			}) 
		})
	})
	
    // 방목록에서 방 선택
	$(function() {		
		$("#deleteRoom").click(function() {
			var room_id = $(this).data("room-id");
			$.ajax({
				url: "deleteRoom",
				data: {
					room_id: room_id
				},
				success: function(response) {
					alert("삭제");
				}
			})
		})
	})
	
</script>
</head>
<body>
	<h3 id="roomName" style="text-align: center;"><%=vo.getRoom_name()%></h3>
	<a href="deleteRoomConfirmed?room_id=<%=vo.getRoom_id()%>&gowith_id=<%=vo.getGowith_id()%>"><button class="btnExit" style="background:#FF5555;">나가기</button></a>
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
       		<p style="text-align: center;">채팅을 시작하세요!</p>
    <%
        }
    %>
	<p id="response" class="alert alert-success"></p>
	
	<div class="write">
	  	<textarea class="form-control" id="t1" rows="4" cols="170" name="text" 
	      oninput='this.style.height = ""; this.style.height = this.scrollHeight + "px"' 
	      style="resize: none; padding: 8px; max-height: 80px; margin-right: 10px;" placeholder="메세지를 입력하세요."></textarea>
	  	<button id="b1" style="background: #33CC99;">입력</button>
	</div>
</body>
</html>