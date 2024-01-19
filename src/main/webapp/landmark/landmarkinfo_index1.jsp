<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/landmark.css"> --%>
<style type="text/css">
#nature1, #culture1, #db {
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

#culture2 {
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

#culture3, #culture4, #page {
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
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		document.querySelector('#culture1').addEventListener('click', function() {
			document.getElementById('result1').style.display = 'block';
			document.getElementById('result2').style.display = 'none';
		});

		document.querySelector('#culture2').addEventListener('click', function() {
			document.getElementById('result2').style.display = 'block';
		});

		document.querySelector('#culture3').addEventListener('click', function() {
			
			$('#culture4').click(function () { // 목록 페이지 전체보기
                $.ajax({
                    url: "jejulist",
                    success: function (x) {
                        console.log(x);
                        $("#result3").html(x);
                    } // success
                }); // ajax
            }); // b2
    		
    		$('#page').click(function() { // 상세정보 리스트 전체보기
    			$.ajax({
    				url : "jejupage",
    				success : function(x) {
    					console.log(x);
    					$(".result3").html(x);
    				} // success
    			}); // ajax
    		}); // b6
			
		});
	});
</script>

<%@ include file="../header.jsp"%>
</head>

<body>

	<a href = "landmarkinfo_db.jsp"><button id = "db">db관리자용 페이지</button></a> 
	<h1 align="center" style="color : orange;">제주도의 관광지를 만나보세요!</h1>
	<hr>
	<div align="center">
		<button id="culture1">문화, 예술, 역사</button>
		<!-- <button id="nature1">자연</button> -->
	</div>
	<hr style="display : none;">
	<div id="result1">
		<button id="culture2">건축/조형물</button>
		<button id="">체험관광지</button>
	</div>
	<hr style="display : none;">
	<div id="result2">
		<button id="culture3">기념탑/기념비/전망대</button>
	</div>
	<hr>
	<button id="culture4">검색(목록 db 리스트 보기)</button>
	<button id="page">상세페이지 db 리스트 보기</button>
	<div id="result3">
	
	</div>

</body>
</html>