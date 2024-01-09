<%@page import="com.google.gson.Gson"%>
<%@page import="org.springframework.web.context.annotation.RequestScope"%>
<%@page import="com.multi.werin.gowith.GowithcmtVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int result = (int)request.getAttribute("result");
	List<GowithcmtVO> list = (List<GowithcmtVO>)request.getAttribute("list");
	if(result == 1) {
		GowithcmtVO gowithcmtVO = (GowithcmtVO)request.getAttribute("gowithcmtVO");
		Gson gson = new Gson();
        String jsonComment = gson.toJson(gowithcmtVO);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonComment);
	}
%>
<%-- 
<%
	if(list.size()>=1) {
   	for (GowithcmtVO vo2 : list) {
%>
    <div class="comment" id="comment_<%=vo2.getGowith_id()%>">
    	<span style="font-weight: bold;"><%=vo2.getGowithcmt_writer()%><br><%=vo2.getGowithcmt_updated_at()%></span><br><br>
        <div class="comment-content" id="content_<%=vo2.getGowithcmt_id()%>">
            <%=vo2.getGowithcmt_content()%>
        </div><br>
        <div class="comment-actions">
            <button class="" data-comment-id="<%=vo2.getGowithcmt_id()%>">수정</button>
            <button class="" data-comment-id="<%=vo2.getGowithcmt_id()%>">삭제</button>
        </div>
    </div>
<%
	   	}
	}
    else {
%>
	<p style="margin-left: 650px;">등록된 댓글이 없습니다.</p>
<%
   }
%> --%>