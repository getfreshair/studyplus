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
	background: #F0F0F0;
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
					<h2>회원통계</h2>
					<hr>
					<div class="first-row">
						<div class="first" style="float:left; width:33%; height: 140px; text-align:center; border-right-style: groove">
						오늘의 가입자 수
						</div>
						<div class="second" style="float:left; width:33%; height: 140px; text-align:center; border-right-style: groove">
						제재회원 수
						</div>
						<div class="third" style="float:left; width:33%; height: 140px; text-align:center;">
						총 가입자 수
						</div>
					</div>
					<hr class="bottom" style="width:1330px;float:left;">
					<div class="second-row" style="background:blue;  float:left; height:250px; width:70%;margin-left: 200px;">
						
					</div>
					<div class="third-row" style="background:yellow;float:left; height:250px; width:70%;margin-left: 200px;">
					
					</div>
					<div class="forth-row" style="background:red;float:left; height:250px; width:70%;margin-left: 200px;">
					
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>