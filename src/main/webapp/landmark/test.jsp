<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>제주 랜드마크</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

<h2>제주 랜드마크</h2>

<table id="landmarksTable">
    <thead>
        <tr>
            <th>이름</th>
            <th>주소</th>
            <th>이미지</th>
        </tr>
    </thead>
    <tbody>
        <!-- 테이블 본문은 동적으로 채워집니다 -->
    </tbody>
</table>

<script>
    $(document).ready(function() {
        // 서버에서 데이터를 가져오기 위한 Ajax 요청
        $.ajax({
            type: "GET",
            url: "YourControllerServletURL", // 실제로 사용하는 컨트롤러의 URL로 대체
            success: function(data) {
                // 받은 JSON 데이터를 순회하며 테이블에 데이터를 추가
                $.each(data.response.body.items.item, function(index, item) {
                    var row = "<tr>" +
                        "<td>" + item.title + "</td>" +
                        "<td>" + item.addr1 + "</td>" +
                        "<td><img src='" + item.firstimage + "' alt='" + item.title + "' width='100'></td>" +
                        "</tr>";

                    $("#landmarksTable tbody").append(row);
                });
            },
            error: function() {
                alert("서버에서 데이터를 가져오는 중 오류가 발생했습니다.");
            }
        });
    });
</script>

</body>
</html>