<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 작성</title>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<style type="text/css">
	body{
	font-family: 'Arial', sans-serif;
	
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
#total{
	max-width: 1100px;
	margin: 20px auto;
	background-color: #fff;
	padding: 20px;
	
}
table {
    width: 100%; /* 테이블 전체 너비를 100%로 설정 */
    border-collapse: collapse; /* 테이블 셀 사이의 간격을 없앰 */
    margin-bottom: 20px; /* 테이블 아래쪽에 여백을 추가 */
   
}
th, td {
    padding: 10px; /* 셀 안의 내용과 테두리 사이의 간격을 조절 */
    border: 1px solid #ddd;
    /* 텍스트를 가운데 정렬 */
}

th {
    background-color: green; /* 헤더 셀 배경색을 lime으로 설정 */
    
}
#b1  {
    background-color: #4CAF50; /* 초록색 */
    color: white; /* 텍스트 색상을 흰색으로 설정 */
    padding: 10px 20px; /* 내부 여백 설정 */
    font-size: 16px; /* 폰트 크기 설정 */
    border: none; /* 테두리 없앰 */
    cursor: pointer; /* 커서를 손가락으로 변경 */
    border-radius: 5px; /* 둥근 테두리 설정 */
}

</style>
<script type="text/javascript"></script>
</head>
<body>
	
	<%@ include file="../header.jsp"%>
	<div id="total">
		<div id="center">
			<br> <br>
			<hr color="green">
			<form action="insert">
				<table border="1" class="table table-hover">
					<!-- <tr class="table-warning">
					<td width="200">카테고리</td>
					<td width="300"><input name="bbs_cate"></td>
				</tr> -->
					<td width="200">카테고리</td>
					<td width="300"><select name="bbs_cate">
							<option value="잡담">잡담</option>
							<option value="질문">질문</option>
							<option value="조언">조언</option>
							<!-- 여기에 필요한 다른 카테고리 옵션들을 추가할 수 있습니다. -->
					</select></td>
					<tr class="table-warning">
						<td width="200">제목</td>
						<td width="300"><input name="bbs_title"></td>
					</tr>
					<tr class="table-warning">
						<td width="200">내용</td>
						<td width="300"><textarea name="bbs_content" rows="10"
								cols="40"></textarea></td>
					</tr>
					<tr class="table-warning" hidden>
						<td width="200">작성자</td>
						<td width="300"><input name="bbs_writer"
							value="${sessionScope.loginId}"></td>
					</tr>



					<tr class="table-warning">
						<td width="200">이미지 첨부</td>
						<td width="300"><input type="file" name="bbs_image">
						</td>
					</tr>


					
					<!-- a태그? 팝업태그? -->



					<tr class="table-primary">
						<td colspan="2" width="200">
							<button type="submit" class="btn btn-primary" id="b1">글쓰기</button>
						</td>
					</tr>
				</table>
			</form>
			
		</div>

	</div>
</body>
</html>