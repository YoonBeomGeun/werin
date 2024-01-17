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
                // API URL 및 키 정의
                var apiUrl = "http://apis.data.go.kr/B551011/KorService1/detailCommon1";
                var apiKey = "gRjisabrZIfabIjre8qnZIy4ig724PgKzbxWE5KdbOHL4SD%2FneKsnNw2phKHIowgD5NXuBRaTpMEvSAY2uTA1Q%3D%3D";

                // 파라미터 정의
                var params = {
                    ServiceKey: apiKey,
                    contentTypeId: '39',
                    contentId: '2850913',
                    MobileOS: 'ETC',
                    MobileApp: 'AppTest',
                    defaultYN: 'Y',
                    firstImageYN: 'Y',
                    areacodeYN: 'Y',
                    catcodeYN: 'Y',
                    addrinfoYN: 'Y',
                    mapinfoYN: 'Y',
                    overviewYN: 'Y'
                };

                // AJAX 요청
                $.ajax({
                    url: apiUrl,
                    method: "GET",
                    data: params,
                    dataType: "xml",
                    success: function (data) {
                        // homepage와 overview를 저장할 변수 초기화
                        var homepage = "";
                        var overview = "";

                        // XML 데이터를 탐색하며 필요한 정보 추출
                        function extractInfo(node) {
                            if (node.nodeType === 1) {
                                // Element 노드인 경우
                                if (node.nodeName === "homepage") {
                                    homepage = node.textContent.trim();
                                } else if (node.nodeName === "overview") {
                                    overview = node.textContent.trim();
                                } else {
                                    // 다른 요소들에 대한 처리
                                    for (var i = 0; i < node.childNodes.length; i++) {
                                        extractInfo(node.childNodes[i]);
                                    }
                                }
                            }
                        }

                        // XML 데이터를 브라우저에 표시
                        extractInfo(data.documentElement);

                        // homepage와 overview를 출력 또는 활용하도록 코드를 작성
                        console.log("Homepage:", homepage);
                        console.log("Overview:", overview);

                        // 아래와 같이 .result에 표시할 수 있습니다.
                        $(".result").html("<p>Homepage: " + homepage + "</p><p>Overview: " + overview + "</p>");

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