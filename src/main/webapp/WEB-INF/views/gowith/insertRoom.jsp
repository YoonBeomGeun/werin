<%@page import="com.multi.werin.chat.RoomVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	RoomVO vo = null;
	if((Integer)request.getAttribute("result")==null) {
		vo = (RoomVO)request.getAttribute("vo");
	} else {
		vo = (RoomVO)request.getAttribute("roomVO");
	}
	
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

	#result {
		background: lightgray;
		width: 850px;
		height: 80vh;
		display: flex;
		margin: 0 auto;
		border-radius: 15px;
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
				
				console.log("여기")
				console.log(JSON.parse(messageOutput.body))
				json = JSON.parse(messageOutput.body)
				$('#response').append(	json.from + ": " + 
										json.text + "(" + json.date + ")" +									
										"<br>")
			})
		})
		
	}
	function disconnect() {
		if(stompClient != null){
			stompClient.disconnect()
			console.log("연결끊어짐.")
		}
	}
	function sendMessage() {
		//누가 
		var from = document.getElementById("from").value
		//var from = $('#from').val()
		//입력한 내용 
		var text = document.getElementById("text").value
		//stompClient.send()
		stompClient.send("/app/chat", {}, JSON.stringify({
			"from" : from,
			"text" : text
		}))
		$('#text').val("")
	}
</script>
</head>
<body onload="disconnect()">
	<jsp:include page="/header.jsp"></jsp:include>
	${pageContext.request.contextPath}
	<br><br>
	<h3 style="text-align: center; "><%=vo.getRoom_name()%></h3>
	
	<!-- 채팅 내용 보여지는 부분 -->
	<div id="result" style="">
		<div class="input-group mb-3 input-group-lg">
			<span class="input-group-text">닉네임 입력:</span> 
			<input type="text" class="form-control" id="from" value="<%=vo.getRoom_member()%>">
		</div>
		<br />
		<div>
			<button id="connect" onclick="connect();" style="width:200px;">Connect</button>
			<button id="disconnect" disabled="disabled" onclick="disconnect();" style="width:200px;" class="btn btn-danger">Disconnect</button>
		</div>
		<br />
		<div id="conversationDiv">
			<input type="text" id="text" placeholder="Write a message..." class="form-control" />
			<button id="sendMessage" onclick="sendMessage();"
				class="btn btn-primary">Send</button>
				
			<p id="response" class="alert alert-success">
				<p>현준-누누티비 시즌2나온대요(11:15)</p>
			</p>
		</div>
	</div>
	
	
	<div style="height:90px;"></div>
	<div class="write">
    	<textarea id="t1" rows="4" cols="170" placeholder="메세지를 입력하세요."></textarea>
    	<button id="b1" style="background: #33CC99;">입력</button>
	</div>
</body>
</html>