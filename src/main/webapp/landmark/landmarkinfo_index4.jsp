<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
    <script type="text/javascript">
        $(function() {

            $('#b1').click(function () { // api java로 가져오기
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
                    url: "jejulist",
                    success: function (x) {
                        console.log(x);
                        $(".result").html(x);
                    } // success
                }); // ajax
            }); // b2

            $('#b3').click(function () {
                // API URL 정의
                var apiKey = "gRjisabrZIfabIjre8qnZIy4ig724PgKzbxWE5KdbOHL4SD%2FneKsnNw2phKHIowgD5NXuBRaTpMEvSAY2uTA1Q%3D%3D";
                var numOfRows = 10;
                var pageNo = 1;

                var apiUrl = "https://apis.data.go.kr/B551011/KorService1/"
                        + "areaBasedList1?"
                        + "MobileOS=ETC&MobileApp=Test"
                        + "&ServiceKey=" + apiKey
                        + "&listYN=Y&arrange=A&contentTypeId=&areaCode=39&sigunguCode=&cat1=&cat2=&cat3="
                        + "&_type=json&pageNo=" + pageNo + "&numOfRows=" + numOfRows;

                
                
                
                // AJAX 요청
                $.ajax({
                    url: apiUrl,
                    method: "GET",
                    dataType: "json",
                    success: function (data) {
                        console.log(data);

                        // 테이블 생성
                        var table = $('<table>').attr('border', '1');

                        // 테이블 헤더 생성
                        var headerRow = $('<tr>');
                        headerRow.append($('<th>').text('Title'));
                        headerRow.append($('<th>').text('Image'));
                        headerRow.append($('<th>').text('MapX'));
                        headerRow.append($('<th>').text('MapY'));
                        table.append(headerRow);

                        // 테이블 행 생성
                        $.each(data.response.body.items.item, function(index, item) {
                            var row = $('<tr>');
                            // 필요한 데이터만 표시
                            row.append($('<td>').text(item.title));
                            row.append($('<td>').append($('<img>').attr('src', item.firstimage).css('max-width', '100px')));
                            row.append($('<td>').text(item.mapx));
                            row.append($('<td>').text(item.mapy));
                            table.append(row);
                        });

                        // 결과 div에 테이블 추가
                        $(".result").html(table);
                    },
                    error: function (xhr, status, error) {
                        console.error("에러:", error);
                    }
                });
            });

        });
    </script>
    <style type="text/css">
        #b1, #b2, #b3 {
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
        <a id="b1"><button>상세페이지</button></a>
        <a id="b2"><button>목록부르기</button></a>
        <a id="b3"><button>api부르기</button></a>
    </div>
    <hr>
    <div class="result"></div>
</body>
</html>