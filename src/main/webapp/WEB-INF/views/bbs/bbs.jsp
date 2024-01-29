<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.multi.werin.bbs.BbsVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	BbsVO bag = (BbsVO) request.getAttribute("bag");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글 목록</title>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<style>
table {
	border-collapse: collapse;
	width: 1000px;
	height: 300px;
}

#table {
	display: flex;
	justify-content: center;
}

body {
	text-align: center;
}

#top {
	padding: 10px;
	background-color: #FBB012;
}

.make-button {
	background: #FBB012;
	text-align: center;
	width: 120px;
	height: 40px;
	font: 15px 궁서 bold;
	color: white;
	border-radius: 10px;
	margin-bottom: 10px;
	display: inline-block;
	text-decoration: none;
	line-height: 40px;
	margin-right: 10px; /* 일정 만들기와의 간격을 조절 */
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
#select{
	max-width: 1100px;
	margin: 20px auto;
	background-color: #fff;
	padding: 20px;
	
}
.search{
	background: #FBB012;
	text-align: center;
	width: 120px;
	height: 40px;
	font: 15px 궁서 bold;
	color: white;
	border-radius: 10px;
	margin-bottom: 10px;
	display: inline-block; 
	text-decoration: none;
	line-height: 40px;
	margin-right: 10px; /* 일정 만들기와의 간격을 조절 */
	border: 2px solid #fff;
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
				url : "bbs0",
				data : {
					page : $(this).text(),
					type : $("#type option:selected").val(),
					keyword : $('#keyword').val(),
					kind : $('#kind').val()

				},
				success : function(table) {
					console.log(table);
					$("#result").html(table);
				}
			})
			searchData = {
				page : $(this).text(),
				type : $("select[name=type]").val(),
				keyword : $("input[name=keyword]").val()
			}
		})

	})

	function getSearchList() {
		$.ajax({
			type : 'GET',
			url : "getSearchList",
			data : $("form[name=search-form]").serialize(),
			success : function(result) {
				$('#result > table > tbody').empty();
				if (result.length >= 1) {
					result
							.forEach(function(item) {
								var str = '<tr>';
								str += "<td>" + item.num_id + "</td>";
								str += "<td>" + item.bbs_cate + "</td>";
								str += "<td><a href='/bbs/bbs2?bbs_id="
										+ item.bbs_id + "'>" + item.bbs_title
										+ "</a></td>";
								str += "<td>" + item.bbs_content + "</td>";
								str += "<td width=200>" + item.bbs_writer
										+ "</td>";
								str += "<td width=200>" + item.bbs_total_like
										+ "</td>";
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
	<div id="select">
		<div>
			<h1 style="display: inline-block;">자유 게시판</h1>
			<div style="text-align: left;">
				 <a href="bbs?page=1"><button 
						class="make-button" data-category="전체">전체</button></a>&nbsp; 
						<a
					href="getSearchList?page=1&kind=잡담"><button
						 class="make-button"
						data-category="잡담">잡담</button></a>&nbsp; <a
					href="getSearchList?page=1&kind=질문"><button
						 class="make-button"
						data-category="질문">질문</button></a>&nbsp; <a
					href="getSearchList?page=1&kind=조언"><button
						 class="make-button"
						data-category="조언">조언</button></a>&nbsp; <input type="hidden"
					id="kind" value="${pageVO.kind}">
			</div>
		</div>
		<div id="result">
		<div id="table">
			<table border="1">
				<thead>
					<tr>
						<th id="top" width="10%">번호</th>
						<th id="top" width="10%">카테고리</th>
						<th id="top" width="20%">제목</th>
						<th id="top" width="40%">내용</th>
						<th id="top" width="10%">작성자</th>
						<th id="top" width="10%">추천수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="vo">
						<tr>
							<td>${vo.bbs_id}</td>
							<td>${vo.bbs_cate}</td>
							<td style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;" ><a href="bbs2?bbs_id=${vo.bbs_id}">${vo.bbs_title}</a></td>
							<td>${vo.bbs_content}</td>
							<td>${vo.bbs_writer}</td>
							<td>${vo.bbs_total_like}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
		</div>
		<% 
				if(session.getAttribute("loginId") != null){
		%>
		<div style="text-align: right;">
        <a href="insert.jsp" ><button  class="make-button" >글쓰기</button></a>
        </div>
        <% } %>
		
			<form action="getSearchList" name="search-form" >
				
				<div style="text-align: left;">
				<select id="type" name="type">
					<option value="">검색 내용 선택</option>
					<option value="title"  <c:if test="${pageVO.type eq 'title'}">selected</c:if>>제목</option>
					<option value="content"<c:if test="${pageVO.type eq 'content'}">selected</c:if>>내용</option>
					<option value="writer" <c:if test="${pageVO.type eq 'writer'}">selected</c:if>>작성자</option>
				</select>
				<input type="text" id="keyword" name="keyword" value="${pageVO.keyword}"></input>
				<input type="text" name="page" value="1" hidden></input>
				<input type="hidden" name="kind" value="${pageVO.kind}"> <!-- 정렬기능후 검색할려고 넣음 -->
				<input type="submit" class="search" value="검색" id="boardtable" ></input>
				</div>
				
			</form>
		
		
		<div  style="text-align: center;">
		<%
			int pages = (int)request.getAttribute("pages");//int(작) <--- Object(큰)
			/* out.write(pages); */
			for(int p = 1; p <= pages; p++){
		%>
			<button style="background-color: #FBB012; border: none; padding: 10px 15px; color: white; cursor: pointer; display: inline-block;" class="pages"><%=p%></button>&nbsp;
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
