<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="table">
			<table border="1">
				<thead>
					<tr>
						<th id="top" width="10%">번호</th>
						<th id="top" width="10%">카테고리</th>
						<th id="top" width="20%">제목</th>
						<th id="top" width="40%">내용</th>
						<th id="top" width="10%">작성자</th>
						<th id="top" width="10%">추천수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="vo">
						<tr>
							<td>${vo.bbs_id}</td>
							<td>${vo.bbs_cate}</td>
							<td style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;"><a href="bbs2?bbs_id=${vo.bbs_id}">${vo.bbs_title}</a></td>
							<td>${vo.bbs_content}</td>
							<td>${vo.bbs_writer}</td>
							<td>${vo.bbs_total_like}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>