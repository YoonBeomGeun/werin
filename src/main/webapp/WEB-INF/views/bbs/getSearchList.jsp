<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>검색 결과</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bbs.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
        /* $(function() {
            $(".pages").click(function() {
                var page = $(this).text();
                var type = $("select[name=type]").val();
                var keyword = $("input[name=keyword]").val();

                $.ajax({
                    type: 'GET',
                    url: "getSearchList",
                    data: {
                        page: page,
                        type: type,
                        keyword: keyword
                    },
                    success: function(result) {
                        updateTable(result);
                    }
                });
            });

            function getSearchList() {
                $.ajax({
                    type: 'GET',
                    url: "getSearchList",
                    data: $("form[name=search-form]").serialize(),
                    success: function(result) {
                        updateTable(result);
                    }
                });
            }

            function updateTable(result) {
                $('#result > table > tbody').empty();
                if (result.length >= 1) {
                    result.forEach(function(item) {
                        var str = '<tr>';
                        str += "<td>" + item.num_id + "</td>";
                        str += "<td>" + item.bbs_cate + "</td>";
                        str += "<td><a href='/bbs/bbs2?bbs_id=" + item.bbs_id + "'>" + item.bbs_title + "</a></td>";
                        str += "<td>" + item.bbs_content + "</td>";
                        str += "<td width=200>" + item.bbs_writer + "</td>";
                        str += "<td width=200>" + item.bbs_like + "</td>";
                        str += "</tr>";
                        $('#result > table > tbody').append(str);
                    });
                }
            }
        }); */
        $(function() {
            $(".pages").click(function() {
                var page = $(this).text();
                var type = $("select[name=type]").val();
                var keyword = $("input[name=keyword]").val();

                $.ajax({
                    type: 'GET',
                    url: "getSearchList",
                    data: {
                        page: page,
                        type: type,
                        keyword: keyword
                    },
                    success: function(result) {
                        updateTable(result);
                    }
                });
            });

            function getSearchList() {
                $.ajax({
                    type: 'GET',
                    url: "getSearchList",
                    data: $("form[name=search-form]").serialize(),
                    success: function(result) {
                        updateTable(result);
                    }
                });
            }

            function updateTable(result) {
                $('#result > table > tbody').empty();

                // result가 배열인지 확인
                if (Array.isArray(result)) {
                    if (result.length >= 1) {
                        result.forEach(function (item) {
                            var str = '<tr>';
                            str += "<td>" + item.num_id + "</td>";
                            str += "<td>" + item.bbs_cate + "</td>";
                            str += "<td><a href='/bbs/bbs2?bbs_id=" + item.bbs_id + "'>" + item.bbs_title + "</a></td>";
                            str += "<td>" + item.bbs_content + "</td>";
                            str += "<td width=200>" + item.bbs_writer + "</td>";
                            str += "<td width=200>" + item.bbs_like + "</td>";
                            str += "</tr>";
                            $('#result > table > tbody').append(str);
                        });
                    }
                } else {
                    // result가 배열이 아닌 경우에 대한 처리 (예: 오류 처리)
                    console.error("Result is not an array:", result);
                }
            }
        });
    </script>
</head>
<body>
    <div id="result">
        <table border="1" class="table table-bordered table tabel-hover">
            <tr bgcolor="lime">
                <td width=70>행번호</td>
                <td width=90>카테고리</td>
                <td width=200>제목</td>
                <td>내용</td>
                <td>작성자</td>
                <td>추천수</td>
            </tr>
            <!-- 검색 결과가 동적으로 추가될 곳 -->
        </table>
    </div>
</body>
</html>