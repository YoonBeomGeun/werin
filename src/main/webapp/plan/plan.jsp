<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>일정만들기</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/plan.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9899fbb01f84efd28d3c0f68eefe49d0&libraries=services"></script>
    
    <script>

        $(function() {
            // input을 datepicker로 선언
            $("#datepicker1, #datepicker2").datepicker({
                dateFormat: 'yy-mm-dd',
                showOtherMonths: true,
                showMonthAfterYear: true,
                changeYear: true,
                changeMonth: true,
                showOn: "both",
                buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
                buttonImageOnly: true,
                buttonText: "선택",
                yearSuffix: "년",
                monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                dayNamesMin: ['일','월','화','수','목','금','토'],
                dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
                minDate: "-5Y",
                maxDate: "+5y",
                onSelect: function() {
                    generateDayButtons();
                }
            });                    

            // 초기값을 오늘 날짜로 설정
            $('#datepicker1, #datepicker2').datepicker('setDate', 'today');

            // 버튼 생성 함수
            function generateDayButtons() {
                var startDate = $("#datepicker1").datepicker("getDate");
                var endDate = $("#datepicker2").datepicker("getDate");

                if (startDate && endDate) {
                    var diffDays = Math.ceil((endDate - startDate) / (1000 * 60 * 60 * 24));

                    // 기존 버튼 삭제
                    $("#dayButtons").empty();

                    // 새로운 버튼 생성
                    for (var i = 1; i <= diffDays + 1; i++) {
                        var button = $("<button>").attr("id", "dayButton" + i);
                        var dayText = $("<span>").text("Day" + i);
                        var dateText = $("<span>").text(formatDate(startDate, i - 1));

                        button.append(dayText, "<br>", dateText);

                        $("#dayButtons").append(button);
                    }
                }
            }

            // 날짜 포맷 변환 함수
            function formatDate(startDate, addDays) {
                var currentDate = new Date(startDate);
                currentDate.setDate(currentDate.getDate() + addDays);

                var dd = String(currentDate.getDate()).padStart(2, '0');
                var mm = String(currentDate.getMonth() + 1).padStart(2, '0');
                var yyyy = currentDate.getFullYear();

                return yyyy + '-' + mm + '-' + dd;
            }

            	
            var markers = [];

            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                mapOption = {
                    center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                };  
            var map = new kakao.maps.Map(mapContainer, mapOption); 
			
         // 장소 검색 객체를 생성합니다
            var ps = new kakao.maps.services.Places();  

            // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
            var infowindow = new kakao.maps.InfoWindow({zIndex:1});
            
          
                searchPlaces();
           
            
            // 키워드 검색을 요청하는 함수
            function searchPlaces() {
            	var keyword = document.getElementById('keyword').value;

                if (!keyword.replace(/^\s+|\s+$/g, '')) {
                    alert('키워드를 입력해주세요!');
                    return false;
                }

                // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
                ps.keywordSearch( keyword, placesSearchCB); 
            }
			
         // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
            function placesSearchCB(data, status, pagination) {
                if (status === kakao.maps.services.Status.OK) {

                    // 정상적으로 검색이 완료됐으면
                    // 검색 목록과 마커를 표출합니다
                    displayPlaces(data);

                    // 페이지 번호를 표출합니다
                    displayPagination(pagination);

                } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

                    alert('검색 결과가 존재하지 않습니다.');
                    return;

                } else if (status === kakao.maps.services.Status.ERROR) {

                    alert('검색 결과 중 오류가 발생했습니다.');
                    return;

                }
            }

            // 검색 결과 목록과 마커를 표출하는 함수입니다
            function displayPlaces(places) {

                var listEl = document.getElementById('placesList'), 
                menuEl = document.getElementById('menu_wrap'),
                fragment = document.createDocumentFragment(), 
                bounds = new kakao.maps.LatLngBounds(), 
                listStr = '';
                
                // 검색 결과 목록에 추가된 항목들을 제거합니다
                removeAllChildNods(listEl);

                // 지도에 표시되고 있는 마커를 제거합니다
                removeMarker();
                
                for ( var i=0; i<places.length; i++ ) {

                    // 마커를 생성하고 지도에 표시합니다
                    var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                        marker = addMarker(placePosition, i), 
                        itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

                    // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                    // LatLngBounds 객체에 좌표를 추가합니다
                    bounds.extend(placePosition);

                    // 마커와 검색결과 항목에 mouseover 했을때
                    // 해당 장소에 인포윈도우에 장소명을 표시합니다
                    // mouseout 했을 때는 인포윈도우를 닫습니다
                    (function(marker, title) {
                        kakao.maps.event.addListener(marker, 'mouseover', function() {
                            displayInfowindow(marker, title);
                        });

                        kakao.maps.event.addListener(marker, 'mouseout', function() {
                            infowindow.close();
                        });

                        itemEl.onmouseover =  function () {
                            displayInfowindow(marker, title);
                        };

                        itemEl.onmouseout =  function () {
                            infowindow.close();
                        };
                    })(marker, places[i].place_name);

                    fragment.appendChild(itemEl);
                }

                // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
                listEl.appendChild(fragment);
                menuEl.scrollTop = 0;

                // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                map.setBounds(bounds);
            }
            

         // 검색결과 항목을 Element로 반환하는 함수입니다
         function getListItem(index, places) {

             var el = document.createElement('li'),
             itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                         '<div class="info">' +
                         '   <h5>' + places.place_name + '</h5>';

             if (places.road_address_name) {
                 itemStr += '    <span>' + places.road_address_name + '</span>' +
                             '   <span class="jibun gray">' +  places.address_name  + '</span>';
             } else {
                 itemStr += '    <span>' +  places.address_name  + '</span>'; 
             }
                          
               itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                         '</div>';           

             el.innerHTML = itemStr;
             el.className = 'item';

             return el;
         }
         
      // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
         function addMarker(position, idx, title) {
             var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                 imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
                 imgOptions =  {
                     spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                     spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                     offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                 },
                 markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                     marker = new kakao.maps.Marker({
                     position: position, // 마커의 위치
                     image: markerImage 
                 });

             marker.setMap(map); // 지도 위에 마커를 표출합니다
             markers.push(marker);  // 배열에 생성된 마커를 추가합니다

             return marker;
         }

         // 지도 위에 표시되고 있는 마커를 모두 제거합니다
         function removeMarker() {
             for ( var i = 0; i < markers.length; i++ ) {
                 markers[i].setMap(null);
             }   
             markers = [];
         }
		

      // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
      function displayPagination(pagination) {
          var paginationEl = document.getElementById('pagination'),
              fragment = document.createDocumentFragment(),
              i; 

          // 기존에 추가된 페이지번호를 삭제합니다
          while (paginationEl.hasChildNodes()) {
              paginationEl.removeChild (paginationEl.lastChild);
          }

          for (i=1; i<=pagination.last; i++) {
              var el = document.createElement('a');
              el.href = "#";
              el.innerHTML = i;

              if (i===pagination.current) {
                  el.className = 'on';
              } else {
                  el.onclick = (function(i) {
                      return function() {
                          pagination.gotoPage(i);
                      }
                  })(i);
              }

              fragment.appendChild(el);
          }
          paginationEl.appendChild(fragment);
      }

      // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
      // 인포윈도우에 장소명을 표시합니다
      function displayInfowindow(marker, title) {
          var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

          infowindow.setContent(content);
          infowindow.open(map, marker);
      }

       // 검색결과 목록의 자식 Element를 제거하는 함수입니다
      function removeAllChildNods(el) {   
          while (el.hasChildNodes()) {
              el.removeChild (el.lastChild);
          }
      }

           
        });
    </script>
</head>
<body>
    <%@ include file="../header.jsp" %>
    <div id="all">
        <div id="left">
            <div id="travel-info">
                <label for="travelTitle"></label>
                <input type="text" id="travelTitle" placeholder="일정 제목을 입력하세요.">
                <label for="travelWith"></label>
                <select class="form-control" id="travelWith">
                    <option value="none" disabled selected hidden>누구랑?</option>
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
        </div>
        <!-- 여행 일수를 표시할 공간 -->
        <div id="dayButtons"></div>

        <div id="menu_wrap" class="bg_white">
            <div class="option">
                <div>
                    <form onsubmit="searchPlaces(); return false;">
                        키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
                          <button type="submit">검색하기</button> 
                    </form>
                </div>
            </div>
            <hr>
            <ul id="placesList"></ul>
            <div id="pagination"></div>
        </div>
    </div>
</body>
</html>