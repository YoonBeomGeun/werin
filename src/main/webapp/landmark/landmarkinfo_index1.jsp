<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/landmark.css"> --%>
<style type="text/css">
.culture {
	display: inline-block;
	padding: 10px 20px;
	font-size: 16px;
	text-align: center;
	text-decoration: none;
	cursor: pointer;
	border: 3px solid #000000;
	color: #000000;
	background-color: white;
	border-radius: 15px;
	transition: background-color 0.3s, color 0.3s;
}

.culture:hover { /* 호버 시 배경색과 글자색 변경 */
	background-color: rgb(251, 176, 18);
	color: white;
}


#page {
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

#result1, #result2 {
	display: none;
}

#admin {
	display: none; /* 초기에는 숨김 처리 */
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
#result3 {
    text-align: center; /* 결과 영역의 텍스트를 중앙 정렬 */
}

.paging {
    text-align: center; /* 페이징 버튼을 중앙 정렬 */
    margin-top: 20px; /* 위쪽 여백 추가 */
}

.pages {
    display: inline-block;
    padding: 8px 12px;
    margin: 0 4px;
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

.pages:hover {
    background-color: #3498db;
    color: white;
}

</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		document.querySelectorAll('.culture').forEach(function(button) {
			button.addEventListener('click', function() {
				var cultureType = button.dataset.cultureType;
				$.ajax({
					url : "jejulistpaging1",
					data: { cultureType: cultureType },
					data : {
						cultureType : cultureType
					}, // cultureType을 매개변수로 전달합니다.
					success : function(data) {
						console.log(data);
						$("#result3").html(data);
					},
					error : function(xhr, status, error) {
						console.error(xhr.responseText);
					}
				});
			});
		});

		// 'admin'인 경우에만 버튼을 보이게 설정
		var loginId = "${sessionScope.loginId}";
		if (loginId !== null && loginId === 'admin') {
			document.getElementById('admin').style.display = 'inline-block';
		}

	});
	
</script>

<%@ include file="../header.jsp"%>
</head>

<body>

	<a href="landmarkinfo_db.jsp"><button id="admin">db관리자용
			페이지</button></a>
	<h1 align="center" style="color: orange;">제주도의 관광지를 만나보세요!</h1>
	<hr>
	<div align="center">
		<button class="culture" data-culture-type="history">역사관광지</button>
		<button class="culture" data-culture-type="resort">휴양관광지</button>
		<button class="culture" data-culture-type="experience">체험관광지</button>
		<button class="culture" data-culture-type="industry">산업관광지</button>
		<button class="culture" data-culture-type="architecture">건축/조형물</button>
	</div>
	<hr>
	<div id="result3"></div>

</body>
</html>