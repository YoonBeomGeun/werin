<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .center {
    text-align: center;
  }
  
  .center button {
  	color: white;
  	font-size: 20px;
  	background: gold;
  	width: 200px;
  	height: 200px;
  }

</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="center">
  <a href="list1?page=1">
    <button>목록보기</button>
  </a>
</div>
</body>
</html>