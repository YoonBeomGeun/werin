<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.multi.werin.bbs.BbsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글 목록</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bbs.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>     
<script type="text/javascript">
	$(function() {
		$(".pages").click(function() {
			$.ajax({
				url: "bbs0",
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
	<jsp:include page="/header.jsp"></jsp:include>
	
	<hr color="red">
	전체 게시물 수 : ${count}개 <br>
	전체 페이지 수 : ${pages}개 <br><br>
	
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
		        <td><a href="bb2?bbs_id=${vo.bbs_id}">${vo.title}</a></td>
		        <td>${vo.content}</td>
		        <td width=200>${vo.writer}</td>
		        <td width=200>${vo.bbs_like}</td>
		    </tr>
			</c:forEach>
		</table>
		<a href="insert.jsp"><button id="b1" class="btn btn-primary">글쓰기</button></a>
	</div>
</body>
</html>