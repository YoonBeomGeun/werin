<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int result = 0;
	result = (int)request.getAttribute("result");
	if(result == 1) {
%>
		<script type="text/javascript">
			alert("수정이 완료되었습니다.");
			location.href="one?gowith_id=" + ${gowith_id};
		</script>
<%
	} else {
%>
		<script type="text/javascript">
			alert("수정 실패");
			history.back();
		</script>
<%
	}
%>