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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bbs.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>     
<script type="text/javascript">
 $(function() {
    $(".pages").click(function() {
    	
    	// 첫 번째 AJAX 호출
        $.ajax({
            url: "bbs0",
            data: {
                page: $(this).text()
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
						str += "<td width=200>" + item.bbs_like + "</td>";
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
	<div id="result">
	<hr color="red">
	전체 게시물 수 : ${count}개 <br>
	전체 페이지 수 : ${pages}개 <br><br>
		<!-- Check if the user is logged in -->
		<div id="category">
	        <a href="bbs?page=1"><button style="background:pink;" class="category-btn" data-category="전체">전체</button></a>&nbsp;
	        <a href="getSearchList?page=1&kind=잡담"><button style="background:pink;" class="category-btn" data-category="잡담">잡담</button></a>&nbsp;
	        <a href="getSearchList?page=1&kind=질문"><button style="background:pink;" class="category-btn" data-category="질문">질문</button></a>&nbsp;
	        <a href="getSearchList?page=1&kind=조언"><button style="background:pink;" class="category-btn" data-category="조언">조언</button></a>&nbsp;
        </div>
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
		        <td>${vo.bbs_id}</td>
		        <td>${vo.bbs_cate}</td>
		        <td><a href="bbs2?bbs_id=${vo.bbs_id}">${vo.bbs_title}</a></td>
		        <td>${vo.bbs_content}</td>
		        <td width=200>${vo.bbs_writer}</td>
		        <td width=200>${vo.bbs_like}</td>
		    </tr>
			</c:forEach>
		</table>
		<!-- <a href="insert.jsp"><button id="b1" class="btn btn-primary">글쓰기</button></a> -->	
		<% 
				if(session.getAttribute("loginId") != null){
		%>
        <a href="insert.jsp"><button id="b1" class="btn btn-primary">글쓰기</button></a>
        <% } %>
		<diV id="result2">
			<form action="getSearchList" name="search-form" >
				<select name="type">
					<option value="">검색 내용 선택</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="writer">작성자</option>
				</select>
				<input type="text" name="keyword" value=""></input>
				<input type="text" name="page" value="1" hidden></input>
				<input type="submit" class="btn btn-outline-primary" value="검색" id="boardtable"></input>
			</form>
		</div>
		
		=======================
		<%-- <%
			int pages = (int)request.getAttribute("pages");//int(작) <--- Object(큰)
			/* out.write(pages); */
			for(int p = 1; p <= pages; p++){
		%>
			<button style="background:pink;" class="pages"><%=p%></button>&nbsp;
		<%		
		}
		%> --%>
		<div class="paging">
		<%
		int pages = (int)request.getAttribute("pages");
		if (pages == 0) {
		%>
			등록된 게시글이 없습니다.
			<!-- 꾸며주기 -->
		<%	
		} else {
			for (int p = 1; p <= pages; p++) {
		%>
				<button class="pages"><%=p%></button>
		<%
			}
		}
		%>
		</div>
		
		============================
	</div>
	
</body>
</html> 