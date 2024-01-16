<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../../../header.jsp" %>
<title>Insert title here</title>
<!-- <script type="text/javascript" src="../resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript">

 	$(function(){
		/* 처음 화면에 들어오면 관광지 검색결과 보여주기 */
		$.ajax({
			url: "landmarkresult",
			data:{
				page: $(this).text()
			},
			success: function(x){
				
			}
		})
		
		/* 관광지 검색결과 */
		$('#b1').click(function(){
			$.ajax({
				url: "landmarkresult",
				data:{
					page: $(this).text()
				},
				success: function(x){
					
				}
			})
		})
		/* 여행기 검색결과 */
		$('#b2').click(function(){
			$.ajax({
				url: "tripresult",
				data:{
					page: $(this).text()
				},
				success: function(x){
					
				}
			})
		})
		/* 자유게시판 검색결과 */
		$('#b3').click(function(){
			$.ajax({
				url: "bbsresult",
				data:{
					page: $(this).text()
				},
				success: function(x){
					
				}
			})
		})
	})
</script> -->
</head>
<body>

<c:if test="${result == 0}">

검색결과입니다<br>
<!-- <button id="b1">관광지 검색결과</button>
<button id="b2">여행기 검색결과</button>
<button id="b3">자유게시판 검색결과</button>

<div class="landmark_result">

</div>
<div class="trip_result">

</div>
<div class="bbs_result">

</div> -->

<div id="totalList">

<div class="search_landmark"> <!-- 관광지 검색 결과 -->
<!-- 3개만 가져와서 보여주는거로 -->
<c:forEach begin="0" end="3" items="${searchlandmark}" var="vo">
<div>
<a href="">${vo.landmarkinfo_name}</a><br> <!-- 여기에 링크 연결해야함 -->
</div>
</c:forEach>
</div>
<div class="more_landmark">
<a href="">랜드마크 검색결과 더보기</a>
</div>

<div class="search_trip"> <!-- 여행기 검색 결과 -->
<c:forEach begin="0" end="3" items="${searchtrip}" var="vo">
<a href="">${vo.trip_title}</a><br> <!-- 여기에 링크 연결해야함 -->
</c:forEach>
</div>
<div class="more_trip">
<a href="">여행기 검색결과 더보기</a>
</div>

<div class="search_bbs"> <!-- 자유게시판 검색 결과 -->
<c:forEach items="${searchbbs}" var="vo">
<a href="">${vo.bbs_title}</a><br> <!-- 여기에 링크 연결해야함 -->
</c:forEach>
</div>

</c:if>
</div>

<c:if test="${result == 1}">
검색 결과가 없습니다
</c:if>
<hr color="yellow">

</body>
</html>