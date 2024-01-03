<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>일정만들기</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9899fbb01f84efd28d3c0f68eefe49d0"></script>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/plan.css">
    
   <script>
   $(function() {
       //input을 datepicker로 선언
       $("#datepicker1, #datepicker2").datepicker({
           dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
       });                    
       
       //초기값을 오늘 날짜로 설정해줘야 합니다.
       $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
   });
</script>
	
</head>
<body>
    <%@ include file="../header.jsp" %>

    <div id="travel-info">
        <label for="travelTitle"></label>
        <input type="text" id="travelTitle" placeholder="일정 제목을 입력하세요.">
        <label for="travelWith"></label>
        <select class="form-control" id="travelWith">
            <option value="none" disabled selected hidden>누구와 가시나요?</option>
            <option value="alone">혼자</option>
            <option value="couple">연인과</option>
            <option value="family">가족과</option>
            <option value="parents">부모님과</option>
            <option value="group">단체로</option>
        </select>
        <input type="text" id="datepicker1" placeholder="여행시작날짜">
        ~ <input type="text" id="datepicker2" placeholder="여행종료날짜">
    </div>

    <div id="map"></div>

    <script>
        var mapContainer = document.getElementById('map'),
            mapOption = { 
                center: new kakao.maps.LatLng(33.450701, 126.570667),
                level: 3
            };

        var map = new kakao.maps.Map(mapContainer, mapOption);
    </script>
</body>
</html>