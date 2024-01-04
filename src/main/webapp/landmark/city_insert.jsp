<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"></script>
<script type="text/javascript">
function validateForm() {
    // 입력 필드 값 가져오기
    var city = document.getElementsByName("city")[0].value;
    var country = document.getElementsByName("country")[0].value;

    // 유호성 검사
    if (city === '' || country === '') {
        alert('빈칸을 모두 채워주세요');
        return false; // 서버로의 전송을 막음
    }

    return true;
}
</script>
</head>

<body>
<%@ include file="../header.jsp" %>
<h3>도시 추가</h3>
<form action="city_insert" onsubmit="return validateForm();"> <!-- submit을 누르면 Controller가 city_insert를 찾아서 값 전달-->
도시 : <input name="city"><br>
국가 : <input name="country"><br>
<button id = "b1" type="submit">서버로 전송</button>
<hr style="color: red">
</form>
<a href = "landmark_index.jsp"><button>첫페이지로 돌아가기</button></a>
</body>
</html>