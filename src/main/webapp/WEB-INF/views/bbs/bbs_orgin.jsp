<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.multi.werin.bbs.BbsVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<%
    BbsVO bag = (BbsVO)request.getAttribute("bag");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글 목록</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>     

<style type="text/css">

 body{
	font-family: 'Arial', sans-serif;
	
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
.total{
	max-width: 1100px;
	margin: 20px auto;
	background-color: #fff;
	padding: 20px;
	
}
 
table {
    width: 100%; /* 테이블 전체 너비를 100%로 설정 */
    border-collapse: collapse; /* 테이블 셀 사이의 간격을 없앰 */
    margin-bottom: 20px; /* 테이블 아래쪽에 여백을 추가 */
   
}

th, td {
    padding: 10px; /* 셀 안의 내용과 테두리 사이의 간격을 조절 */
    border: 1px solid #ddd;
    text-align: center; /* 텍스트를 가운데 정렬 */
}

th {
    background-color: green; /* 헤더 셀 배경색을 lime으로 설정 */
    
}

td:nth-child(3) {
    max-width: 400px; /* 제목 셀의 최대 너비를 400px로 설정 */
    white-space: nowrap; /* 텍스트가 너무 길어도 줄 바꿈을 하지 않고 표시 */
    overflow: hidden; /* 너무 긴 텍스트는 숨김 처리 */
    text-overflow: ellipsis; /* 너무 긴 텍스트는 ...으로 표시 */
}
a {
	text-decoration: none;
	color: #3498db;
}
button {
	background-color: #3498db;
	
	padding: 10px 20px;
	font-size: 16px;
	border: none;
	cursor: pointer;
	margin-top: 20px;
}
#b1 {
    background-color: #4CAF50; /* 초록색 */
    color: white; /* 텍스트 색상을 흰색으로 설정 */
    padding: 10px 20px; /* 내부 여백 설정 */
    font-size: 16px; /* 폰트 크기 설정 */
    border: none; /* 테두리 없앰 */
    cursor: pointer; /* 커서를 손가락으로 변경 */
    border-radius: 5px; /* 둥근 테두리 설정 */
}/* 글쓰기 */
#top{
	background-color: green;
	color: white;
}
	.box-header {
    
    align-items: center;
    justify-content: center;
    text-align: center;
    
    padding: 10px;
}
</style>

<script type="text/javascript">
 $(function() {
    $(".pages").click(function() {
    	console.log($(this).text())
    	console.log($("#type option:selected").val())
    	console.log($('#keyword').val())
    	
    	// 첫 번째 AJAX 호출
        $.ajax({
            url: "bbs0",
            data: {
                page: $(this).text(),
                type: $("#type option:selected").val(),
                keyword : $('#keyword').val(),
                kind: $('#kind').val()
                
            },
            success: function(table) {
                $("#result").html(table);
            }
        })
	        searchData = {
	                page: $(this).text(),
	                type: $("select[name=type]").val(),
	                keyword: $("input[name=keyword]").val()
	            }
    	})
       
    }) 

  
    
	function getSearchList() {
		$.ajax({
			type: 'GET',
			url: "getSearchList",
			data: $("form[name=search-form]").serialize(),
			success: function(result) {
				$('#result > table > tbody').empty();
				if (result.length >= 1) {
					result.forEach(function(item) {
						var str = '<tr>';
						str += "<td>" + item.num_id + "</td>";
						str += "<td>" + item.bbs_cate + "</td>";
						str += "<td><a href='/bbs/bbs2?bbs_id=" + item.bbs_id + "'>" + item.bbs_title + "</a></td>";
						str += "<td>" + item.bbs_content + "</td>";
						str += "<td width=200>" + item.bbs_writer + "</td>";
						str += "<td width=200>" + item.bbs_total_like + "</td>";
						str += "</tr>";
						$("#result").append(str);
						//$('#result > table > tbody').append(str);
						console.log(result);
					});
				}
			}
		});
	}
	
	
	
	
