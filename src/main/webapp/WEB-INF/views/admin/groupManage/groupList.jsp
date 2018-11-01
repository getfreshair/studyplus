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
th{
	text-align:center !important;
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
				<h2>스터디그룹관리</h2>
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
									<p class="searchDate">생성일</p>
									<input class="form-control" type="date" id="searchDate1"
										style="width:150px; height:50px">
									<input class="form-control" type="date" id="searchDate2"
										style="width:150px; height:50px">
								</div>
								<div class="searchByCategory">
									<p class="searchCategory">카테고리</p>
									<select class="form-control" id="searchOption" 
											style="width:150px; height:50px" >
										<option value="전체">전체</option>
										<option value="고입">고입</option>
										<option value="대입">대입</option>
										<option value="고시">고시</option>
										<option value="공시">공시</option>
										<option value="외국어">외국어</option>
										<option value="취준">취준</option>
										<option value="자격증">자격증</option>
										<option value="기타">기타</option>
									</select>
								</div>
							</div>
					</div>
					<hr>
				<button name="memberSearchBtn" id="searchBtn" class="btn btn-primary" style="float:right; margin-top:20px; margin-right:100px; font-size:20px">검색초기화</button>
				<button type="button" name="memberSearchBtn" id="searchBtn" class="btn btn-primary" onclick="searchGroup();" style="float:right; margin-top:20px; margin-right:40px; font-size:20px">검색하기</button>
				<script>
					function searchGroup(){
						var keyword = $("#searchAll").val();
						var createDate1 = $("#searchDate1").val();
						var createDate2 = $("#searchDate2").val();
						var option = $("#searchOption").val();
						
						$.ajax({
							url:"adminSearchGroupList.do",
							type:"post",
							data:{keyword:keyword,
								createDate1:createDate1,
								createDate2:createDate2,
								option:option},
							success:function(data){
								console.log(data);
								getGroupList(data);
							},
							error:function(){
								console.log("에러 발생!");
							}
						})
						return false;
					}
					function getGroupList(data){
						var table = document.querySelector('#memberListTable');
						html = '<tr class="head">'+
						'<th width="5%">그룹번호</th>'+
						'<th width="15%">그룹명</th>'+
						'<th width="10%">방장아이디</th>'+
						'<th width="5%">지역</th>'+
						'<th width="15%">휴대전화</th>'+
						'<th width="15%">그룹생성일</th>'+
						'<th width="5%">목표시간</th>'+
						'<th width="10%">카테고리</th><tr>'
						console.log(data.length);
						for(var i = 0; i < data.length; i++){
							console.log("12");
							html += '<tr><td>'
									+data[i].STUDYGROUP_CODE+ '</td><td>' + data[i].STUDYGROUP_NAME + '</td><td>'
									+data[i].MEMBER_ID + '</td><td>' + data[i].LOCATION_NAME + '</td><td>'
									+data[i].MEMBER_PHONE + '</td><td>' + data[i].STUDYGROUP_STDATE+'</td><td>' + 
									data[i].STUDYGROUP_GOALTIME + '</td><td>'	+ data[i].CATEGORY_NAME + '</td></tr>';
						}
						table.innerHTML = html;
				
					}
				</script>
				
				<br><br>
				<div class="table" style="margin-top:50px">
				<table id="memberListTable" class="table table-hover" align="center" name="groupListTable" style="font-size:14px; text-align:center">
					<tr class="head">
						<th width="5%">그룹번호</th>
						<th width="15%">그룹명</th>
						<th width="10%">방장아이디</th>
						<th width="10%">지역</th>
						<th width="15%">휴대전화</th>
						<th width="15%">그룹생성일</th>
						<th width="5%">목표시간</th>
						<th width="10%">카테고리</th>
					</tr>
				</table>
				</div>
				
				</div>
			</div>
		</div>
	</div>
</body>
</html>