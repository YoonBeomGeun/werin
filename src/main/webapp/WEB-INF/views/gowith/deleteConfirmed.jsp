<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>	
	var k = confirm("정말 삭제하시겠습니까?");
	if(k) {
		location.href="delete?gowith_id=" + ${gowith_id};
	} else {
		alert("삭제를 취소합니다.")
		history.back();
	}
</script>