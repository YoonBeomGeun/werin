<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" type="text/css" href="resources/css/member.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>     
	<script type="text/javascript">
	//jquery는 버튼하나당 함수하나!, 요청하나당 함수하나!
	//특정한 이벤트가 발생하기를 기다렸다가
	//이벤트가 발생하면 
	//자동으로  함수를 실행시켜주는 방식의 함수를 사용함.
	//콜백함수
	//body를 먼저 브라우저가 읽도록 하는 코드를 넣어주어야함.
	$(function() {
		
		$('#idChk').click(function() {
			$.ajax({
				type : "post", 
				url : "idChk",
				data : {"member_id" : $("#member_id").val()},
				dataType : "json",
				success : function(x){
					if(x == 1){
						alert("중복된 아이디입니다.");
					}else if(x == 0){
						$("#member_id").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		})
	})
	function fn_idChk(){
			
	}
	
	function passConfirm() {
			var password = document.getElementById('pw');	
			var password2 = document.getElementById('pw2');	
			var massage_on = document.getElementById('massage');
			
			if(pw.value == pw2.value){
				massage_on.style.color = "green";
				massage_on.textContent ="비밀번호가 일치합니다!!";
			}else{
				massage_on.style.color = "red";
				massage_on.textContent ="비밀번호가 불일치합니다. 다시 입력해주세요.";
			}
	}
</script>
</head>
<body>
 <%@ include file="../header.jsp" %>
	<div class="container">
    <h2>회원가입</h2>


<form action="insert">
ID : <input name="member_id" id="member_id">
<button class="idChk" type="button" id="idChk" >ID 중복확인</button><br>
비밀번호 :<input type="password" name="member_pw" id="pw"><br>
비밀번호 확인 : <input type="password" name="pw2" id="pw2" onkeyup="passConfirm()"> <span id ="massage"></span><br>
이름 : <input name="member_name"><br>
닉네임 : <input name="member_nickname"><br>
전화번호 : <input name="member_tel"><br>
이메일 : <input name="member_email"><br>
<div class="label-container">
성별 : <br>
      <input type="radio" name="member_gender" value="남자" id="male"><label for="male">남자</label>
      <input type="radio" name="member_gender" value="여자" id="female">
      <label for="female">여자</label><br>
</div>
<button type="submit">회원가입 신청</button>
</form>
</div>
</body>
</html>