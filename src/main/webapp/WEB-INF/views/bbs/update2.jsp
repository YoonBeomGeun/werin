<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%    
	int result = (int)request.getAttribute("result");
	if(result == 1){
 %>
 		<script>
 			alert('수정성공@@@');
 			location.href='bbs?page=1';
 		</script>
 <%
 	}else{
 %>	
 		<script>
 			alert('수정실패@@@');
 			location.href='bbs?page=1';
 		</script>
 <%	} %>