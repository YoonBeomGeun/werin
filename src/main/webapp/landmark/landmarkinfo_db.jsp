<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
    <script type="text/javascript">
        $(function() {

            $('#b1').click(function () { // api java로 불러서 db에 집어넣고 결과 표시
                $.ajax({
                    url: "LandmarkInfo",
                    
                    success: function (x) {
                        console.log(x);
                        $(".result").html(x);
                    } // success
                }); // ajax
            }); // b1
            
            $('#b2').click(function () { 
                $.ajax({
                    url: "jejulist", // 수정 예정
                    success: function (x) {
                        console.log(x);
                        $(".result").html(x);
                    } // success
                }); // ajax
            }); // b2
            

            $('#b4').click(function () { 
                $.ajax({
                    url: "jejulist",
                    success: function (x) {
                        console.log(x);
                        $(".result").html(x);
                    } // success
                }); // ajax
            }); // b4

        });
    </script>
    <style type="text/css">
        #b1, #b2, #b3, #b4 {
            display: inline-block; 
            padding: 10px 20px;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
            border: 2px solid #3498db;
            color: #3498db;
            background-color: white;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }
    </style>
    <%@ include file="../header.jsp"%>
</head>
<body>

    <div>
       <button id="b1" data="" >db에 집어넣기1</button>
        <a id="b2"><button>db에 집어넣기2</button></a>
        <a id="b3"><button>db삭제하기</button></a>
        <a id="b4"><button>db 리스트 보기</button></a>
    </div>
    <hr>
    <div class="result"></div>
</body>
</html>