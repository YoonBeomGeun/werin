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
		<input type="hidden" name="room_member" value="id7">
		<!-- <button type="submit" id="btnSubmit" >전송</button> -->
	</form>
	
	<script type="text/javascript">
		if(confirm("방을 생성하시겠습니까?")) {
			document.getElementById("insertRoomForm").submit();
			alert("방을 생성합니다.")
		}
	</script>
	
	
</body>
</html>