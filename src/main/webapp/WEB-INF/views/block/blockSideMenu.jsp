<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-xs-12 col-md-12">
		<div class="profileDiv" style="width:90%; height:150px; margin-top:50px ; margin-left:50px ">
			<img src="resources/images/profile.jpg" style="border-radius:70px">
			<span style="font-size:2em; font-weight: bold; margin:20px; color:orangered ">오늘의 적은 어제의 나 </span>
		</div>
		
		<hr>
		
		<div id="controls" style="display:inline-block; margin-left:30px ;">
			<span id="outputGroup0" style="width:100px; height:50px; margin-top:50px; font-size:2em;">00 : 00 : 00 : 00</span>
  			&nbsp;&nbsp;&nbsp;<button id="groupStartPause0" class="btn btn-primary">공부시작</button>
  		</div>
		
		<hr>
		
		<div class="sideButtonDiv">
			<hr>
			<a>
				<div style="width:400px; height:50px; border-radius:20px ; background:darkgray;color:white; display:table-cell; text-align:center;vertical-align:middle">Main</div>
			</a>
			<hr>
			<a>
				<div style="width:400px; height:50px; border-radius:20px ; background:darkgray;color:white; display:table-cell; text-align:center;vertical-align:middle">프로그램 차단 설정</div>
			</a>
			<hr>
			<a>
				<div style="width:400px; height:50px; border-radius:20px ; background:darkgray;color:white; display:table-cell; text-align:center;vertical-align:middle">웹 사이트 차단 설정</div>
			</a>
			<hr>
			<a>
				<div style="width:400px; height:50px; border-radius:20px ; background:darkgray;color:white; display:table-cell; text-align:center;vertical-align:middle">위치 차단 설정</div>
			</a>
			<hr>
			<a>
				<div style="width:400px; height:50px; border-radius:20px ; background:darkgray;color:white; display:table-cell; text-align:center;vertical-align:middle">웹 사이트 차단 설정</div>
			</a>
			<hr>
		</div>
	</div>
</body>
</html>