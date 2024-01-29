<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.multi.werin.trip.TripLikeVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.multi.werin.trip.TripVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
    <title>여행기 상세 정보</title>
    <%@ include file="../../../header.jsp" %>
     <style>
       body {
            font-family: 'Arial', sans-serif;
            background-color: #ffffff;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        .info {
		color: #000000;
		text-align : center;
	}

        .container {
            max-width: 1200px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px #fbb012;
        }

        h1 {
            color: #000000;
            text-align : center;
        }

        div {
            margin-top: 20px;
        }

        p {
            font-size: 16px;
            margin-bottom: 10px;
        }
        

        strong {
            font-weight: bold;
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
            border: none;
            border-radius: 5px;
            color: #fff;
        }

        /* 버튼에 대한 클래스 스타일 지정 */
        .remove-btn {
            background-color: #FBB012;
        }

        .update-btn {
            background-color: #FBB012;
            margin-right: 150px;
        }

        .return-btn {
            background-color: #FBB012;
        }

        .like-btn {
            background-color: #27ae60;
            margin-left: 480px;
        }
        .dislike-btn{
            background-color: red;
            margin-right: 480px;
        }
        .login-btn{
            background-color: #FBB012;
        }

        .remove-btn:hover {
            background-color: gold; /* Hover 색상 변경 */
        }

        .update-btn:hover {
            background-color: gold; /* Hover 색상 변경 */
        }

        .return-btn:hover {
            background-color: gold; /* Hover 색상 변경 */
        }

        .like-btn:hover {
            background-color: #218c74; /* Hover 색상 변경 */
        }

        .dislike-btn:hover {
            background-color: #c0392b; /* Hover 색상 변경 */
        }

        .login-btn:hover {
            background-color: gold; /* Hover 색상 변경 */
        }

    </style>
    <%
    String member_id = (String)session.getAttribute("loginId");
    session.setAttribute("member_id", member_id);
    TripVO bag = (TripVO)request.getAttribute("vo");
    TripLikeVO vo2 = (TripLikeVO)request.getAttribute("vo2");
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String formattedDate = dateFormat.format(bag.getTrip_writedate());
%>
<script>
$(function() {
	$('#like').click(function() {
		$.ajax({
	 		type: 'POST',
	         url: "updateLike",
	         data:{
	         	trip_id : <%=bag.getTrip_id()%>,
	         	trip_total_like : ${vo.trip_total_like}
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
				trip_id : <%=bag.getTrip_id()%>,
				trip_total_like : ${vo.trip_total_like}
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
</head>
<body>
    <div class="container">
        <h1>${vo.trip_title}</h1>
        <div>
        	<hr>
            <p class="written-date"><strong>작성 날짜 :</strong><%=formattedDate %> </p>
            <hr>
            <p><strong>작성자 </strong>${vo.trip_writer}</p>
            <hr>
            
            <table class="info">
		<tr>
			<td><strong>조회수</strong></td>
                <td><strong>I 추천</strong></td>
		</tr>
		<tr>
			<td><strong>${vo.trip_count}</strong></td>
			<td><strong>&nbsp;<span class="spTotalLike">${vo.trip_total_like}</span></strong></td>
		</tr>
	</table>
	<hr><br><br>
        <p><strong>내용:</strong> ${vo.trip_content}</p>
        </div>
        <c:choose>
         <c:when test="${empty loginId}">
        <!-- 로그인 되어 있지 않은 경우 -->
        <button class = "login-btn" onclick="window.location.href='../member/login.jsp'">로그인</button><br>
        <button class="like-btn"  onclick = "notLogin()"> 추천 </button>
        <span class="spTotalLike">${vo.trip_total_like}</span>
        <button class="dislike-btn" onclick ="notLogin()"> 비추천 </button>
    </c:when>
    
    <c:otherwise>
        <!-- 로그인 id와 작성자 id가 같은 경우 -->
        <c:if test = "${vo.trip_writer == sessionScope.loginId}">
        <button class = "remove-btn" onclick="remove()">삭제</button>
        <button class="update-btn" onclick="update()">수정</button><br>
        </c:if>
        
        <!-- 추천,비추천을 이미 눌렀다면 0 추천, 1 비추천-->
        <c:if test = "${vo2.like_state == 0 || vo2.like_state == 1}">       
        <button class="like-btn"  onclick = "likeCheck()"> 추천 </button>
        <span class="spTotalLike">${vo.trip_total_like}</span>
        <button class="dislike-btn" onclick ="likeCheck()"> 비추천 </button>
        </c:if>
        <c:if test = "${empty vo2}"> <!-- ajax에서 호출받은 vo2.likestate 값 다시 받아오는 방법 찾기 -->
        <!-- 로그인 O // 추천, 비추천을 아직 누르지 않은 상태라면 -->
         <button class="like-btn"  id = "like"> 추천 </button>
        <span class="spTotalLike">${vo.trip_total_like}</span>
        <button class="dislike-btn" id="dislike"> 비추천 </button>
        </c:if>
    </c:otherwise>
	</c:choose>
        <a href="${pageContext.request.contextPath}/trip/list?page=1"><button class="return-btn">돌아가기</button></a>
        <c:set var="item1" value="${item2}"/>
        

        <script>
        
            function remove() {
            	
            	 if('${vo.trip_writer}' == '${sessionScope.loginId}'){
                	if (confirm("여행기를 삭제하시겠습니까?")) {
                    location.href = "remove?trip_id=<%=bag.getTrip_id()%>";           
                }  
            }else{
            	alert("여행기 삭제는 본인이 작성한 여행기에 대해서만 가능합니다.")
            }
            }
            
            function update() {
        		if('${vo.trip_writer}' == '${sessionScope.loginId}'){
                if (confirm("여행기를 수정하시겠습니까?")) {
                    location.href = "update?trip_id=<%=bag.getTrip_id()%>";           
                } 
            }
        		else{
        			alert("여행기 수정은 본인이 작성한 여행기에 대해서만 가능합니다.")
        		}
            }
            
            function notLogin(){
            	alert("해당 기능은 로그인이 필요합니다.")
            }
            
            
            function likeCheck(){
            	if("${vo2.like_state}" == 1){
            		alert("이미 비추천을 누른 여행기입니다. 추천 시스템은 한 번만 가능합니다.")
            	}else{
            		alert("이미 추천을 누른 여행기입니다. 추천 시스템은 한 번만 가능합니다.")
            	}
            }
            	
     

          
            
        </script>
    </div>
</body>
</html>
