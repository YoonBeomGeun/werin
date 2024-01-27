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

	var stompClient = null;
	
	$(function() {
		 disconnect();
		    // connect 함수 호출 (disconnect 이후에 실행됨)
		    console.log("onload")
		    connect();
	})
	
	function connect() {
		//1. 전화기역할을 하는 web Socket객체 생성
		var socket = new SockJS("${pageContext.request.contextPath}/chat");
		//2. 위 Socket을 가지고 서버와 통신할 수 있는 부품 StompClient객체 
		stompClient = Stomp.over(socket)
		//3. 연결하면 됨.! + 데이터가 도착했을 때 자동으로 호출되는 함수를 하나 정의!
		stompClient.connect({}, function(frame) { 
			console.log("연결됨." + frame)
			console.log("로그 결과는~~~" + <%=vo.getRoom_id()%>);
			
			//stompClient를 이용해서 특정한 채팅방에 가입을 해봅시다.
			stompClient.subscribe("/topic/<%= vo.getRoom_id() %>", function(messageOutput) {
				
				console.log(JSON.parse(messageOutput.body))
				json = JSON.parse(messageOutput.body)
				$('#response').append()
			})
			var chatBox = document.getElementById("result");
	        chatBox.scrollTop = chatBox.scrollHeight;
		})
	}
    
    function sendMessage() {
		console.log("sendMessage 호출됨")
		//누가 
		/* var from = document.getElementById("from").value */
		//var from = $('#from').val()
		//입력한 내용 

		var text = document.getElementById("t1").value;
		var room_id= <%=vo.getRoom_id()%>
		var message_receiver= "<%=host%>"
		var message_sender= "${sessionScope.loginId}"
		var message_content= $("#t1").val()
		console.log("message_sender==============" + message_sender);
		console.log("text======================"+ text);
		console.log("message_receiver==============="+message_receiver);
		
		//stompClient.send()
		stompClient.send("/app/"+room_id, {}, JSON.stringify({
			"message_sender" : message_sender,
			"message_content" : text,
			"message_receiver" : message_receiver
		}))
		$('#t1').val("")
		$("#t1").attr("placeholder", "댓글을 입력하세요.");
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
			console.log("selectRoom b1 click")
			
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
					sendMessage()
					
				}
			}) 
		})
	})
	
    // 방목록에서 방 선택
	$(function() {
		
		$(".b2").click(function() {
			var room_id = $(this).data("room-id");
			$.ajax({
				url: "selectRoom",
				data: {
					room_id: room_id
				},
				success: function(response) {
					$(".wrap").empty();
					$(".wrap").append(response);
				}
			})
		})
		
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
	<div>
		<h2 id="roomName" style="text-align: center;"><%=vo.getRoom_name()%></h2>
		<a href="deleteRoomConfirmed?room_id=<%=vo.getRoom_id()%>&gowith_id=<%=vo.getGowith_id()%>"><button class="btnExit" style="background:#FF5555;">나가기</button></a>
	</div>
	<br>
	<div class="chatList">
	<h4 id="roomList" style="text-align:center;" class="btnList">채팅목록</h4>            <!-- 채팅 목록 보기 -->
	<hr>
		<%
			if(roomList!=null) {
            	for (RoomVO vo3 : roomList) {
            		if(vo3.getRoom_host().equals(session.getAttribute("loginId"))) {
        %>
	       			<div class="b2" id="room_<%=vo3.getRoom_id()%>" data-room-id="<%=vo3.getRoom_id()%>">
		            	<span style="font-weight: bold;"><%= vo3.getRoom_member() %> 님</span><br><br>
		                <div class="talk-content" id="name_<%=vo3.getRoom_name()%>">
		                    <%=vo3.getRoom_name()%>
		                </div>
		            </div>
		            <hr>
        <%
            		} else {
        %>
	        		<div class="b2" id="room_<%=vo3.getRoom_id()%>" data-room-id="<%=vo3.getRoom_id()%>">
		            	<span style="font-weight: bold;"><%= vo3.getRoom_host() %> 님</span><br><br>
		                <div class="talk-content" id="name_<%=vo3.getRoom_name()%>">
		                    <%=vo3.getRoom_name()%>
		                </div>
		            </div>
		            <hr>
	    <%
            		}
            	}
			}
            else {
        %>
        		<p style="margin-left: 650px;">채팅을 시작하세요!</p>
        <%
            }
        %>
	</div>
	
	<!-- 채팅 내용 보여지는 부분 -->
	<div id="result">
		<%-- <input type="hidden" id="from" value="<%=vo.getRoom_member()%>" style=""> --%>
		
		<%
			if(list.size()>=1) {
            	for (MessageVO vo2 : list) {
            		if(vo2.getMessage_sender().equals(session.getAttribute("loginId"))) {
        %>
        			<div class="sendTalk" id="talk_<%=vo2.getMessage_id()%>">
		            	<span style="font-weight: bold;"><%= vo2.getMessage_sender() %></span>&nbsp;<%=vo2.getMessage_sent_at() %><br><br>
		                <div class="talk-content" id="content_<%=vo2.getMessage_id()%>">
		                    <%=vo2.getMessage_content()%>
		                </div>
		            </div><br>
        <%
            		} else {
        %>
        			<div class="receiveTalk" id="talk_<%=vo2.getMessage_id()%>">
		            	<span style="font-weight: bold;"><%= vo2.getMessage_sender() %></span>&nbsp;<%=vo2.getMessage_sent_at() %><br><br>
		                <div class="talk-content" id="content_<%=vo2.getMessage_id()%>">
		                    <%=vo2.getMessage_content()%>
		                </div>
		            </div><br>
        <%
            		}
            	}
			} else {
        %>
        		<p style="text-align: center;">채팅을 시작하세요!</p>
        <%
            }
        %>
		<p id="response" class="alert alert-success">
		</p>
	
	</div>
	<div class="write">
    	<textarea class="form-control" id="t1" rows="3" cols="170" name="text" 
        oninput='this.style.height = ""; this.style.height = this.scrollHeight + "px"' 
        style="resize: none; padding: 8px; max-height: 80px; margin-right: 10px; border: 0;" placeholder="메세지를 입력하세요."></textarea>
    	<button id="b1" style="background: #3a8966;">입력</button>
	</div>
</body>
</html>