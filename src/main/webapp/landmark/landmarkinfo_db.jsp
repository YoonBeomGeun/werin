<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript">
	$(function() {

		$('#b1').click(function() { // api java로 불러서 db에 집어넣고 결과 표시
			$.ajax({
				url : "LandmarkInsert1",

				success : function(x) {
					console.log(x);
					$(".result").html(x);
				} // success
			}); // ajax
		}); // b1

		$('#b2').click(function() { // api java로 불러서 db에 집어넣고 결과 표시
			$.ajax({
				url : "LandmarkInsert2", // 수정 예정
				success : function(x) {
					console.log(x);
					$(".result").html(x);
				} // success
			}); // ajax
		}); // b2
		
		$('#b3').click(function() { // 목록 db 지우기
			$.ajax({
				url : "Landmarkdelete1", // 수정 예정
				success : function(x) {
					console.log(x);
					$(".result").html(x);
				} // success
			}); // ajax
		}); // b2
		
		$('#b4').click(function() { // 상세페이지 db 지우기
			$.ajax({
				url : "Landmarkdelete2", // 수정 예정
				success : function(x) {
					console.log(x);
					$(".result").html(x);
				} // success
			}); // ajax
		}); // b2

		$('#b5').click(function() { // 랜드마크 리스트 전체보기
			$.ajax({
				url : "jejulist",
				success : function(x) {
					console.log(x);
					$(".result").html(x);
				} // success
			}); // ajax
		}); // b5
		
		$('#b6').click(function() { // 상세정보 리스트 전체보기
			$.ajax({
				url : "jejupage",
				success : function(x) {
					console.log(x);
					$(".result").html(x);
				} // success
			}); // ajax
		}); // b6

	});
</script>
<style type="text/css">
#b1, #b2, #b3, #b4, #b5, #b6 {
	display: inline-block;
	padding: 10px 20px;
	font-size: 16px;
	text-align: center;
	text-decoration: none;
	cursor: pointer;
	border: 2px solid #3498db;
	color: #3498db;
	background-color: white;
	border-radius: 5px;
	transition: background-color 0.3s, color 0.3s;
}
</style>
<%@ include file="../header.jsp"%>
</head>
<body>

	<button id="b1">목록 db 삽입</button>
	<button id="b2">상세페이지 db 삽입</button>
	<hr>
	<button id="b3">목록 db 삭제하기</button>
	<button id="b4">상세페이지 db 삭제하기</button>
	<hr>
	<button id="b5">목록 db 리스트 보기</button>
	<button id="b6">상세페이지 db 리스트 보기</button>
	<hr>
	<div class="result"></div>
</body>
</html>