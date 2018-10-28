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
.topline{
	border-width:2px;
}
.row1{
	height:100px;
	width:100%;
}
.searchById{
	float:left;
}
.searchAll{
	padding-top:30px;
	float:left;
	font-size:20px;
	margin-left:30px;
}
#searchAll{
	margin-top:20px;
	margin-left:10px;
}
.searchByDate{
	margin-left:40px;
	float:left;
}
.searchDate{
	padding-top:30px;
	float:left;
	font-size:20px;
}
#searchDate1{
	float:left;
	margin-top:20px;
	margin-left:20px;
	font-size:15px;
}
#searchDate2{
	float:left;
	margin-top:20px;
	margin-left:40px;
	font-size:15px;
}
.searchByCategory{
	float:left;
	margin-left:40px;
}
.searchCategory{
	padding-top:30px;
	float:left;
	font-size:20px;
}
#searchOption{
	margin-left:30px;
	margin-top:20px;
	float:left;
	font-size:15px;
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
					<h2>광고내역보기</h2>
					<hr class="topline">
					<br>
					<br>
					<br>
					<div class="row1">
						<hr>
							<div class="searchArea searchTotal" align="center">
								
								<div class="searchById">
									<p class="searchAll">통합검색</p>
									<input class="form-control" type="search" id="searchAll"
										style="width:300px; height:50px; font-size:20px">
								</div>
								<div class="searchByDate">
									<p class="searchDate">광고기간</p>
									<input class="form-control" type="date" id="searchDate1"
										style="width:150px; height:50px">
									<input class="form-control" type="date" id="searchDate2"
										style="width:150px; height:50px">
								</div>
								<div class="searchByCategory">
									<p class="searchCategory">카테고리</p>
									<select class="form-control" id="searchOption" 
											style="width:150px; height:50px" >
										<option value="civilServant">공무원</option>
										<option value="highSchool">고등학생</option>
										<option value="certification">자격증</option>
									</select>
								</div>
							</div>
					</div>
					<hr>
				<button name="memberSearchBtn" id="searchBtn" class="btn btn-primary" style="float:right; margin-top:20px; margin-right:100px; font-size:20px">검색초기화</button>
				<button name="memberSearchBtn" id="searchBtn" class="btn btn-primary" style="float:right; margin-top:20px; margin-right:40px; font-size:20px">검색하기</button>
				<br><br>
				<div class="table" style="margin-top:50px">
				<table id="memberListTable" class="table table-hover" align="center" name="memberListTable" style="font-size:14px; text-align:center">
					<tr class="head">
						<th width="2%"><input type="checkbox" class="masterCheck"></th>
						<th width="8%">광고번호</th>
						<th width="15%">광고업체명</th>
						<th width="10%">광고이미지</th>
						<th width="20%">카테고리</th>
						<th width="20%">광고종류</th>
						<th width="15%">수익</th>
						<th width="10%">상태</th>
					</tr>
					<tr>
						<td><input type="checkbox" class="masterCheck"></th>
						<td>1</td>
						<td>sji1123</td>
						<td>신재익</td>
						<td>sji1123@naver.com</td>
						<td>010-5242-1241</td>
						<td>2018-10-1</td>
						<td>공무원</td>
					</tr>
				</table>
				</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>