<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Travel Plans</title>
</head>
<body>
    <h2>Your Travel Plans</h2>

    <!-- 여행 일정이 있는 경우에만 처리 -->
    <c:if test="${not empty planlist}">
        <c:forEach var="plan" items="${planlist}">
            <div>
                <h3>${plan.plan_title}</h3>
                <p>Start Date: ${plan.plan_start_date}</p>
                <p>End Date: ${plan.plan_end_date}</p>
                <h4>Schedule</h4>
                <ul>
                    <c:forEach var="schedule" items="${plan.schedules}">
                        <li>${schedule.schedule_title} - ${schedule.schedule_day}</li>
                    </c:forEach>
                </ul>
            </div>
        </c:forEach>
    </c:if>

    <!-- 여행 일정이 없는 경우에 처리 -->
    <c:if test="${empty planlist}">
        <p>No travel plans found.</p>
    </c:if>

    <!-- 여행 일정을 서버에서 가져오는 AJAX 호출 -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script>
        // 페이지 로드 후 실행
        $(document).ready(function() {
            // AJAX를 통해 서버로부터 여행 일정 정보를 가져옴
            $.ajax({
                type: 'GET',
                url: '../plan/plan_detail',  // 실제 서버 URL로 변경 필요
                success: function(response) {
                    // 여행 일정 정보를 가져오면 화면에 표시
                    displayTravelPlans(response);
                },
                error: function(error) {
                    console.error(error);
                    alert('여행 일정을 가져오는데 실패했습니다.');
                }
            });

            // 여행 일정을 화면에 표시하는 함수
            function displayTravelPlans(travelPlans) {
                if (travelPlans.length > 0) {
                    // 가져온 여행 일정을 화면에 표시
                    for (var i = 0; i < travelPlans.length; i++) {
                        var plan = travelPlans[i];
                        var planDiv = $('<div>');
                        planDiv.append('<h3>' + plan.plan_title + '</h3>');
                        planDiv.append('<p>Start Date: ' + plan.plan_start_date + '</p>');
                        planDiv.append('<p>End Date: ' + plan.plan_end_date + '</p>');
                        planDiv.append('<h4>Schedule</h4>');
                        var scheduleList = $('<ul>');
                        for (var j = 0; j < plan.schedules.length; j++) {
                            var schedule = plan.schedules[j];
                            scheduleList.append('<li>' + schedule.schedule_title + ' - ' + schedule.schedule_day + '</li>');
                        }
                        planDiv.append(scheduleList);
                        planDiv.appendTo('body');
                    }
                } else {
                    // 여행 일정이 없을 경우 메시지 표시
                    $('<p>No travel plans found.</p>').appendTo('body');
                }
            }
        });
    </script>
</body>
</html> --%>