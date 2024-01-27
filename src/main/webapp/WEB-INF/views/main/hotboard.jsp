<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">

<%-- <c:forEach items="${hotboard}" var="vo">
	<div id="hotboard-text">
	<a href="../bbs/bbs2?bbs_id=${vo.bbs_id}">${vo.bbs_title}</a>
	</div>
</c:forEach> --%>
<%@ page import="com.multi.werin.main.MainbbsVO" %>
<%@ page import="java.util.List" %>
<% 
List<MainbbsVO> hotboard = (List<MainbbsVO>)request.getAttribute("hotboard"); 
%>			

 <div id="hotboard_title">
	<div class="hot-line">
		<div class="hot-circle">1</div>
			<a href="../bbs/bbs2?bbs_id=<%=hotboard.get(1).getBbs_id()%>"><%=hotboard.get(1).getBbs_title() %></a>
	</div>
	<div class="hot-line">
		<div class="hot-circle">2</div>
		<a href="../bbs/bbs2?bbs_id=<%=hotboard.get(2).getBbs_id()%>"><%=hotboard.get(2).getBbs_title() %></a>
		</div>
	<div class="hot-line">
		<div class="hot-circle">3</div>
		<a href="../bbs/bbs2?bbs_id=<%=hotboard.get(3).getBbs_id()%>"><%=hotboard.get(3).getBbs_title() %></a>
	</div>
</div>