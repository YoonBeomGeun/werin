<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <%@ include file="../../../header.jsp" %>
  <meta charset="utf-8">
  <title>Google Map</title>
</head>

<body>
  <div id="map" style="height: 600px;"></div>
  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD4tuPh5nmBI20eGxzks-OlATFumg-OMis&callback=initMap&region=kr"></script>
  <script>
    function initMap() {
      var jeju = { lat: 33.5070537 ,lng: 126.492776 };
      var map = new google.maps.Map(
        document.getElementById('map'), {
          zoom: 14,
          center: jeju
        });
      
      const myLatLng1 = { lat: 33.5070537, lng: 126.492776 };

      
      new google.maps.Marker({
    	    position: myLatLng1,
    	    map,
    	    title: "Hello World!",
    	  });
      
const myLatLng2 = { lat: 33.4853707, lng: 126.4815713 };

      
      new google.maps.Marker({
    	    position: myLatLng2,
    	    map,
    	    title: "Hello World!2",
    	  });
      }
     
  </script>
</body>
</html>