<%@page import="java.util.List"%>
<%@page import="com.multi.werin.gowith.GowithcmtVO"%>
<%@page import="com.multi.werin.gowith.GowithVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	GowithVO vo = (GowithVO)request.getAttribute("vo");
	List<GowithcmtVO> list = (List<GowithcmtVO>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<style type="text/css">
	h1 {
		margin-left: 300px;
		margin-top: 112px;
	}
	
	.info {
		color: #007700;
	}
	
	.schedule {
		background: lightgray;
		width: 500px;
		height: 300px;
		display: flex;
		margin: 0 auto;
	}
	
	.edit button {
		font-size: 17px;
		border-radius:10px;
		width: 70px;
		height: 50px;
		color:white;
	}
	
	.write {
		margin-left: 300px;
		position: fixed;
		bottom: 0%;
		width: 1400px;
		height: 70px;
		background: lightgray;
		border-radius: 15px;
	}
	
	.write button {
		font-size: 17px;
		border-radius:10px;
		width: 70px;
		height: 50px;
		color:white;
	}
	
	.comment {
		width: 1000px;
		height: relative;
		padding: 10px;
		border-radius: 20px;
		background: lightgray;
		margin-bottom: 15px;
	}
	
</style>

<script type="text/javascript">
	$(function() {
	    // 댓글 달기
	    $("#b1").click(function() {
	    	var currentDate = new Date();
		    var formattedDate = currentDate.toLocaleString();
		
		    $.ajax({
		    	url: "insertCmt",
				data: {
					gowith_id: <%=vo.getGowith_id()%>,
					gowithcmt_content: $("#comment").val(),
					gowithcmt_writer: "<%=vo.getGowith_writer()%>",
					gowithcmt_created_at: formattedDate,
					gowithcmt_updated_at: formattedDate
				},
				dataType: "json",
		        success: function(response) {
		            alert("댓글이 성공적으로 등록되었습니다.");
		            console.log(response);
		            var newComment = '<div class="comment" id="comment_' + response.gowithcmt_id + '">';
		            newComment += '<span style="font-weight: bold;">' + response.gowithcmt_writer + '<br>' + response.gowithcmt_updated_at + '</span><br><br>';
		            newComment += '<div class="comment-content" id="content_' + response.gowithcmt_id + '">';
		            newComment += response.gowithcmt_content;
		            newComment += '</div><br>';
		            newComment += '<div class="comment-actions">'
		            newComment += '<button class="b2" data-comment-id="' + response.gowithcmt_id + '">수정</button>';
		            newComment += '<button class="b3" data-comment-id="' + response.gowithcmt_id + '">삭제</button>';
		            newComment += '</div>';
		            newComment += '</div>';
		            $("#result").append(newComment);
		            location.reload();
		            /* $("#comment").val("");
		            $("#comment").attr("placeholder", "댓글을 입력하세요."); */ // comment의 placeholder 속성을 설정함.
		        },
		        error: function(error) {
		            alert("댓글 등록에 실패하였습니다.");
		        }
		    })
	    })
	    
	    // 댓글 수정 및 삭제 버튼 클릭 시
	    $(document).on("click", ".b2, .b3", function() {
            // 댓글 ID 가져오기
            var commentId = $(this).attr("data-comment-id");

            if ($(this).hasClass("b2")) {
                // 댓글 수정 버튼 클릭 시
                // 현재 댓글 내용 가져오기
                var currentContent = $("#content_" + commentId).text().trim();

                // 동적으로 수정 폼 생성
                var editForm = '<input type="text" id="editComment_' + commentId + '" value="' + currentContent + '">';
                editForm += '<button class="editBtn" data-comment-id="' + commentId + '">수정 완료</button>';

                // 수정 폼 삽입
                $("#content_" + commentId).html(editForm);
            } else if ($(this).hasClass("b3")) {
                // 댓글 삭제 버튼 클릭 시
                if (confirm("댓글을 삭제하시겠습니까?")) {
                    $.ajax({
                        url: "deleteCmt",
                        method: "POST",
                        data: {
                            gowith_id: <%=vo.getGowith_id()%>,
                            gowithcmt_id: commentId
                        },
                        success: function(response) {
                            alert("삭제 완료");
                         // 삭제된 댓글 숨기기
                            $("#comment_" + commentId).slideUp();
                        }
                    });
                }
            }
        });
	    
	    //댓글 수정 완료 클릭 시
	    $(document).on("click", ".editBtn", function() {
			var commentId = $(this).attr("data-comment-id");
			var editedContent = $("#editComment_" + commentId).val();
			var currentDate = new Date();
		    var formattedDate = currentDate.toLocaleString();
			
			$.ajax({
				url: "updateCmt",
				method: "POST",
				data: {
					gowith_id: <%=vo.getGowith_id()%>,
					gowithcmt_id: commentId,
					gowithcmt_content: editedContent,
					gowithcmt_writer: "<%=vo.getGowith_writer()%>"
				},
				success: function(response) {
					alert("수정 성공!");
					if(editedContent.trim() === "") {
						editedContent = "댓글이 지워졌습니다.";
					} else {
						editedContent = editedContent.trim();
					}
					$("#time").html(formattedDate);
					$("#content_" + commentId).html(editedContent);
					location.reload();
				}
			})
		})
		
	})
</script>
</head>
<body>
	<jsp:include page="/header.jsp"></jsp:include>
	<h1 style="margin-top:50px;"><%= vo.getGowith_title()%></h1>
	<p style="margin-left:300px; font-weight: bold;">작성자: <%= vo.getGowith_writer()%></p>
	<table class="info" style="margin-left:300px; text-align: center;">
		<tr>
			<td>조회수</td>
			<td>I 메세지</td>
			<td>I 댓글</td>
		</tr>
		<tr>
			<td><%=vo.getGowith_view()%></td>
			<td> 0</td>
			<td> 0</td>
		</tr>
	</table>
	<button style="margin-right:300px; background:#FF5555; color:white; width:70px; height:50px; border-radius:10px; float:right; font-size: 17px;">좋아요</button>
	<h3 style="text-align:center; margin-top:50px;">여행 일정</h3>
	<div class="schedule">
		여행 일정 들어오기
	</div>
	<h2 style="margin-left:300px; margin-top:30px;">내용</h2>
	<p style="margin-left:300px;"><%= vo.getGowith_content()%></p>
	<div class="edit" style="text-align: right; margin-right: 300px;">
		<a href="insertChat.jsp?gowith_id=<%=vo.getGowith_id()%>&room_name=<%=vo.getGowith_title()%>"><button style="background:#33CC99;">채팅하기</button></a>
		<!-- 세션으로 현재 로그인한 사람 정보 추가 -->
		<a href="update?gowith_id=<%=vo.getGowith_id()%>"><button style="background:#33CC99;">수정</button></a>
		<a href="deleteConfirmed?gowith_id=<%=vo.getGowith_id()%>"><button style="background:#FF5555;">삭제</button></a>
	</div>
	<br>
	<hr color="green">
	<div style="margin-left:300px; margin-top:30px; height: 100%;">
		<h2>댓글</h2>
		<!-- if문 추가 -->
		<div id="result">
			<%
				if(list.size()>=1) {
	            	for (GowithcmtVO vo2 : list) {
	        %>
		            <div class="comment" id="comment_<%=vo2.getGowithcmt_id()%>">
		            	<span style="font-weight: bold;"><%= vo2.getGowithcmt_writer() %></span><br><span style="font-weight: bold;" id="time"><%= vo2.getGowithcmt_updated_at() %></span><br><br>
		                <div class="comment-content" id="content_<%=vo2.getGowithcmt_id()%>">
		                    <%=vo2.getGowithcmt_content()%>
		                </div><br>
		                <div class="comment-actions">
		                    <button class="b2" data-comment-id="<%=vo2.getGowithcmt_id()%>">수정</button>
		                    <button class="b3" data-comment-id="<%=vo2.getGowithcmt_id()%>">삭제</button>
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
	        %>
		</div>
	</div>
	<div style="height:100px;"></div>
	<div class="write">
    	<textarea id="comment" rows="4" cols="170" placeholder="댓글을 입력하세요."></textarea>
    	<button id="b1" style="background: #33CC99;">입력</button>
	</div>
</body>
</html>