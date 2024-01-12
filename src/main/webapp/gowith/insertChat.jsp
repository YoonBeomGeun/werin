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
    String gowithId = request.getParameter("gowith_id");
    String roomName = request.getParameter("room_name");
    RoomVO roomVO = new RoomVO();
%>
<jsp:include page="/header.jsp"></jsp:include>
	<h2>방 생성하기</h2>
	<%-- <%
		if() {
			
		}
	%> --%>
	<form id="insertRoomForm" action="insertRoom">
		<input type="hidden" name="gowith_id" value=<%=gowithId%>>
		<input type="hidden" name="room_name" value=<%=roomName%>>
		<input type="hidden" name="room_member" value="${sessionScope.loginId}">
		<!-- <button type="submit" id="btnSubmit" >전송</button> -->
	</form>
	
	<script type="text/javascript">
		if(<%=roomVO.getGowith_id()%> && <%=roomVO.getRoom_member()%>.equals(session.getAttribute("loginId"))) {
			
			if(confirm("이미 채팅방이 존재합니다. 기존 채팅방으로 이동하시겠습니까??")) {
				// 기존 채팅방 불러오기
				alert("기존의 방을 불러옴.");
				window.history.back();
			} else {
				window.history.back();
			}
		} else {
			alert(<%=roomVO.getGowith_id()%> && <%=roomVO.getRoom_member()%>.equals(session.getAttribute("loginId")));
			if(confirm("방을 생성하시겠습니까?")) {
				document.getElementById("insertRoomForm").submit();
				alert("방을 생성합니다.")
			} else {
				alert("방 생성을 취소했습니다.")
				window.history.back();
			}
		}
	</script>
	
	
</body>
</html>