<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>키워드로 장소검색하고 목록으로 표출하기</title>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/plan.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	width: 320px;
	left: 0;
	margin-left: 20px;
	margin-top: 50px;
	padding: 5px;
	overflow-y: auto;
	background: white;
	z-index: 1;
	font-size: 12px;
	height: 500px;
	left: 0;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}
</style>
</head>
<body>
	<script>
		var travelPlans = {}; // 일정 정보를 저장할 전역변수

		$(function() {
			// input을 datepicker로 선언
			$("#datepicker1, #datepicker2")
					.datepicker(
							{
								dateFormat : 'yy-mm-dd',
								showOtherMonths : true,
								showMonthAfterYear : true,
								changeYear : true,
								changeMonth : true,
								showOn : "both",
								buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
								buttonImageOnly : true,
								buttonText : "선택",
								yearSuffix : "년",
								monthNamesShort : [ '1월', '2월', '3월', '4월',
										'5월', '6월', '7월', '8월', '9월', '10월',
										'11월', '12월' ],
								monthNames : [ '1월', '2월', '3월', '4월', '5월',
										'6월', '7월', '8월', '9월', '10월', '11월',
										'12월' ],
								dayNamesMin : [ '일', '월', '화', '수', '목', '금',
										'토' ],
								dayNames : [ '일요일', '월요일', '화요일', '수요일', '목요일',
										'금요일', '토요일' ],
								minDate : "-5Y",
								maxDate : "+5y",
								onSelect : function() {
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
					var diffDays = Math.ceil((endDate - startDate)
							/ (1000 * 60 * 60 * 24));

					// travelPlans 객체 초기화
					travelPlans = {};

					var dayButtonsContainer = document
							.getElementById('dayButtons');
					dayButtonsContainer.innerHTML = ''; // 기존 버튼 제거

					for (var i = 0; i <= diffDays; i++) {
						var currentDate = new Date(startDate);
						currentDate.setDate(currentDate.getDate() + i);

						var button = document.createElement('button');
						button.innerHTML = "Day" + (i + 1) + "<br>"
								+ formatDate(currentDate);
						button.className = 'day-button';

						button.addEventListener('click', function() {
							document.querySelectorAll('.day-button').forEach(
									function(btn) {
										btn.classList.remove('selected');
									});
							this.classList.add('selected');

							// 선택된 날짜의 일정 업데이트
							var selectedDay = this.innerText.trim().replace(
									'Day', '');

							updatePlanList(selectedDay);
						});

						function updatePlanList(dateString) {
							// 선택된 날짜에 해당하는 일정만 lb에 표시
							var lb = document.getElementById('lb');
							lb.innerHTML = ''; // 기존의 일정을 지우고 새로운 일정을 추가

							// 해당 날짜의 일정 배열이 있다면 lb에 추가
							if (travelPlans[dateString]) {
								for (var i = 0; i < travelPlans[dateString].length; i++) {
									var plan = travelPlans[dateString][i];
									var newPlanItem = document
											.createElement('div');
									newPlanItem.innerHTML = '<span>'
											+ dateString + ' - '
											+ plan.placeName
											+ '</span><span class="tel">'
											+ plan.phone + '</span>';
									lb.appendChild(newPlanItem);
								}
							}
						}

						// 새로운 day의 일정 목록을 생성
						var planList = document.createElement('ul');
						planList.className = 'plan-list';

						// 새로운 일정 목록을 day 일정 컨테이너에 추가
						dayPlansContainer.appendChild(planList);

						button.appendChild(planList);
						dayButtonsContainer.appendChild(button);

						// 날짜에 해당하는 일정이 이미 있다면 해당 일정 목록을 표시
						var dateString = formatDate(currentDate);
						if (travelPlans[dateString]
								&& travelPlans[dateString].length > 0) {
							updateUI(dateString);
						}
					}
				}
			}
			// 날짜 포맷 변환 함수
			function formatDate(date) {
				var dd = String(date.getDate()).padStart(2, '0');
				var mm = String(date.getMonth() + 1).padStart(2, '0');
				var yyyy = date.getFullYear();

				return yyyy + '-' + mm + '-' + dd;
			}
		});
	</script>

	<%@ include file="../header.jsp"%>
	<div id="all">
		<div id="left">
			<div id="travel-info">
				<form action="insert">
					<label for="travelTitle"></label> <input type="text"
						id="travelTitle" placeholder="일정 제목을 입력하세요."> <label
						for="travelWith"></label> <select class="form-control"
						id="travelWith">
						<option value="none" disabled selected hidden>누구랑?</option>
						<option value="alone">혼자</option>
						<option value="couple">연인과</option>
						<option value="family">가족과</option>
						<option value="parents">부모님과</option>
						<option value="group">단체로</option>
					</select> <input type="text" id="datepicker1" placeholder="여행시작날짜">
					~ <input type="text" id="datepicker2" placeholder="여행종료날짜">
					<button id="save" type="submit">저장</button>
				</form>
			</div>

			<div id="map"></div>
		</div>
		<!-- 여행 일수를 표시할 공간 -->
		<div id="mid">
			<ul id="dayButtons"></ul>
			<div id="dayPlansContainer"></div>

		</div>

		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<div>
					<form onsubmit="searchPlaces(); return false;">
						키워드 : <input type="text" value="제주 공항" id="keyword" size="15">
						<button type="submit">검색하기</button>
					</form>
				</div>
			</div>
			<hr>
			<!-- 검색 결과를 표시할 부분 -->
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>

		<div id="lb"></div>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9899fbb01f84efd28d3c0f68eefe49d0&libraries=services"></script>
	<script>
		// 마커를 담을 배열입니다
		var markers = [];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});

		// 키워드로 장소를 검색합니다
		searchPlaces();

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

			var keyword = document.getElementById('keyword').value;

			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해주세요!');
				return false;
			}

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
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

			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y,
						places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
						i, places[i]); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title) {
					kakao.maps.event.addListener(marker, 'mouseover',
							function() {
								displayInfowindow(marker, title);
							});

					kakao.maps.event.addListener(marker, 'mouseout',
							function() {
								infowindow.close();
							});

					itemEl.onmouseover = function() {
						displayInfowindow(marker, title);
					};

					itemEl.onmouseout = function() {
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
			var contextPath = '${pageContext.request.contextPath}';
			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5>' + places.place_name + '</h5>';

			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name + '</span>'
						+ '   <span class="jibun gray">' + places.address_name
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';
			itemStr += '<div class="placelist-div"><button class="placelist-div__button" onclick="planInsert(\''
					+ places.place_name
					+ '\',\''
					+ places.y
					+ '\',\''
					+ places.x
					+ '\',\''
					+ contextPath
					+ '\', \''
					+ places.phone + '\')">+</button></div>';
			el.innerHTML = itemStr;
			el.className = 'item';

			return el;
		}

		function planInsert(placeName, latitude, longitude, contextPath, phone) {
			var selectedDay = document.querySelector('.day-button.selected');
			if (!selectedDay) {
				alert('날짜를 먼저 선택해주세요.');
				return;
			}

			var dateString = selectedDay.innerText.trim().replace('Day', '');

			// travelPlans 객체에 해당 날짜의 일정 배열이 없으면 생성
			if (!travelPlans[dateString]) {
				travelPlans[dateString] = [];
			}

			var newPlan = {
				placeName : placeName,
				latitude : latitude,
				longitude : longitude,
				contextPath : contextPath,
				phone : phone
			};
			travelPlans[dateString].push(newPlan);

			// AJAX 요청을 통해 서버에 일정 추가
			$
					.ajax({
						type : 'POST',
						url : '${pageContext.request.contextPath}/schedule/addSchedule',
						contentType : 'application/json',
						data : JSON.stringify(newPlan),
						success : function(response) {
							if (response.status === "success") {
								// 성공적으로 추가되면 화면에 일정을 실시간으로 표시
								updatePlanList(dateString);
								alert(response.message); // 또는 다른 사용자 피드백 방식
							} else {
								alert(response.message);
							}
						},
						error : function(error) {
							console.error(error);
							alert('일정 추가에 실패했습니다.');
						}
					});
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
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
			var content = '<div style="padding:5px;z-index:1;">' + title
					+ '</div>';

			infowindow.setContent(content);
			infowindow.open(map, marker);
		}

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}
	</script>
</body>
</html>