<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.jeju-button {
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
			
.jeju-button:hover {
  background-color: #3498db;
  color: white;
}
</style>
</head>

<body>
	<%@ include file="../header.jsp"%>
	
	<div align="center">
		<a href = "landmarkinfo_index2.jsp"><button class = "jeju-button">자연</button></a><br>
		<a href = "landmarkinfo_index2.jsp"><button class = "jeju-button">인문</button></a><br>
		<a href = "landmarkinfo_index2.jsp"><button class = "jeju-button">레포츠</button></a><br>
		<a href = "landmarkinfo_index2.jsp"><button class = "jeju-button">쇼핑</button></a><br>
		<a href = "landmarkinfo_index2.jsp"><button class = "jeju-button">음식</button></a><br>
		<a href = "landmarkinfo_index2.jsp"><button class = "jeju-button">숙박</button></a><br>
		<a href = "landmarkinfo_index2.jsp"><button class = "jeju-button">추천코스</button></a>
	</div>
	<div id = "result"></div>

</body>
</html>