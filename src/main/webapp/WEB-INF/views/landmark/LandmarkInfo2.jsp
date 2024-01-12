<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Landmark Information</title>
<style>
.container {
	display: flex; /* Use flexbox to align items */
}

.left-column {
	flex: 1;
	/* Use 1:1 ratio for flexbox to allow both divs to grow equally */
}

.right-column {
	flex: 1;
	margin-left: 20px; /* Add some space between the divs */
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
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

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>
	function loadKakaoMap() {

		// Load landmarkinfo2map.jsp into the right-column
		$.ajax({
			url: 'landmarkinfo2map.jsp', // landmarkinfo2map.jsp 파일의 경로
			type: 'GET',
			dataType: 'html',
			success: function (data) {
				// 성공적으로 로드된 경우, right-column에 내용 표시
				$('.right-column').html(data);
			},
			error: function (xhr, status, error) {
				// 오류가 발생한 경우 콘솔에 로그 출력
				console.error('Error loading landmarkinfo2map.jsp:', status, error);
			}
		});
	}
</script>

</head>
<body>
	<div class="container">
		<div class="left-column">
			<h2>Landmark Information</h2>
			<table>
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Information</th>
						<th>Picture</th>
						<th>Latitude</th>
						<th>Longitude</th>
					</tr>
				</thead>
				<tbody>
					<!-- Iterate over the list and display each landmark -->
					<c:forEach var="landmark" items="${list}">
						<tr>
							<td>${landmark.landmarkinfo_id}</td>
							<td>${landmark.landmarkinfo_name}</td>
							<td>${landmark.landmarkinfo_info}</td>
							<td>${landmark.landmarkinfo_pic}</td>
							<td>${landmark.landmarkinfo_lat}</td>
							<td>${landmark.landmarkinfo_lon}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="right-column">
			
		</div>


	</div>



	<hr>
	불러오기 성공
</body>
</html>