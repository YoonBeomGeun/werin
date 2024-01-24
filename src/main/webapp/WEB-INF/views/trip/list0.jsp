<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h3>여행게시글 목록</h3>
        <table>
            <thead>
                <tr>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성날짜</th>
                    <th>조회수</th>
                    <th>추천</th>
                </tr>
            </thead>
            <tbody>
                <!-- 여행게시글 목록을 반복하고 각 행을 표시 -->
                <c:forEach items="${list}" var="post" >
                    <tr>
                        <td><a href="one?trip_id=${post.trip_id}">${post.trip_title}</a></td>
                        <td>${post.trip_writer}</td>
                        <td>${post.trip_writedate}</td>
                        <td>${post.trip_count}</td>
                        <td>${post.trip_like}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table> --%>