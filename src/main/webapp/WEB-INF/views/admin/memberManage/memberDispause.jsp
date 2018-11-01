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
		padding-left:10px;
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
					<h2 style="padding-top:10px;">휴면계정관리</h2>
					<p style="padding-top:2px; padding-left:2px;">휴면계정 처리와 휴면계정의 목록을 확인 할 수 있습니다.</p>
					<hr>
					<h5 style=>휴면처리가 필요한 계정</h5>
					<div class="first-div" style="height:300px; overflow:auto;">
					<button class="btn btn-default" id="selectProcessBtn"
								name="selectProcessBtn" style="font-size:14px ; float:right; margin-right:50px;">선택처리</button>
						<table id="memberListTable" class="table table-hover" style="font-size:14px; text-align:center">
							<tr class="head">
								<th width="1%"><input type="checkbox" class="masterCheck1"></th>
								<th width="8%">회원번호</th>
								<th width="15%">아이디</th>
								<th width="10%">닉네임</th>
								<th width="7%">성별</th>
								<th width="20%">휴대전화</th>
								<th width="10%">문자수신여부</th>
								<th width="20%">최종로그인</th>
							</tr>
							<c:forEach items="${data}"  var="disPauseList" >
							  <c:if test="${disPauseList.MEMBER_STATUS eq 0}">
								<tr>
								<td width="10%"><input type="checkbox" class="chlidCheck1" name ="selectBlockCode" value="${disPauseList.MEMBER_CODE}"></td>
								<td>${disPauseList.MEMBER_CODE}</td>
								<td>${disPauseList.MEMBER_ID}</td>
								<td>${disPauseList.MEMBER_NICKNAME}</td>
								<td>${disPauseList.MEMBER_GENDER}</td>
								<td>${disPauseList.MEMBER_PHONE}</td>
								<td>${disPauseList.MEMBER_SMSCONFIRMATION}</td>
								<td>${disPauseList.LOGINRECORD_DATE}</td>
								</tr>
							 </c:if>
							</c:forEach>
						</table>
					</div>
					
						<script>
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
							alert('휴면 처리할 회원을 선택해 주세요.')
							return;
						}
						$.ajax({
							url:"adminDispauseUpdate.do",
							type:"get",
							data:{dispauseid:rowid},
							success:function(data){
								var data = JSON.parse(data);
								alert(data+"명의 회원이 휴면처리 되었습니다..");
								location.reload();
							},
							error:function(){
								console.log("에러 발생!");
							}
						})
						return false;
						$(document).ready(function () {
						    $("#masterCheck1").click(function () {
						        $(".childCheck1").prop('checked', $(this).prop('checked'));
						    });
						});
						})
			  		});
					</script>
					<div class="second-div" style="height:300px;">
						<h5>휴면계정목록</h5>
						<table id="dipauseMemberListTable" class="table table-hover" style="font-size:14px; text-align:center">
							<tr class="head">
								<th width="1%"><input type="checkbox" class="masterCheck"></th>
								<th width="8%">회원번호</th>
								<th width="15%">아이디</th>
								<th width="10%">닉네임</th>
								<th width="7%">성별</th>
								<th width="20%">휴대전화</th>
								<th width="10%">문자수신여부</th>
								<th width="20%">최종로그인</th>
							</tr>
						</table>
						<div class="searchById" style="margin-left: 300px;">
							<div class="option"
								style="display: inline-block; maring-top: 17px; font-size: 20px;">
								<select class="form-control" id="searchOption"
									style="width: 150px; height: 40px; margin-top: 20px; display: inline-block;">
									<option value="memberId">아이디</option>
									<option value="memberCode">유저번호</option>
								</select>
							</div>

							<input class="form-control" type="search" id="keyword"
								style="width: 300px; padding-down: 30px; margin-top: 14px; height: 40px; font-size: 14px; display: inline-block;">
							<button class="btn btn-primary" id="searchBtn" name="searchBtn1" onclick="getDispauseHistory();"
								style="font-size: 14px; padding-down: 30px; margin-bottom: 8px; display: inline-block; height: 30px;">검색하기</button>
							<script>
						function getDispauseHistory(){
							var option = $("#searchOption").val();
							var keyword = $("#keyword").val();
							
							$.ajax({
								url:"adminSearchDispauseHistory.do",
								type:"post",
								data:{option:option,
									 keyword:keyword},
								success:function(data){
									JSON.stringify(data);
									createTable(data);
									console.log(data.map.list[0]);
									console.log(data.map.list[0].loginrecord_Date);
									$(document).ready(function () {
									    $("#masterCheck2").click(function () {
									        $(".childCheck2").prop('checked', $(this).prop('checked'));
									    });
									});
								},
								error:function(){
									console.log("에러 발생!");
								}
							})
							return false;
						}
						function createTable(data){
						var table = document.querySelector('#dipauseMemberListTable');
						html = '<tr class="head">'+
						'<th width="1%">'+
						'<input type="checkbox"'+ 'class="masterCheck2"></th>'+
						'<th width="8%">회원번호</th>'+
						'<th width="15%">아이디</th>'+
						'<th width="10%">닉네임</th>'+
						'<th width="7%">성별</th>'+
						'<th width="20%">휴대전화</th>'+
						'<th width="10%">문자수신여부</th>'+
						'<th width="20%">최종로그인</th></tr>'
						for(var i = 0; i < data.map.list.length; i++){
							console.log("12");
							html += '<tr><td><input onclick='+'"event.cancelBubble=true"'+ ' type="checkbox"'+ 'name="selectMemberCode" ' + 'class="childCheck2"' + 'value="'+data.map.list[i].member_Code+'"></td>'+
									'<td>'+data.map.list[i].member_Code+'</td><td>'
									+data.map.list[i].member_Id+ '</td><td>' + data.map.list[i].member_Nickname + '</td><td>'
									+data.map.list[i].member_Gender + '</td><td>' + data.map.list[i].member_Phone + '</td><td>'
									+data.map.list[i].member_SMSConfirmation + '</td><td>' + data.map.list[i].loginrecord_Date+'</td><tr>';
						}
						table.innerHTML = html;
						
					}
					</script>
				
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>