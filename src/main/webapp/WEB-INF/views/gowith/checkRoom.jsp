<%@page import="com.multi.werin.chat.RoomVO"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    // gowith_id와 room_name 파라미터 값 추출
    /* String gowithId = request.getParameter("gowith_id");
    String roomName = request.getParameter("room_name"); */
    int gowithId = (int)request.getAttribute("gowith_id");
    String roomName = (String)request.getAttribute("room_name");
    String roomHost = (String)request.getAttribute("room_host");
    int result = (int)request.getAttribute("result");
    //System.out.print(result==1);
%>
<jsp:include page="/header.jsp"></jsp:include>
	<h2>방 생성하기</h2>
	
	<form id="insertRoomForm" action="insertRoom">
		<input type="hidden" name="gowith_id" value=<%=gowithId%>>
		<input type="hidden" name="room_name" value=<%=roomName%>>
		<input type="hidden" name="room_host" value=<%=roomHost%>>
		<input type="hidden" name="room_member" value="${sessionScope.loginId}">
		<!-- <button type="submit" id="btnSubmit" >전송</button> -->
	</form>
	
	<script type="text/javascript">
		if(${result}) {
			if(confirm("이미 채팅방이 존재합니다. 기존 채팅방으로 이동하시겠습니까??")) {
				// 기존 채팅방 불러오기
				window.location.href = "insertRoom";
			} else {
				window.history.back();
			}
		} else {
			if(confirm("방을 생성하시겠습니까?")) {
				document.getElementById("insertRoomForm").submit();
			} else {
				alert("방 생성을 취소했습니다.")
				window.history.back();
			}
		}
	</script>
	
	
</body>
</html>