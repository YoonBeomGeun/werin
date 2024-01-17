<%@page import="com.multi.werin.chat.MessageVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.multi.werin.chat.RoomVO"%>
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
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/sockjs-0.3.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/stomp.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/webSocketSendToUserApp.js"></script>
<style type="text/css">

	.sendTalk {
		margin-left: 500px;
		margin-left: relative;
		width: relative;
		max-width: 300px;
		word-wrap: break-word;
	}
	
	.receiveTalk {
		margin-left: 20px;
		width: 300px;
		word-wrap: break-word;
	}
	
	.chatList {
		margin-left: 20px;
		width:400px;
		background:gray;
		overflow:hidden;
		flex-direction: column;
		overflow-y: scroll;
	}

	#result {
		background: lightgray;
		width: 850px;
		height: 80vh;
		display: flex;
		margin: 0 auto;
		border-radius: 15px;
		flex-direction: column;
		overflow-y: scroll;
	}
	
	.write {
	    display: flex;
	    justify-content: space-between; /* 내부 요소 사이의 간격을 벌리기 위해 사용합니다. */
	    align-items: center;
	    position: fixed;
	    bottom: 10px;
	    left: 50%;
	    transform: translateX(-50%);
	    width: calc(100% - 20px); /* 화면 가로 길이에서 여백 20px만큼 빼줍니다. */
	    max-width: 850px; /* 최대 너비 설정 */
	    height: 70px;
	    background: lightgray;
	    border-radius: 15px;
	    padding: 0 10px; /* 내부 여백 설정 */
	}
	
	.write button {
		font-size: 17px;
		border-radius:10px;
		width: 70px;
		height: 50px;
		color:white;
	}
</style>
<script type="text/javascript">

	var stompClient = null;
	
	function initialize() {
	    // disconnect 함수 호출
	    disconnect();
	    // connect 함수 호출 (disconnect 이후에 실행됨)
	    connect();
	}

	function connect() {
		//1. 전화기역할을 하는 web Socket객체 생성
		var socket = new SockJS("${pageContext.request.contextPath}/chat")
		//2. 위 Socket을 가지고 서버와 통신할 수 있는 부품 StompClient객체 
		stompClient = Stomp.over(socket)
		//3. 연결하면 됨.! + 데이터가 도착했을 때 자동으로 호출되는 함수를 하나 정의!
		stompClient.connect({}, function(frame) { 
			console.log("연결됨." + frame)
			//stompClient를 이용해서 특정한 채팅방에 가입을 해봅시다.
			stompClient.subscribe("/topic/messages", function(messageOutput) {
				
				console.log(JSON.parse(messageOutput.body))
				json = JSON.parse(messageOutput.body)
				$('#response').append(	"<div class='sendTalk'>" + json.message_sender + " " + json.message_sent_at + "<br>" + /* 시간 글자크기 줄이기 */
										json.message_content + "</div>")
			})
		})
		
	}
	
	function disconnect() {
		if(stompClient != null){
			stompClient.disconnect()
			console.log("연결끊어짐.")
			window.history.back();
		}
	}
	
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
	}
	
	var message_receiver = '<%= vo.getRoom_member().equals(session.getAttribute("loginId")) ? host : vo.getRoom_member() %>'
	
	$(function() {
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
	
</script>
</head>
<body onload="initialize()">
	<jsp:include page="/header.jsp"></jsp:include>
	<br><br>
	<h3 style="text-align: center; "><%=vo.getRoom_name()%></h3>
	<button id="disconnect" onclick="disconnect();" style="width:200px;" class="btn btn-danger">뒤로가기</button><br>
	<button id="roomList" style="width:200px;" class="btn btn-danger">채팅목록</button>
	<div style="display: flex; justify-content: space-between;">
	<div class="chatList">
		<%
			if(roomList!=null) {
            	for (RoomVO vo3 : roomList) {
        %>
       			<div class="" id="room_<%=vo3.getRoom_id()%>">
	            	<span style="font-weight: bold;"><%= vo3.getRoom_host() %></span><br><br>
	                <div class="talk-content" id="name_<%=vo3.getRoom_name()%>">
	                    <%=vo3.getRoom_name()%>
	                </div>
	            </div>
        <%
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
		<div id="conversationDiv">
			<%
				if(list!=null) {
	            	for (MessageVO vo2 : list) {
	            		if(vo2.getMessage_sender().equals(session.getAttribute("loginId"))) {
	        %>
	        			<div class="sendTalk" id="talk_<%=vo2.getMessage_id()%>">
			            	<span style="font-weight: bold;"><%= vo2.getMessage_sender() %></span><br><br>
			                <div class="talk-content" id="content_<%=vo2.getMessage_id()%>">
			                    <%=vo2.getMessage_content()%>
			                </div>
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
				}
	            else {
	        %>
	        		<p style="margin-left: 650px;">채팅을 시작하세요!</p>
	        <%
	            }
	        %>
			<p id="response" class="alert alert-success">
			</p>
		</div>
	</div>
	</div>
	
	<div style="height:90px;"></div>
	<div class="write">
    	<textarea class="form-control" id="t1" rows="4" cols="170" placeholder="메세지를 입력하세요."></textarea>
    	<button id="b1" style="background: #33CC99;">입력</button>
	</div>
</body>
</html>