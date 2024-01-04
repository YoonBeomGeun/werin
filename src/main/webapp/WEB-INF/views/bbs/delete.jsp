<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int result = (int)request.getAttribute("result");
	if(result == 1){
 %>
 		<script>
 		var k;	
 		k = confirm("정말 삭제하시겠습니까?");
 		if(k) {
 			alert("삭제되었습니다.")
 			location.href='bbs?page=1';
 		} else {
 			alert("삭제를 취소합니다.")
 			location.href='bbs?page=1';
 		}
 			
 		</script>
 <%
 	}else{
 %>	
 		<script>
 			alert('삭제실패@@@');
 			location.href='bbs?page=1';
 		</script>
 <%	} %>