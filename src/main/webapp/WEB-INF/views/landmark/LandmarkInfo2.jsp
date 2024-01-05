<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Landmark Information</title>
    <style>
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
</head>
<body>

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

    <hr>
    불러오기 성공

</body>
</html>