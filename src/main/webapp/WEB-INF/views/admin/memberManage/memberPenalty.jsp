<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
th{
	text-align: center !important;
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
						
						<h4>최근 제재 :  명</h4>
						<table class="table table-hover" align="center" id="penaltyMember" style="font-size:15px; text-align:center; ">
							<tr class="head">
								<th width="15%">회원번호</th>
								<th width="15%">아이디</th>
								<th width="15%">정지일</th>
								<th width="15%">만료일</th>
							</tr>
							<c:forEach items="${data}"  var="penaltyList" >
							  <c:if test="${penaltyList.BLOCK_STATUS eq 0}">
								<tr>
								<td>${penaltyList.MEMBER_CODE}</td>
								<td>${penaltyList.MEMBER_ID}</td>
								<td>${penaltyList.BLOCK_STARTDATE}</td>
								<td>${penaltyList.BLOCK_ENDDATE}</td>
								</tr>
							 </c:if>
							</c:forEach>
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
								<th width="15%"><input type="checkbox" id="masterCheck"></th>
								<th width="15%">회원번호</th>
								<th width="15%">아이디</th>
								<th width="15%">정지일</th>
								<th width="15%">만료일</th>
							</tr>
				
							<c:forEach items="${data2}"  var="penaltyEndList" >
							  <c:if test="${penaltyEndList.BLOCK_STATUS eq 0}">
								<tr>
								<td width="10%"><input type="checkbox" class="chlidCheck" name ="selectBlockCode" value="${penaltyEndList.BLOCK_CODE}"></td>
								<td>${penaltyEndList.MEMBER_CODE}</td>
								<td>${penaltyEndList.MEMBER_ID}</td>
								<td>${penaltyEndList.BLOCK_STARTDATE}</td>
								<td>${penaltyEndList.BLOCK_ENDDATE}</td>
								</tr>
							 </c:if>
							</c:forEach>
						</table>
						<script>
							$(function() {
								$("#masterCheck").click(function() {
									$(".chlidCheck").prop('checked',$(this).prop('checked'));
								});
							});
						
			  			$(function(){
			  			$('#selectProcessBtn').click(function(){
						var checkBoxs = document.getElementsByName("selectBlockCode"); // 체크박스 객체
						var len = checkBoxs.length;
						var checkRow = "";
						var checkCnt = 0;
						var checkLast = "";
						var rowid = '';
						var values = "";
						var cnt = 0;
						
						for(var i = 0; i < len ; i ++){
							if(checkBoxs[i].checked == true){
								checkCnt++;
								checkLast = i;
							}
						}
						for(var i = 0; i < len ; i ++){
							if(checkBoxs[i].checked == true){
								checkRow = checkBoxs[i].value;
								
								if(checkCnt == 1){
									rowid += checkRow;
								} else {
									if(i == checkLast){
										rowid += checkRow ;
									} else {
										rowid += checkRow + ",";
									}
								}
								
								cnt ++;
								checkRow = '';
							}	
						}
						if(rowid === ''){
							alert('해제 처리할 회원을 선택해 주세요.')
							return;
						}
						$.ajax({
							url:"adminPenaltyEndMember.do",
							type:"get",
							data:{blockCode:rowid},
							success:function(data){
								var data = JSON.parse(data);
								alert(data+"명의 회원이 제재 해지되었습니다.");
								location.reload();
							},
							error:function(){
								console.log("에러 발생!");
							}
						})
						return false;
						
						})
			  		});
					</script>
					</div>
			
				<div class="row2">
				<h3>전체 제재이력</h3>
				<div>
					<table class="table table-hover" id="penaltyMemberList" style="font-size:15px; text-align:center;">
					<tr class="head">
						<th width="7%">제재번호</th>
						<th width="7%">회원번호</th>
						<th width="10%">아이디</th>
						<th width="15%">제재일자</th>
						<th width="15%">제재만료일</th>
						<th width="25%">사유</th>
						<th width="7%">구분</th>
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
							<option value="memberId">아이디</option>
							<option value="memberCode">유저번호</option>
							<option value="reason">사유</option>
					</select>
					</div>
					<input class="form-control" type="search" id="keyword"
									style="width:300px; padding-down:30px; margin-top:14px; height:40px; font-size:14px; display:inline-block;">
					<button class="btn btn-primary" id="searchBtn"
								name="searchBtn1" onclick="getPenaltyHistory();" style="font-size:14px; padding-down:30px; margin-bottom:8px; display:inline-block;height:30px;">검색하기</button>
					<script>
						function getPenaltyHistory(){
							var option = $("#searchOption").val();
							var keyword = $("#keyword").val();
							
							$.ajax({
								url:"adminSearchPenaltyHistory.do",
								type:"get",
								data:{option:option,
									 keyword:keyword},
								success:function(data){
									console.log(data);
									createTable(data);
								},
								error:function(){
									console.log("에러 발생!");
								}
							})
							return false;
						}
					function createTable(data){
						var table = document.querySelector('#penaltyMemberList');
						html = '<tr class="head">'+
						'<th width="7%">제재번호</th>'+
						'<th width="7%">회원번호</th>'+
						'<th width="10%">아이디</th>'+
						'<th width="15%">제재일자</th>'+
						'<th width="15%">제재만료일</th>'+
						'<th width="25%">사유</th>'+
						'<th width="7%">구분</th>'+
						'</tr>'
						console.log(data.length);
						for(var i = 0; i < data.length; i++){
							console.log("12");
							html += '<tr><td>'+data[i].BLOCK_CODE+'</td><td>'
									+data[i].MEMBER_CODE+ '</td><td>' + data[i].MEMBER_ID + '</td><td>'
									+data[i].BLOCK_STARTDATE + '</td><td>' + data[i].BLOCK_ENDDATE + '</td><td>'
									+data[i].BLOCK_REASON + '</td><td>' + data[i].BLOCK_STATUS+'</td><tr>';
						}
						table.innerHTML = html;
						
					}
					</script>
					</div>
			</div>
		</div>
	</div>
</body>
</html>