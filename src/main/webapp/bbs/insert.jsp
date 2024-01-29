<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 작성</title>
<style type="text/css">
	.kan {
		display: flex;
		justify-content: center;
		align-items: center;
		margin: 0 auto;
		width: 50%;
		height:800px;
        padding: 20px;
        color:#285D45;
        box-shadow: 0 0 10px #fbb012;
	}
	
	input {
		width: 100%;
		height: 30px;
        padding: 10px;
        font-size: 16px;
        margin-bottom: 10px;
        box-sizing: border-box;
	}
	
	.btn {
		font-size: 17px;
		border-radius:10px;
		width: 70px;
		height: 50px;
		color:white;
		background: rgb(251, 176, 18);
	}
</style>

</head>
<body>
	
	<%@ include file="../header.jsp"%>
	<div class="kan">
		
					
		<form action="insert">
			<h2>카테고리</h2><select name="bbs_cate">
							<option value="잡담">잡담</option>
							<option value="질문">질문</option>
							<option value="조언">조언</option>
							<!-- 여기에 필요한 다른 카테고리 옵션들을 추가할 수 있습니다. -->
					</select>
			<h2>작성자</h2>
			<input type="text" name="bbs_writer" value="${sessionScope.loginId}" readonly>
			<h2>제목 입력</h2>
			<input type="text" name="bbs_title" placeholder="제목을 입력해 주세요.">
			<h2>내용</h2>
			<textarea rows="15" cols="100" name="bbs_content" style="resize: none; font-size: 16px; padding: 10px;" placeholder="내용을 입력해 주세요."></textarea><br>
			
			
			<button type="submit" class="btn">등록하기</button>
		</form>
	</div>
		<div class="bottom" style="height: 50px;">
		
	</div>

			
</body>
</html>