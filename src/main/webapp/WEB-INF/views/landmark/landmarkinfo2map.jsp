<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kakao Map</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=005bfbc5bcbcc0eed9e4aef20258b628"></script>
    <!-- Replace YOUR_KAKAO_MAP_APP_KEY with your actual Kakao Map API key -->
    <style>
        #map {
            width: 100%;
            height: 400px;
        }
    </style>
    <script>
        $(document).ready(function () {
            // Your landmark coordinates, replace with actual coordinates
            var landmarkLat = 37.5665;
            var landmarkLon = 126.9780;

            var container = document.getElementById('map');
            var options = {
                center: new kakao.maps.LatLng(landmarkLat, landmarkLon),
                level: 5
            };

            var map = new kakao.maps.Map(container, options);
            
            // Add a marker to the map
            var marker = new kakao.maps.Marker({
                position: new kakao.maps.LatLng(landmarkLat, landmarkLon),
                map: map
            });
        });
    </script>
</head>
<body>
    <div id="map"></div>
</body>
</html>