</script>
</head>
<body>
	<jsp:include page="/header.jsp"></jsp:include>
	<div class="box-header">

		<h1 class="box-title">자유 게시판</h1>

	</div>
	
	
	<div class="total">
	
	
	전체 게시물 수 : ${count}개 <br>
	전체 페이지 수 : ${pages}개 <br><br>
		<!-- Check if the user is logged in -->
		<div id="category">
	        <a href="bbs?page=1"><button style="background:#c68a12;" class="category-btn" data-category="전체">전체</button></a>&nbsp;
	        <a href="getSearchList?page=1&kind=잡담"><button style="background:#c68a12;" class="category-btn" data-category="잡담">잡담</button></a>&nbsp;
	        <a href="getSearchList?page=1&kind=질문"><button style="background:#c68a12;" class="category-btn" data-category="질문">질문</button></a>&nbsp;
	        <a href="getSearchList?page=1&kind=조언"><button style="background:#c68a12;" class="category-btn" data-category="조언">조언</button></a>&nbsp;
        	<input type="hidden" id="kind" value="${pageVO.kind}">
        </div>
        
        <div id="result">
		<table border="1" class="table table-bordered table tabel-hover">
		    <tr id="top">
		        <td width=70>행번호</td>
		        <td width=90>카테고리</td>
		        <td width=200>제목</td>
		        <td>내용</td>
		        <td>작성자</td>
		        <td>추천수</td>
		    </tr>
			<c:forEach items="${list}" var="vo">
		    <tr>
		        <td>${vo.bbs_id}</td>
		        <td>${vo.bbs_cate}</td>
		        <td><a href="bbs2?bbs_id=${vo.bbs_id}">${vo.bbs_title}</a></td>
		        <td>${vo.bbs_content}</td>
		        <td width=100>${vo.bbs_writer}</td>
		        <td width=100>${vo.bbs_total_like}</td>
		    </tr>
			</c:forEach>
		</table>
		</div>
		<!-- <a href="insert.jsp"><button id="b1" class="btn btn-primary">글쓰기</button></a> -->	
		<% 
				if(session.getAttribute("loginId") != null){
		%>
        <a href="insert.jsp"><button id="b1" class="btn btn-primary">글쓰기</button></a>
        <% } %>
		
			<form action="getSearchList" name="search-form" >
				<select id="type" name="type">
					<option value="">검색 내용 선택</option>
					<option value="title"  <c:if test="${pageVO.type eq 'title'}">selected</c:if>>제목</option>
					<option value="content"<c:if test="${pageVO.type eq 'content'}">selected</c:if>>내용</option>
					<option value="writer" <c:if test="${pageVO.type eq 'writer'}">selected</c:if>>작성자</option>
				</select>
				<input type="text" id="keyword" name="keyword" value="${pageVO.keyword}"></input>
				<input type="text" name="page" value="1" hidden></input>
				<input type="hidden" name="kind" value="${pageVO.kind}"> <!-- 정렬기능후 검색할려고 넣음 -->
				<input type="submit" class="btn btn-outline-primary" value="검색" id="boardtable"></input>
			</form>
		
		
		<div  style="text-align: center;">
		<%
			int pages = (int)request.getAttribute("pages");//int(작) <--- Object(큰)
			/* out.write(pages); */
			for(int p = 1; p <= pages; p++){
		%>
			<button style="background:green; border: none; padding: 5px 10px; color: white; cursor: pointer; display: inline-block;" class="pages"><%=p%></button>&nbsp;
		<%		
		}
		%>
		<%-- <%
		int pages = (int)request.getAttribute("pages");//int(작) <--- Object(큰)
		for(int p = 1; p <= pages; p++){
		%>
		<a href="bbs?page=<%= p %>">
			<button style="background:lime;"><%= p %></button>
		</a>
		&nbsp;
		<%		
		}
		%> --%>
		</div>	
	</div>

	
</body>
</html> 