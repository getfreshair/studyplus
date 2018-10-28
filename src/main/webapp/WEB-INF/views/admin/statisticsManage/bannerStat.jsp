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
					<h2>광고통계</h2>
					<hr>
					<div class="first-row">
						<div class="first" style="float:left; width:33%; height: 140px; text-align:center; border-right-style: groove">
						이번달 광고매출액
						</div>
						<div class="second" style="float:left; width:33%; height: 140px; text-align:center; border-right-style: groove">
						등록된 광고 수
						</div>
						<div class="third" style="float:left; width:33%; height: 140px; text-align:center;">
						총 누적 매출액
						</div>
					</div>
					<hr class="bottom" style="width:1330px;float:left;">
					<div class="second-row" style="width:1330px;float:left;">
						<div class="second-first" style="width:500px; height:300px; background:red; margin-left:100px; float:left;"></div>
						<div class="second-second"style="width:500px; height:300px; background:blue;margin-left:100px; float:left;"></div>
					</div>
					<div class="third-row" style="width:1330px;float:left;">
						<div class="third-first"style="width:1100px; height:300px; background:green;margin-left:100px; margin-top:50px; float:left;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>