<%@page import="com.multi.werin.gowith.GowithcmtVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	GowithcmtVO gowithcmtVO = (GowithcmtVO)request.getAttribute("gowithcmtVO");
%>
<script>
	location.href="one?gowith_id=<%=gowithcmtVO.getGowith_id()%>";
</script>