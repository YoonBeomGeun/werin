<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>일정 목록 보여주기</title>
    <style>
        table {
            border-collapse: collapse;
            width: 1000px;
            height: 500px;
        }

        #table {
            display: flex;
            justify-content: center;
        }

        body {
            text-align: center;
        }

        #top {
            padding: 10px;
            background-color: #FBB012;
        }

        #make {
            background: #FBB012;
            text-align: center;
            width: 120px;
            height: 40px;
            font: 15px 궁서 bold;
            color: white;
            border-radius: 10px;
            margin-bottom: 10px;
            display: inline-block;
            text-decoration: none;
            line-height: 40px;
            margin-right: 10px; /* 일정 만들기와의 간격을 조절 */
        }

        #make span, #make a {
            cursor: pointer;
            display: inline-block;
            width: 100%;
            height: 100%;
            text-decoration: none;
            color: white;
        }

        .filter-checkbox {
            display: inline-block;
            margin-top: 10px;
            margin-right: 10px;
        }
    </style>
    <script>
        function filterPlans() {
            var checkboxes = document.querySelectorAll('.filter-checkbox');
            var selectedTypes = Array.from(checkboxes)
                .filter(checkbox => checkbox.checked)
                .map(checkbox => checkbox.value);

            var rows = document.querySelectorAll('.plan-row');

            rows.forEach(row => {
                var type = row.getAttribute('data-type');
                if (selectedTypes.length === 0 || selectedTypes.includes(type)) {
                    row.style.display = 'table-row';
                } else {
                    row.style.display = 'none';
                }
            });
        }
    </script>
</head>
<body>
    <%@ include file="../../../header.jsp"%>

    <div id="select2">
        <div>
            <h1 style="display: inline-block; margin-top: 5px;">다른 이용자들의 일정 모아보기</h1>
            
            <div style="text-align:center; margin-top:-10px; font-size:17px;">
                <div class="filter-checkbox">
                    <label><input type="checkbox" class="filter-checkbox" value="alone" onchange="filterPlans()">혼자</label>
                </div>
                <div class="filter-checkbox">
                    <label><input type="checkbox" class="filter-checkbox" value="couple" onchange="filterPlans()">커플</label>
                </div>
                <div class="filter-checkbox">
                    <label><input type="checkbox" class="filter-checkbox" value="family" onchange="filterPlans()">가족</label>
                </div>
                <div class="filter-checkbox">
                    <label><input type="checkbox" class="filter-checkbox" value="group" onchange="filterPlans()">단체</label>
                </div>
                <div class="filter-checkbox">
                    <label><input type="checkbox" class="filter-checkbox" value="parents" onchange="filterPlans()">부모님</label>
                </div>
                <br><br>
                <button id="make">
                    <c:choose>
                        <c:when test="${empty sessionScope.loginId}">
                            <span onclick="alert('로그인이 필요합니다.');">일정 만들기</span>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/plan/plan.jsp">일정 만들기</a>
                        </c:otherwise>
                    </c:choose>
                </button>
                <button id="make">
                    <c:choose>
                        <c:when test="${empty sessionScope.loginId}">
                            <span onclick="alert('로그인이 필요합니다.');">나의 일정</span>
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/plan/planlist">나의 일정</a>
                        </c:otherwise>
                    </c:choose>
                </button>
            </div>
        </div>
        <div id="table">
            <table border="1">
                <thead>
                    <tr>
                        <th id="top">제목</th>
                        <th id="top">작성자</th>
                        <th id="top">여행날짜</th>
                        <th id="top">누구랑</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${planlist}" var="plan">
                        <tr class="plan-row" data-type="${plan.plan_with}">
                            <td><a href="${pageContext.request.contextPath}/plan/plan_detail?plan_no=${plan.plan_no}">${plan.plan_title}</a></td>
                            <td>${plan.plan_writer}</td>
                            <td>${plan.plan_start_date}~${plan.plan_end_date}</td>
                            <td>${plan.plan_with}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>