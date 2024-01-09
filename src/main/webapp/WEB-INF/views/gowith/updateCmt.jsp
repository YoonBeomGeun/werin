<%@page import="com.multi.werin.gowith.GowithcmtVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    int result = (int) request.getAttribute("result");

    // 만약 result가 1이면 아래의 내용을 실행
    if(result == 1) {
        // commentVO 객체를 가져오거나 초기화합니다. 이미 초기화된 경우 생략 가능
        GowithcmtVO gowithcmtVO = (GowithcmtVO)request.getAttribute("gowithcmtVO");

        // 디버깅 메시지 추가
        System.out.println("gowithcmtVO: " + gowithcmtVO);

        // commentVO가 null이 아니면서 content가 null이 아닌 경우에 수정 로직 실행
        if (gowithcmtVO != null && gowithcmtVO.getGowithcmt_content() != null) {
%>
        - ${gowithcmtVO.gowith_id}, ${gowithcmtVO.gowithcmt_content}, ${gowithcmtVO.gowithcmt_writer}<br>
<%
        } else {
            System.out.println("commentVO가 null이거나 content가 null입니다.");
        }
    } else {
        System.out.println("오류");
    }
%>