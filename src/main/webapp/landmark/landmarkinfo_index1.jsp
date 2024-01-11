<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/landmark.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		document.querySelector('#nature1').addEventListener('click', function() {
			document.getElementById('result1').style.display = 'block';
			document.getElementById('result2').style.display = 'none';
		});

		document.querySelector('#nature2').addEventListener('click', function() {
			document.getElementById('result2').style.display = 'block';
		});

		document.querySelector('#nature3').addEventListener('click', function() {
			
			$('#nature3').click(function () { 
                $.ajax({
                    url: "LandmarkInfo2",
                    success: function (x) {
                        console.log(x);
                        $("#result3").html(x);
                    } // success
                }); // ajax
            }); // b2
			
		});
	});
</script>

<%@ include file="../header.jsp"%>
</head>

<body>

	<div align="center">
		<button id="nature1">자연</button>
		<a href="landmarkinfo_index2.jsp"><button class="jeju-button">인문</button></a>
		<a href="landmarkinfo_index2.jsp"><button class="jeju-button">레포츠</button></a>
		<a href="landmarkinfo_index2.jsp"><button class="jeju-button">쇼핑</button></a>
		<a href="landmarkinfo_index2.jsp"><button class="jeju-button">음식</button></a>
		<a href="landmarkinfo_index2.jsp"><button class="jeju-button">숙박</button></a>
		<a href="landmarkinfo_index2.jsp"><button class="jeju-button">추천코스</button></a>
	</div>
	<hr>
	<div id="result1">
		<button id="nature2">자연관광지</button>
		<button id="nature2">관광자원</button>
	</div>
	<hr>
	<div id="result2">
		<button id="nature3">산</button>
		<button id="nature3">국립공원</button>
		<button id="nature3">도립공원</button>
		<button id="nature3">군립공원</button>
	</div>
	<hr>
	<div id="result3">
	
	</div>

</body>
</html>