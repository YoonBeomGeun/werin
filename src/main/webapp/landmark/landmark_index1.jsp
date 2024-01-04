<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript">
$(function () {
	
	$('#b1').click(function () { // state_city 불러오기
		$.ajax({
			url : "landmark_index2.jsp",
			success : function (x) {
				$("#result").html(x)
			}
		}) // ajax
	}) // b1
	
}) // $
</script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div align="center">
		<button id = "b1">이동</button>
	</div>
	<div id = "result"></div>

</body>
</html>