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
		margin-left:20px;
		margin-top:20px;
}
.topline{
	border-width:2px;
}
.vertical_line{
		width:1px;
		border:0.5px solid lightgray;
		height:300px;
		display:inline-block;
		margin-left:20px;
		margin-right:20px;
	}
.row{
		float:left;
		height:500px;
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
					<h2>제재회원관리</h2>
					<hr class="topline">
					<br>
					<br>
					<br>
					<div style="display: inline-block; width: 47%; height: 300px; overflow: auto">
						<h4>최근 제재 :  xx 명</h4>
						<table class="table table-hover" align="center" id="penaltyMember" style="font-size:15px; text-align:center; ">
							<tr class="head">
								<th width="15%">회원번호</th>
								<th width="15%">아이디</th>
								<th width="15%">일자</th>
								<th width="15%">구분</th>
							</tr>
							<tr>
								<td>1</td>
								<td>2</td>
								<td>3</td>
								<td>4</td>
							</tr>
						</table>
					</div>
				<div class="vertical_line" ></div>
					<div style="display: inline-block; width: 47%; height: 300px; overflow: auto">
						<h4 style="display: inline-block">제재 만료 처리</h4>
						<div style="float: right">
							<button class="btn btn-default" id="totalProcessBtn"
								name="totalProcessBtn" style="font-size:14px">일괄처리</button>
							<button class="btn btn-default" id="selectProcessBtn"
								name="selectProcessBtn" style="font-size:14px">선택처리</button>
						</div>
						<table class="table table-hover" align="center" style="font-size:15px; text-align:center;">
							<tr class="head">
								<th width="15%"><input type="checkbox" class="masterCheck"></th>
								<th width="15%">회원번호</th>
								<th width="15%">아이디</th>
								<th width="15%">정지일</th>
								<th width="15%">만료일</th>
							</tr>
							<tr>
								<td>1</td>
								<td>2</td>
								<td>3</td>
								<td>4</td>
								<td>5</td>
							</tr>
						</table>
					</div>
				<div class="row2">
				<h3>전체 제재이력</h3>
				<div>
					<table class="table table-hover" id="penaltyMemberList" style="font-size:15px; text-align:center;">
					<tr class="head">
						<th>회원번호</th>
						<th>아이디</th>
						<th>일자</th>
						<th>제재만료일</th>
						<th>구분</th>
					</tr>
					<tr>
						<td>회원번호</td>
						<td>아이디</td>
						<td>일자</td>
						<td>제재만료일</td>
						<td>구분</td>
					</tr>
					</table>
				</div>
					<div class="searchById" style="margin-left:300px;">
					<div class="option" style="display:inline-block; maring-top:17px;font-size:20px;">
					<select class="form-control" id="searchOption" 
								style="width:150px; height:40px; margin-top:20px;display:inline-block;" >
							<option value="userId">아이디</option>
							<option value="userNum">유저번호</option>
							<option value="distinguish">구분</option>
					</select>
					</div>
					
					<input class="form-control" type="search" id="searchAll"
									style="width:300px; padding-down:30px; margin-top:14px; height:40px; font-size:14px; display:inline-block;">
					<button class="btn btn-primary" id="searchBtn"
								name="searchBtn1" style="font-size:14px; padding-down:30px; margin-bottom:8px; display:inline-block;height:30px;">검색하기</button>
					
					</div>
			</div>
		</div>
	</div>
</body>
</html>