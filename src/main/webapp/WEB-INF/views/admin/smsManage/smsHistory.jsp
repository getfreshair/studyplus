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
					<h2>SMS발송내역</h2>
					<hr class="topline">
					<br>
					<br>
					<br>
					<div class="row1">
						<hr>
							<div class="searchArea searchTotal" align="center">
								<div class="searchByDate">
									<p class="searchDate">보낸날짜</p>
									<input class="form-control" type="date" id="searchDate1"
										style="width:170px; height:50px">
									<input class="form-control" type="date" id="searchDate2"
										style="width:170px; height:50px">
								</div>
								<div class="searchById">
									<p class="searchAll">수신번호</p>
									<input class="form-control" type="search" id="searchOption"
										style="width:300px; height:50px; font-size:20px">
								</div>
								<button class="btn btn-primary" onclick="searchMember();" style="height:40px ;margin-top:25px;  width:100px">검색</button>
							</div>
					</div>
					<hr>
					<div class="table" style="margin-top: 50px">
						<table id="smsListTable" class="table table-hover"
							 name="smsListTable" style="font-size: 14px; text-align: center">
							<tr class="head">
								<th width="5%">번호</th>
								<th width="10%">수신번호</th>
								<th width="10%">수신멤버코드</th>
								<th width="10%">발신번호</th>
								<th width="50%">메세지</th>
							</tr>
						</table>
					<script>
						function reload(){
							location.reload();
						}
						function searchMember(){
							var searchDate1 = $("#searchDate1").val();
							var searchDate2 = $("#searchDate2").val();
							var searchOption = $("#searchOption").val();
						
							$.ajax({
								url:"adminSearchSmsHistory.do",
								type:"post",
								data:{
									 searchDate1:searchDate1,
									 searchDate2:searchDate2,
									 searchOption:searchOption},
								success:function(data){
									console.log(data);
									getSMSHistoryList(data);
								},
								error:function(){
									console.log("에러 발생!");
								}
							})
							return false;
							
						}
							
						function getSMSHistoryList(data){
							var table = document.querySelector('#smsListTable');
							html = '<tr class="head">'+
							'<th width="5%">번호</th>'+
							'<th width="10%">수신번호</th>'+
							'<th width="10%">수신멤버코드</th>'+
							'<th width="10%">발신일</th>'+
							'<th width="50%">메세지</th></tr>'
							console.log(data.length);
							for(var i = 0; i < data.length; i++){
								console.log("12");
								html += '<tr><td>'
										+data[i].SMS_CODE+ '</td><td>' + data[i].SMS_RECEIVERPHONE + '</td><td>'
										+data[i].MEMBER_CODE + '</td><td>'
										+data[i].SMS_SENDDATE + '</td><td>' + data[i].SMS_CONTENT + '</td><td>';
							}
							table.innerHTML = html;		
							
						}
				</script>
					</div>
				</div>
		</div>
		</div>
	</div>
</body>
</html>