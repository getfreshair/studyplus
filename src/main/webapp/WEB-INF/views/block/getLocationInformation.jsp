<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
latitude = 33.450701;
longitude = 126.570667
function getLocation(){
	if("geolocation" in navigator){
		navigator.geolocation.getCurrentPosition(function(position) {
			latitude = position.coords.latitude;
			longitude = position.coords.longitude;
			console.log(latitude);
			console.log(longitude);
			console.log("드러움")
			});
	} else {
		alert("GPS를 제공하지 않는 인터넷 브라우저 입니다.\n 지도에 내 위치 표시 기능이 동작하지 않습니다.");
	}
	setTimeout(function() { 
		$("#locationInfo").text("lat:"+latitude+",lon:"+longitude);
	},1000);
}
getLocation();
</script>
<body>
<span id="locationInfo" name="locationInfo"></span>
</body>
</html>