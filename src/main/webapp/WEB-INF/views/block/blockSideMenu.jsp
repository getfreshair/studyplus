<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.sideButtonHover:hover {
		background:orangered !important;
		color:white;
	}
</style>
</head>
<body>
	<div class="col-xs-12 col-md-12">
		<div class="profileDiv" style="width:90%; height:150px; margin-top:50px ; margin-left:50px ">
			<img src="resources/images/block/profile.jpg" style="border-radius:70px">
			<span style="font-size:2em; font-weight: bold; margin:20px; color:orangered "> 취업하즈아..!! </span>
		</div>
		
		<hr>

				
		<div class="sideButtonDiv">
			<a href="showBlockMain.bl">
				<div class="sideButtonHover" style="width:100%; height:50px; border-radius:20px ; background:darkgray;color:white; text-align:center;vertical-align:middle; padding-top:10px">Main</div>
			</a>
			<hr>
			<a href="showProgram.bl">
				<div class="programMenu sideButtonHover" style="width:100%; height:50px; border-radius:20px ; background:darkgray;color:white; text-align:center;vertical-align:middle; padding-top:10px">프로그램 차단 설정</div>
			</a>
			<hr >
			<a href="showWeb.bl">
				<div class="webMenu sideButtonHover" style="width:100%; height:50px; border-radius:20px ; background:darkgray;color:white; text-align:center;vertical-align:middle; padding-top:10px">웹 사이트 차단 설정</div>
			</a>
			<hr>
			<a href="showLocation.bl">
				<div class="locationMenu sideButtonHover" style="width:100%; height:50px; border-radius:20px ; background:darkgray;color:white; text-align:center;vertical-align:middle; padding-top:10px">위치 차단 설정</div>
			</a>
			<hr>
			<a href="showSchedule.bl">
				<div class="scheduleMenu sideButtonHover" style="width:100%; height:50px; border-radius:20px ; background:darkgray;color:white;  text-align:center;vertical-align:middle; padding-top:10px">시간표 차단 설정</div>
			</a>
			<hr>
		</div>
	</div>
</body>
</html>