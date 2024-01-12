<%@page import="com.multi.werin.trip.TripVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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

        .form-group {
            margin-bottom: 15px;
            overflow: hidden; /* Add this to clear floats */
        }
         input,
        select,
        textarea {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }
        
        textarea {
            height: 200px;
            resize: none;
        }
        </style>

<title>Insert title here</title>
<%@ include file="../../../header.jsp"%>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.7.1.js"></script>
<script type="text/javascript">
    $(function() {
        $('#update').click(function() {
            // FormData 객체를 사용하여 폼 데이터를 가져옴
            var formData = new FormData($('form')[0]);

            $.ajax({
                type: 'POST',
                url: "${pageContext.request.contextPath}/trip/update2",
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    alert("게시글이 수정되었습니다.");
                    // 서버에서 받은 응답(response)을 사용하여 필요한 작업 수행
                    // 예를 들어, 필요한 DOM 업데이트 등
                    $("#d1").html(response);
                },
                error: function(xhr, status, error) {
                    // 에러 처리
                    console.error(xhr.responseText);
                    alert("게시글 수정에 실패했습니다. 에러 메시지: " + xhr.responseText);
                }
            });

            // 기본 폼 제출 동작 방지
            return false;
        }); // update
    });
</script> --%>
 </head>
<body>
<div class="container">
        <h3>여행기 상세 정보</h3>
        <div>
        <form action = "${pageContext.request.contextPath}/trip/update2">
         <div class="form-group" id = "d1">
            <label for="trip_title">제목</label> 
            <input name = trip_title id = "trip_title" value = ${vo.trip_title}><br>
         </div>
         <div class="form-group">
            <label for="trip_content">내용</label>
            <textarea id = "trip_content" name = trip_content>${vo.trip_content}</textarea>
         </div>
            <input type = "hidden" name = "trip_id" value = ${vo.trip_id}>
        <button id = "update">수정</button>
        </form>
        <a href = "${pageContext.request.contextPath}/trip/list"><button>돌아가기</button></a>
        </div>
</div>
</body>
</html>