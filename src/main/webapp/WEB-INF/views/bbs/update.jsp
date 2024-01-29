<%@page import="com.multi.werin.bbs.BbsVO"%>
<%@page import="com.multi.werin.bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    BbsVO bag = (BbsVO)request.getAttribute("bag");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #ffffff;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .container {
            max-width: 1200px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px #fbb012;
        }

        .form-group {
            margin-bottom: 15px;
            overflow: hidden; /* Add this to clear floats */
        }
         input,
        select,
        textarea {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }
        
        textarea {
            height: 200px;
            resize: none;
        }
        
          /* 버튼 스타일 */
        button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
            border: none;
            border-radius: 5px;
            color: #fff;
        }

        .update-btn {
            font-size: 17px;
		border-radius:10px;
		width: 70px;
		height: 50px;
		color:white;
		background: rgb(251, 176, 18);
        }

        .return-btn {
            font-size: 17px;
		border-radius:10px;
		width: 70px;
		height: 50px;
		color:white;
		background: rgb(251, 176, 18);
        }
        form {
        	display:inline;
        }
        </style>
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<style type="text/css">
 		


    </style>
    <script type="text/javascript"></script>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
	<div class="box-header" style="text-align: center">

		<h3 class="box-title">게시판 수정</h3>

	</div>
	<div class="container">
	<div>
		<form action="update2" >
			<div class="form-group" id = "d1">
	            <label for="bbs_title"><strong>제목</strong></label> 
	            <input name = bbs_title id = "bbs_title" value = ${bag.bbs_title}><br>
	         </div>
	         <div class="form-group">
	            <label for="bbs_content"><strong>내용</strong></label>
	            <textarea id = "bbs_content" name = bbs_content>${bag.bbs_content}</textarea>
	         </div>
	            <input type = "hidden" name = "bbs_id" value = ${bag.bbs_id}>
        <button class="update-btn">수정</button>&nbsp;
        </form>
        <a href = "${pageContext.request.contextPath}/bbs/bbs?page=1"><button class = "return-btn">돌아가기</button></a> <!-- 강사님에게 질문 -->
     </div>
     
        
		
	</div>
</body>
</html>

