<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript">

	$(function () {
		
		$('#b1').click(function () { // api java로 가져오기
			$.ajax({
				url: "LandmarkInfo",
				success: function (x) {
					console.log(x);
					$(".result").html(x);
				} // success
			}); // ajax
		}); // b1
		 
		$('#b2').click(function() { // api ajax로 가져오기
			//var xhr = new XMLHttpRequest();
			$.ajax({ // url의 KoreService1 뒤가 조건 수정 부분
				url: "https://apis.data.go.kr/B551011/KorService1/areaCode1?MobileOS=ETC&MobileApp=Test&ServiceKey=gRjisabrZIfabIjre8qnZIy4ig724PgKzbxWE5KdbOHL4SD%2FneKsnNw2phKHIowgD5NXuBRaTpMEvSAY2uTA1Q%3D%3D&_type=json",
				dataType: "json",
				success: function(json) {
					console.log(json);
					$(".result").append(JSON.stringify(json));
					
				} // success
			})  // ajax
		}) // b2
		
	}); // $
</script>
</head>
<body>
	<button id = "b1">json java로 가져오기</button>
	<button id = "b2">json ajax로 가져오기</button>
	<hr style = "color: red">
	<div class = "result">결과 들어가는 곳</div>
</body>
</html>