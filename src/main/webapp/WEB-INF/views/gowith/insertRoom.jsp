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
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/sockjs-0.3.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/stomp.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/webSocketSendToUserApp.js"></script>
<style type="text/css">

	.sendTalk {
		background: #ffa74f;
		margin-left: 650px;
		margin-left: relative;
		width: relative;
		max-width: 300px;
		word-wrap: break-word;
		border-radius: 10px;
		padding: 5px;
	}
	
	.receiveTalk {
		margin-left: 20px;
		word-wrap: break-word;
		background: #ffa74f;
		margin-left: relative;
		width: relative;
		max-width: 300px;
		border-radius: 10px;
		padding: 5px;
	}
	
	.wrap {
		display: flex;
		justify-content: space-between;
		width: 1500px;
		margin: 0 auto;
		position: relative;
	}
	
	#roomName {
    position: absolute;
    left: 50%;
	}
	
	.chatList {
    padding: 20px;
    width: 400px;
    background: lightgray;
    overflow: hidden;
    border-radius: 15px;
    flex-direction: column;
    overflow-y: auto;
    flex: 0.5; /* 수정된 부분: 나란히 나타나도록 flex 설정 */
    position: relative;
    margin-top:100px;
	}
	
	#result {
		padding: 10px;
		padding-bottom: 20px;
		border: 5px solid lightgray;
		width: 800px;
		height: 80vh;
		display: flex;
		margin: 0 auto;
		margin-right: 100px;
		border-radius: 15px;
		flex-direction: column;
		overflow-y: auto;
		flex: 2;
		position: relative;
    margin-top:100px;
	}
	
	.btnExit {
		font-size: 17px;
	    border-radius: 10px;
	    width: 70px;
	    height: 50px;
	    color: white;
	    position: absolute;
	    top: 10px;
	    right: 10px;
	}
	
	.write {
	    display: flex;
	    justify-content: space-between; /* 내부 요소 사이의 간격을 벌리기 위해 사용합니다. */
	    align-items: center;
	    position: fixed;
	    margin-top: 70px;
	    bottom: 10px;
	    left: 50%;
	    transform: translateX(-50%);
	    width: calc(100% - 20px); /* 화면 가로 길이에서 여백 20px만큼 빼줍니다. */
	    max-width: 850px; /* 최대 너비 설정 */
	    height: 100px;
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
	
	window.onload = function initialize() {
	    // disconnect 함수 호출
	    disconnect();
	    // connect 함수 호출 (disconnect 이후에 실행됨)
	    connect();
	}

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
				$('#response').append(	"<div class='sendTalk'><span style='font-weight: bold;'>" + json.message_sender + "</span>&nbsp;" + json.message_sent_at + "<br>" + /* 시간 글자크기 줄이기 */
										json.message_content + "</div><br>")
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
		stompClient.send("/app/"+room_id, {}, JSON.stringify({
			"room_id" : room_id,
			"message_sender" : message_sender,
			"message_content" : text,
			"message_receiver" : message_receiver
		}))
		$('#t1').val("")
		$("#t1").attr("placeholder", "댓글을 입력하세요.");
		var chatBox = document.getElementById("result");
        chatBox.scrollTop = chatBox.scrollHeight;
	}
	
	var message_receiver = '<%= vo.getRoom_member().equals(session.getAttribute("loginId")) ? host : vo.getRoom_member() %>'
	
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
					sendMessage()
					
				}
			}) 
		})
	})
	
	<%-- // 방 이름 글자수 설정
    var maxLength = 20;
    // maxLengt 이상이면 문자열을 자르고 "..."를 추가
    var truncatedRoomName = <%=vo.getRoom_name()%>.length > maxLength ? <%=vo.getRoom_name()%>.substring(0, maxLength) + "..." : <%=vo.getRoom_name()%>;
    document.getElementById('roomName').innerText = truncatedRoomName;
    alert("================"+truncatedRoomName); --%>
	
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
	<jsp:include page="/header.jsp"></jsp:include>
	<br><br>
	<button id="disconnect" onclick="disconnect();" style="margin-left: 100px;width:70px;background:#FF5555; color:white;height:35px; border-radius:10px; font-size: 15px;">뒤로가기</button><br>
	
	<div class="wrap">
		<div>
			<h2 id="roomName" style="text-align: center;"><%=vo.getRoom_name()%></h2>
			<a href="deleteRoomConfirmed?room_id=<%=vo.getRoom_id()%>&gowith_id=<%=vo.getGowith_id()%>"><button class="btnExit" style="background:#FF5555;">나가기</button></a>
		</div>
		<br>
		<div class="chatList">
		<h4 id="roomList" style="text-align:center;" class="btnList">채팅목록</h4>
		<hr>
			<%
				if(roomList!=null) {
	            	for (RoomVO vo3 : roomList) {
	        %>
	       			<div class="b2" id="room_<%=vo3.getRoom_id()%>" data-room-id="<%=vo3.getRoom_id()%>">
		            	<span style="font-weight: bold;"><%= vo3.getRoom_host() %></span><br><br>
		                <div class="talk-content" id="name_<%=vo3.getRoom_name()%>">
		                    <%=vo3.getRoom_name()%>
		                </div>
		            </div>
		            <hr>
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
			            	<span style="font-weight: bold;"><%= vo2.getMessage_receiver() %></span>&nbsp;<%=vo2.getMessage_sent_at() %><br><br>
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
	    	<textarea class="form-control" id="t1" rows="4" cols="170" name="text" 
	        oninput='this.style.height = ""; this.style.height = this.scrollHeight + "px"' 
	        style="resize: none; padding: 8px; max-height: 80px; margin-right: 10px;" placeholder="메세지를 입력하세요."></textarea>
	    	<button id="b1" style="background: #33CC99;">입력</button>
		</div>
	</div>
	<div style="height:120px;"></div>
</body>
</html>