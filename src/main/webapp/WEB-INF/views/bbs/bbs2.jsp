
<%@page import="com.multi.werin.bbs.BbslikeVO"%>
<%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@page import="com.multi.werin.bbs.BbscmtVO"%>
<%@page import="com.multi.werin.bbs.BbsVO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.multi.werin.bbs.BbsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    <%
    BbsVO bag = (BbsVO)request.getAttribute("bag");
    List<BbscmtVO> list = (List<BbscmtVO>)request.getAttribute("list");
    BbslikeVO bag2 = (BbslikeVO)request.getAttribute("vo2");
    %>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script type="text/javascript" src="resources/js/jquery-3.7.1.js"></script> -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<style type="text/css">
        body {
            
            font-family: Arial, sans-serif;
        }

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
            border-radius: 10px;
            width: 70px;
            height: 50px;
            color: white;
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
            border-radius: 10px;
            width: 70px;
            height: 50px;
            color: white;
        }

        .comment {
            width: 1000px;
            height: relative;
            padding: 10px;
            border-radius: 20px;
            background: lightgray;
            margin: 0 auto; /* 가운데 정렬을 위한 margin 속성(의미없음) */
            margin-bottom: 15px;
        }
        

    .container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
    }

    .table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background-color: #fff;
        
    }
	
	.table-content{
	width: 300px;
	height: 300px;
	}
    .table th, .table td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: left;
    }

    .table th {
        background-color: #4CAF50;
        color: white;
    }

    .table tr:hover {
        background-color: #f5f5f5;
    }

    .text-center {
        text-align: center;
    }

    .btn {
        display: inline-block;
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
        text-align: center;
        text-decoration: none;
        outline: none;
        color: #fff;
        background-color: #007BFF;
        border: none;
        border-radius: 5px;
        box-shadow: 0 4px #0056b3;
    }

    .btn:hover {
        background-color: #0056b3;
    }
    .button {
    text-align: center;
}
    .center-buttons {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 20px;
    }

    .center-buttons .btn {
        margin: 0 auto;
    }
    .like-btn {
            background-color: #27ae60;
            margin-left: 220px;
     }
        .dislike-btn{
       		 background-color: red;
            margin-right: 220px;
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
					bbs_id: <%=bag.getBbs_id()%>,
					bbscmt_content: $("#comment").val(),
					bbscmt_writer: "${sessionScope.loginId}",
					bbscmt_created_at: formattedDate,
					bbscmt_updated_at: formattedDate
				},
				dataType: "json",
		        success: function(response) {
		            alert("댓글이 성공적으로 등록되었습니다.");
		            console.log(response);
		            var newComment = '<div class="comment" id="comment_' + response.bbscmt_id + '">';
		            newComment += '<span style="font-weight: bold;">' + response.bbscmt_writer + '<br>' + response.bbscmt_updated_at + '</span><br><br>';
		            newComment += '<div class="comment-content" id="content_' + response.bbscmt_id + '">';
		            newComment += response.bbscmt_content;
		            newComment += '</div><br>';
		            newComment += '<div class="comment-actions">'
		            newComment += '<button class="b2" data-comment-id="' + response.bbscmt_id + '">수정</button>';
		            newComment += '<button class="b3" data-comment-id="' + response.bbscmt_id + '">삭제</button>';
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
                            bbs_id: <%=bag.getBbs_id()%>,
                            bbscmt_id: commentId
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
					bbs_id: <%=bag.getBbs_id()%>,
					bbscmt_id: commentId,
					bbscmt_content: editedContent,
					bbscmt_writer: "<%=bag.getBbs_writer()%>"
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
	
	
$(function() {
	$('#like').click(function() {
		$.ajax({
	 		type: 'POST',
	         url: "updateLike",
	         data:{
	         	bbs_id : <%=bag.getBbs_id()%>,
	         	
	         	bbs_total_like : ${bag.bbs_total_like}
	
				},	
				
	         success: function(result){
	        	 console.log(result);
	         	$('.spTotalLike').text(result)
	        	 location.reload();
	         }
	 	})
	})
		
	$('#dislike').click(function() {
		$.ajax({
			type: 'POST',
			url : "updateDislike",
			data :{
				bbs_id : <%=bag.getBbs_id()%>,
				bbs_total_like : ${bag.bbs_total_like}
			},
			success : function(result) {
				console.log(result);
				$('.spTotalLike').text(result)
				location.reload();
			}
		})
		
	})
})	


</script>
<script>
        
        
/* $('#notLogin').click(function(){
	alert("해당 기능은 로그인이 필요합니다.")
} */
            
		 function notLogin(){
        	alert("해당 기능은 로그인이 필요합니다.")
        }
        
        
        function likeCheck(){
        	console.log("likeCheck??????????");
        	if("${bag2.like_state}" == 1){
        		alert("이미 비추천을 누른 여행기입니다. 추천 시스템은 한 번만 가능합니다.")
        	}else{
        		alert("이미 추천을 누른 여행기입니다. 추천 시스템은 한 번만 가능합니다.")
        	}
        } 
            	
     

          
            
</script>
</head>
<body>
	<jsp:include page="/header.jsp"></jsp:include>
		
	<div class="container">
	<table class="table">
			<tr class="table-success">
				<td width = "10%">제목</td>
				<td><%= bag.getBbs_title() %> </td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><%= bag.getBbs_writer() %></td>
			</tr>
			<tr class="table-content">
				<td>내용</td>
				<td><%= bag.getBbs_content() %></td>
			</tr>
			
			<tr>
			
			<%-- <td colspan="2" class="text-center">
			 	<a href="update?bbs_id=<%=bag.getBbs_id()%>" ><button class="btn btn-primary">게시글 수정</button></a>
				<a href="delete2?bbs_id=<%=bag.getBbs_id()%>" ><button class="btn btn-danger">게시글 삭제</button></a>
			</td> --%>
			<% 
				if(session.getAttribute("loginId") != null){
				if(session.getAttribute("loginId").equals(bag.getBbs_writer())){
			%>
        		<!-- 현재 로그인한 사용자와 게시글 작성자가 일치하는 경우에만 버튼 표시 -->
        		<td colspan="2" class="text-center">
            		<a href="update?bbs_id=<%=bag.getBbs_id()%>" >
            			<button class="btn btn-primary">게시글 수정</button>
            		</a>
            		<a href="delete2?bbs_id=<%=bag.getBbs_id()%>" >
            			<button class="btn btn-danger">게시글 삭제</button>
            		</a>
        		</td>
   			<% }} %>
		</tr>
		</table>
	<div class=button>
	<c:choose>
        <c:when test="${empty loginId}">
	        <!-- 로그인 되어 있지 않은 경우 -->
	       
	        <button class="like-btn"  onclick = "notLogin()"> 추천 </button>
	        <span class="spTotalLike">${bag.bbs_total_like}</span>
	        <button class="dislike-btn" onclick ="notLogin()"> 비추천 </button>
    	</c:when>
    
	    <c:otherwise>
	        <!-- 로그인 되어 있는 경우 -->
	       
	        <c:if test = "${vo2.like_state == 0 || vo2.like_state == 1}"> 
	        <%-- <button>${bag2.like_state}</button> --%>
	        <!-- 추천,비추천을 이미 눌렀다면 0 추천, 1 비추천-->
	        <button class="like-btn"  onclick = "likeCheck()">추천</button>
	        <span class="spTotalLike">${bag.bbs_total_like}</span>
	        <button class="dislike-btn" onclick = "likeCheck()">비추천</button>
	        </c:if>
	        <c:if test = "${empty vo2}"> <!-- ajax에서 호출받은 vo2.likestate 값 다시 받아오는 방법 찾기 -->
	        <!-- 추천, 비추천을 누르지 않은 상태라면 -->
	         <button class="like-btn"  id = "like">추천2</button>
	        <span class="spTotalLike">${bag.bbs_total_like}</span>
	        <button class="dislike-btn" id="dislike">비추천</button>
	        </c:if>
	    </c:otherwise>
	</c:choose>
	
		</div>
		</div>
		
		<br>
	<hr color="green">
	<div style="margin-left:300px; margin-top:30px; height: 100%;">
		<h2>댓글</h2>
		<!-- if문 추가 -->
		<div id="result">
			<%
				if(list.size()>=1) {
	            	for (BbscmtVO vo2 : list) {
	            		if(vo2.getBbscmt_writer().equals(session.getAttribute("loginId"))) {
	        %>
	        			<div class="comment" id="comment_<%=vo2.getBbscmt_id()%>">
			            	<span style="font-weight: bold;"><%= vo2.getBbscmt_writer() %></span><br><span style="font-weight: bold;" id="time"><%= vo2.getBbscmt_updated_at() %></span><br><br>
			                <div class="comment-content" id="content_<%=vo2.getBbscmt_id()%>">
			                    <%=vo2.getBbscmt_content()%>
			                </div><br>
			                <div class="comment-actions">
			                    <button class="b2" data-comment-id="<%=vo2.getBbscmt_id()%>">수정</button>
			                    <button class="b3" data-comment-id="<%=vo2.getBbscmt_id()%>">삭제</button>
			                </div>
			            </div>
	        <%
	            		} else {
	        %>
	        			<div class="comment" id="comment_<%=vo2.getBbscmt_id()%>">
			            	<span style="font-weight: bold;"><%= vo2.getBbscmt_writer() %></span><br><span style="font-weight: bold;" id="time"><%= vo2.getBbscmt_updated_at() %></span><br><br>
			                <div class="comment-content" id="content_<%=vo2.getBbscmt_id()%>">
			                    <%=vo2.getBbscmt_content()%>
			                </div>
			            </div>
		<%
	            		}
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