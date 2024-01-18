<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int result = (int)request.getAttribute("result");
	if(result == 1) {
%>
	<script type="text/javascript">
		alert("삭제가 완료되었습니다.");
		location.href="list1?page=1";
	</script>
	
<%
	} else {
%>
	<script type="text/javascript">
		alert("오류 발생");
	</script>
<%
	}
%>