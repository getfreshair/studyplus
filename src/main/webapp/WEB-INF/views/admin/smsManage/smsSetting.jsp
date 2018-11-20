<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.adminContentArea {
	width: 1584px;
	float: left;
}

.leftSideArea {
	width: 250px;
}
.adminBody {
	width: 1334px;
	float: left;
	background: white;
}
.content{
		float:left;
		width:1330px;
		height:1000px;
		padding-left:20px;
		padding-top:20px;
}
hr{
	border-top: 1px solid gray !important;
}
</style>
</head>
<body>
	<div class="adminArea">
		<div class="headerArea">
			<jsp:include page="../header.jsp"></jsp:include>
		</div>
		<div class="adminContentArea">
			<div class="leftSideArea">
				<jsp:include page="../sidemenu.jsp"></jsp:include>
			</div>
			<div class="adminBody">
				<div class="content">
					<h2>SMS설정</h2>
					<hr>
					<br>
					<br>
					<hr>
					<form>
					<div class="first-div" style="display:inline-block">
						<p class="receiveNum" style="margin-top:5px; margin-left:350px;display:inline-block;">발신 번호</p>
						<input class="form-control" type="receive" id="receiveNum"
										style="width:300px; height:50px; font-size:20px;margin-left:50px;display:inline-block;">
					</div>
					<hr style="width:600px; align:left">
					<div class="second-div" style="display:inline-block">
						<label class="message" style=" margin-left:354px; margin-top:20px;float:left">업체명</label>
					<input class="form-control" type="receive" id="receiveNum"
										style="width:300px; height:50px; font-size:20px;margin-left:70px;display:inline-block;">
					</div>
					<hr style="width:600px;align:left">
					<button class="btn btn-primary" id="searchBtn"
								name="searchBtn1" style="font-size:14px; padding-down:30px; margin-left:550px;margin-bottom:8px; display:inline-block;height:35px;">변경</button>
					<button class="btn btn-primary" id="cancel"
								name="cancel1" style="font-size:14px; padding-down:30px; margin-left:20px; margin-bottom:8px; display:inline-block;height:35px;">취소</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>