<%@page import="com.multi.werin.bbs.BbscmtVO"%>
<%@page import="com.multi.werin.gowith.GowithcmtVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BbscmtVO bbscmtVO = (BbscmtVO)request.getAttribute("bbscmtVO");
%>
<script>
	location.href="bbs2?bbs_id=<%=bbscmtVO.getBbs_id()%>";
</script>