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
					<h2>그룹환급리스트</h2>
					<hr>
					<div class="wrap-div">
						<button name="memberPenalty" id="penaltyBtn" class="btn btn-primary" style="float:right;  margin-right:100px; font-size:15px;">선택처리</button>
						<p>카테고리명1</p>
						<div class="first-div" >
							<table id="category1" name="categoryOne" class="table table-hover" style="text-align:center">
								<tr class="head">
									<th width="2%"><input type="checkbox" class="masterCheck"></th>
									<th width="8%">번호</th>
									<th width="15%">방이름</th>
									<th width="10%">방장아이디</th>
									<th width="20%">이메일</th>
									<th width="20%">휴대전화</th>
									<th width="15%">순위</th>
									<th width="10%">상태</th>
								</tr>
							</table>
							<p>카테고리명2</p>
							<table id="category2" name="categoryTwo" class="table table-hover" style="text-align:center">
								<tr class="head">
									<th width="2%"><input type="checkbox" class="masterCheck"></th>
									<th width="8%">번호</th>
									<th width="15%">방이름</th>
									<th width="10%">방장아이디</th>
									<th width="20%">이메일</th>
									<th width="20%">휴대전화</th>
									<th width="15%">순위</th>
									<th width="10%">상태</th>
								</tr>
							</table>
							<p>카테고리명3</p>
							<table id="category3" name="categoryThree" class="table table-hover" style="text-align:center">
								<tr class="head">
									<th width="2%"><input type="checkbox" class="masterCheck"></th>
									<th width="8%">번호</th>
									<th width="15%">방이름</th>
									<th width="10%">방장아이디</th>
									<th width="20%">이메일</th>
									<th width="20%">휴대전화</th>
									<th width="15%">순위</th>
									<th width="10%">상태</th>
								</tr>
							</table>
							<p>카테고리명4</p>
							<table id="category4" name="categoryFour" class="table table-hover" style="text-align:center">
								<tr class="head">
									<th width="2%"><input type="checkbox" class="masterCheck"></th>
									<th width="8%">번호</th>
									<th width="15%">방이름</th>
									<th width="10%">방장아이디</th>
									<th width="20%">이메일</th>
									<th width="20%">휴대전화</th>
									<th width="15%">순위</th>
									<th width="10%">상태</th>
								</tr>
							</table>
						</div>
						<div class="second-div">
							<h3>그룹환급내역</h3>
									<table id="category4" name="categoryFour" class="table table-hover" style="text-align:center">
								<tr class="head">
									<th width="10%">카테고리</th>
									<th width="5%">번호</th>
									<th width="15%">방이름</th>
									<th width="10%">방장아이디</th>
									<th width="20%">이메일</th>
									<th width="20%">휴대전화</th>
									<th width="15%">순위</th>
									<th width="10%">상태</th>
								</tr>
							</table>
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
								name="searchBtn1" style="font-size:14px; padding-down:30px; margin-bottom:8px; display:inline-block;height:35px;">검색하기</button>
					
					</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>