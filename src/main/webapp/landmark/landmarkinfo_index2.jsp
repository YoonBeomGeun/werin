<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<script type="text/javascript">
	$(function() {
		
		$('#b1').click(function () { // api java로 가져오기
			$.ajax({
				url: "LandmarkInfo",
				success: function (x) {
					console.log(x);
					$(".result").html(x);
				} // success
			}); // ajax
		}); // b1
		
		$('#b2').click(function () { 
			$.ajax({
				url: "LandmarkInfo2",
				success: function (x) {
					console.log(x);
					$(".result").html(x);
				} // success
			}); // ajax
		}); // b2
		
	})
</script>
<style type="text/css">
#b1 {
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

#b2 {
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
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div>
		<a id = "b1"><button>상세페이지</button></a>
		<a id = "b2"><button>목록부르기</button></a>
	</div>
	<hr>
	<div class = "result"></div>
</body>
</html>