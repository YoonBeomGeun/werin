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

</head>
<body>
	<h2>Landmark Information</h2>
	<div class="container">
		<table>
			<thead>
				<tr>
					<th>Title</th>
					<th>Img</th>
					<th>addr1</th>
					<th>Overview</th>
					<th>Tel</th>
					<th>Homepage</th>
					<th>Mapx</th>
					<th>Mapy</th>
				</tr>
			</thead>
			<tbody>
				<!-- Iterate over the list and display each landmark -->
				<c:forEach var="landmark" items="${list2}">
					<tr>
						<td>${landmark.title}</td>
						<td><img src="${landmark.firstImage2}" alt="Landmark Image"></td>
						<td>${landmark.overview}</td>
						<td>${landmark.addr1}</td>
						<td>${landmark.tel}</td>
						<td>${landmark.homepage}</td>
						<td>${landmark.mapx}</td>
						<td>${landmark.mapy}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<hr>
	불러오기 성공
</body>
</html>