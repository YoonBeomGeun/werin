<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.multi.werin.trip.TripVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    TripVO bag = (TripVO)request.getAttribute("vo");
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String formattedDate = dateFormat.format(bag.getTrip_writedate());
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행기 상세 정보</title>
    <%@ include file="../../../header.jsp" %>
     <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h3 {
            color: #3498db;
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
            background-color: #e74c3c;
        }

        .update-btn {
            background-color: #3498db;
            margin-right: 150px;
        }

        .return-btn {
            background-color: #2ecc71;
        }

        .like-btn {
            background-color: #27ae60;
            margin-right: 220px;
        }

    </style>
</head>
<body>
    <div class="container">
        <h3>여행기 상세 정보</h3>
        <div>
            <p><strong>제목:</strong> ${vo.trip_title}</p>
            <p><strong>작성 날짜:</strong> <%= formattedDate %></p>
            <p><strong>조회수:</strong> ${vo.trip_count}</p>
            <p><strong>추천:</strong> ${vo.trip_like}</p>
            <p><strong>작성자:</strong> ${vo.trip_writer}</p>
            <p><strong>내용:</strong> ${vo.trip_content}</p>
        </div>
        <button class="remove-btn" onclick="remove()">삭제</button>
        <button class="update-btn" onclick="update()">수정</button>
        <button class="like-btn" onclick="like()" id = "like">추천 ${vo.trip_like}</button>
        <a href="${pageContext.request.contextPath}/trip/list"><button class="return-btn">돌아가기</button></a>
        
        
        <a href = "${pageContext.request.contextPath}/trip/list"><button>돌아가기</button></a>

        <script>
            function remove() {
                if (confirm("게시글을 삭제하시겠습니까?")) {
                    location.href = "remove?trip_id=<%=bag.getTrip_id()%>";           
                } 
            }

            function update() {
                if (confirm("게시글을 수정하시겠습니까?")) {
                    location.href = "update?trip_id=<%=bag.getTrip_id()%>";           
                } 
            }
            
        /*     function like() {
                // 추천 동작 처리 (AJAX 등을 사용하여 서버에 전송)
                $(function()){
                	$("#like").click(function() {
                		//1. 로그인 여부 확인
                		if(){ // 로그인 X일 경우
                		 alert ("로그인 후 추천할 수 있습니다")
                		}
                		else{
                			
                    		if(){//2. 추천을 이미 눌렀다면 다시 눌렀을 때 추천 수 -1
                    			let like = ${vo.trip_like} - 1;
                    		}
                    		else{//3. 추천을 누르지 않은 상태라면 추천 + 1
                    			let like = ${vo.trip_like} + 1;
                    		}
                		}
                		
                		
                		
					})
                }
                alert("게시글을 추천했습니다.");
            } */

           function like(){
            	$.ajax({
            		type: 'POST',
                    url: '${pageContext.request.contextPath}/trip/one',
                    success: function(result){
                    	
                    }
            	})
            }
                
                
            
        </script>
    </div>
</body>
</html>
