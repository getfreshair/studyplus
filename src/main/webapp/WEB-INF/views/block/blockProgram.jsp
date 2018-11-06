<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<style>

	.programMenu {
		background: red !important;
	}

.vl {
    border-left: 2px solid gray;
    margin-top:80px;
    height: 430px;
    float:left;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-xs-12 col-md-3">
		<jsp:include page="blockSideMenu.jsp"/>
	</div>
	<div class="col-xs-12 col-md-9" >
		<div class="panel panel-default col-xs-11 col-md-11 " style="margin-top:100px; margin-left:50px; margin-right:50px">
  			<div class="panel-body">프로그램 차단을 설정합니다. 설정 후 완료 버튼을 눌러야 적용이 완료 됩니다.</div>
		</div>
		<br><br>

			<div class="col-xs-11 col-md-6" style="margin-left:50px;padding-right:9%; float:left">
				<h1 style="color:blue;">프로그램 차단 설정</h1>
				
				<div class="form-group" style="margin-left:30px">
				  	<label for="comment">차단할 프로그램 목록</label>
				  	<textarea class="form-control" cols="10" rows="20" id="comment" style="resize:none;"></textarea>
				</div>
			</div>
			<div class="vl col-xs-0 col-md-1" align="center"></div>
			<div style="float:left" class="col-xs-11 col-md-4">
				<br><br><br><br><br>
				<h2>차단할 프로그램 찾기</h2>
				<div class="form-group">
					  <input type="text" class="form-control" id="usr" style="width:70%; display:inline-block"> &nbsp;&nbsp;<button style="display:inline-block" type="button" class="btn btn-primary">파일 찾기</button>
				</div>
				<h2>현재 프로그램 동기화 하기</h2>
				<h4 style="width:70%; display:inline-block">Study PLUS에서 현재 실행중인 프로그램을 허용 프로그램에 자동으로 추가해줍니다.
				<br>처음 프로그램 설치시 자동 설정을 권장합니다.</h4> <button style="display:inline-block" type="button" class="btn btn-primary">동기화 하기</button>
				<br>
				<br>
				<button style="margin-left:71%" type="button" class="btn btn-warning">설정 완료</button>
			</div>

	</div>
</body>
</html>