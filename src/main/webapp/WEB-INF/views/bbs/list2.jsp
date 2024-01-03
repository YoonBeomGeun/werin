<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function() {
		$(".pages").click(function() {
			$.ajax({
				url: "list0",
				data: {
					page: $(this).text()
				},
				success: function(table) {
					$("#result").html(table)
				}
			})
		})
	})
</script>
</head>
<body>
	<hr color="red">
	전체 게시물 수 : ${count}개 <br>
	전체 페이지 수 : ${pages}개 <br><br>
	<%
		int pages = (int)request.getAttribute("pages");//int(작) <--- Object(큰)
		for(int p = 1; p <= pages; p++){
	%>
		<%-- <a href="list2?page=<%= p %>">
			<button style="background:lime;"><%= p %></button>
		</a> --%>
		<button style="background:pink;" class="pages"><%=p%></button>&nbsp;
	<%		
		}
	%>
	<hr color="red">
	<div id="result">
		<table border="1" class="table table-bordered table tabel-hover">
		    <tr bgcolor="lime">
		        <td width=70>행번호</td>
		        <td width=90>카테고리</td>
		        <td width=200>제목</td>
		        <td>내용</td>
		        <td>작성자</td>
		        <td>추천수</td>
		    </tr>
			<c:forEach items="${list}" var="vo">
		    <tr>
		        <td>${vo.num_id}</td>
		        <td>${vo.cate}</td>
		        <!--   <td><a href="one?post_id=${vo.post_id}">${vo.title}</a></td>-->
		         <td><a href="one?post_id=${vo.post_id}">${vo.title}</a></td>
		        <td>${vo.content}</td>
		        <td width=200>${vo.writer}</td>
		        <td width=200>${vo.good}</td>
		    </tr>
			</c:forEach>
		</table>
		<a href="insertPost.jsp"><button id="b1" class="btn btn-primary">글쓰기</button></a>
	</div>
</body>
</html>