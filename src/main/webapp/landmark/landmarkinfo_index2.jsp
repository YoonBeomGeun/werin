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
                    url: "LandmarkInfo2",
                    success: function (x) {
                        console.log(x);
                        $(".result").html(x);
                    } // success
                }); // ajax
            }); // b2

            $('#b3').click(function () {
                // Define your API URL
                var apiKey = "";
                var numOfRows = 10;
                var pageNo = 1;

                var apiUrl = "https://apis.data.go.kr/B551011/KorService1/"
                        + "areaBasedList1?"
                        + "MobileOS=ETC&MobileApp=Test"
                        + "&ServiceKey=" + apiKey
                        + "&listYN=Y&arrange=A&contentTypeId=&areaCode=39&sigunguCode=&cat1=A01&cat2=A0101&cat3=A01010400"
                        + "&_type=json&pageNo=" + pageNo + "&numOfRows=" + numOfRows;

                // Make AJAX request
                $.ajax({
                    url: apiUrl,
                    method: "GET",
                    dataType: "json",
                    success: function (data) {
                        console.log(data);

                        // Get the table
                        var table = $('<table>').attr('border', '1');

                        // Create table header
                        var headerRow = $('<tr>');
                        $.each(data.response.body.items.item[0], function(key, value) {
                            headerRow.append($('<th>').text(key));
                        });
                        table.append(headerRow);

                        // Create table rows
                        $.each(data.response.body.items.item, function(index, item) {
                            var row = $('<tr>');
                            $.each(item, function(key, value) {
                                row.append($('<td>').text(value));
                            });
                            table.append(row);
                        });

                        // Append the table to the result div
                        $(".result").html(table);
                    },
                    error: function (xhr, status, error) {
                        console.error("Error:", error);
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