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
		$('#b1').click(function () {
			$.ajax({
				url: "visitjeju",
				success: function (x) {
					alert(x);
					$("#result").html(x);
				}
			});
		});
	});
</script>
</head>
<body>
	<button id = "b1">json 가져오기</button>
	<hr style = "color: red">
	<div id = "result">결과 들어가는 곳</div>
</body>
</html>