
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <jsp:useBean id="postVO" class="com.multi.mini7.PostVO"></jsp:useBean>
<jsp:setProperty property="*" name="postVO"/> --%>

<%
	/* PostDAO dao = new PostDAO();
	int result = dao.updatePost(postVO); */
	int result = (int)request.getAttribute("result");
	if(result == 1){
 %>
 		<script>
 			alert('수정성공@@@');
 			location.href='list2?page=1';
 		</script>
 <%
 	}else{
 %>	
 		<script>
 			alert('수정실패@@@');
 			location.href='list2?page=1';
 		</script>
 <%	} %>