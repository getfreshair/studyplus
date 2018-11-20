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
					<h2>개인환급리스트</h2>
					<button name="updateSingleReward" id="updateSingleRewardBtn" class="btn btn-primary" style="float:right; margin-top:15px; margin-right:100px; font-size:15px;">선택처리</button>
					<hr>
					<div class="first-div" style="height:400px">
						<table id="memberListTable" class="table table-hover" align="center" name="memberListTable" style="font-size:14px; text-align:center">
							<tr class="head">
								<th width="2%"><input type="checkbox" id="masterCheck"></th>
								<th width="8%">회원번호</th>
								<th width="10%">아이디</th>
								<th width="10%">닉네임</th>
								<th width="7%">새싹레벨</th>
								<th width="15%">휴대전화</th>
								<th width="15%">신청일</th>
								<th width="10%">관심분야</th>
								<th width="10%">상태</th>
							</tr>
							<c:forEach items="${data.list}"  var="singleRewardList" >
									<c:if test="${singleRewardList.REWARD_STATUS eq 0}">
									<tr>
									<td><input type="checkbox" class="childCheck" name="selectRewardCode" value="${singleRewardList.REWARD_CODE}"></td>
									<td>${singleRewardList.MEMBER_CODE}</td>
									<td>${singleRewardList.MEMBER_ID}</td>
									<td>${singleRewardList.MEMBER_NICKNAME}</td>
									<td>${singleRewardList.NEEDLEVEL_LEVEL}</td>
									<td>${singleRewardList.MEMBER_PHONE}</td>
									<td>${singleRewardList.REWARD_APPDATE}</td>
									<td>${singleRewardList.CATEGORY_NAME}</td>
									<c:choose>
										<c:when test="${singleRewardList.REWARD_STATUS eq 0}">
										<td>대기</td>
										</c:when>
									</c:choose>
									</tr>
									</c:if>
							</c:forEach>
						</table>
						<div id="pagingArea" align="center">
			<c:if test="${data.pi.currentPage <= 1}">
				[이전] &nbsp;
			</c:if>
			<c:if test="${data.pi.currentPage > 1}">
				<c:url var="blistBack" value="/getSingleRewardList.do">
					<c:param name="currentPage" value="${data.pi.currentPage - 1}"/>
				</c:url>
				<a href="${ blistBack }">[이전]</a>
				
			</c:if>
			
			<c:forEach var="p" begin="${data.pi.startPage}" end="${data.pi.endPage}">
				<c:if test="${p eq data.pi.currentPage }">
					<font color ="red" size="4"><b>[${p}]</b></font>
				</c:if>
				<c:if test="${p ne data.pi.currentPage }">
					<c:url var="blistCheck" value="getSingleRewardList.do">
						<c:param name="currentPage" value="${p}"/>
					</c:url>
					<a href="${blistCheck}">${p}</a>
				</c:if>
			</c:forEach>
			
			<c:if test="${data.pi.currentPage >= data.pi.maxPage }">
				&nbsp; [다음]
			</c:if>
			<c:if test="${data.pi.currentPage < data.pi.maxPage}">
				<c:url var="blistEnd" value="getSingleRewardList.do">
					<c:param name="currentPage" value="${data.pi.currentPage + 1}"/>
				</c:url>
				&nbsp;
				<a href="${blistEnd}">[다음]</a>
			</c:if>
		</div>
				<script>
				$(document).ready(function () {
				    $("#masterCheck").click(function () {
				        $(".childCheck").prop('checked', $(this).prop('checked'));
				    });
				});
				$('#updateSingleRewardBtn').click(function(){
					var checkBoxs = document.getElementsByName("selectRewardCode"); // 체크박스 객체
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
						alert('지급 완료할 회원을 선택해 주세요.')
						return;
					}
					$.ajax({
						url:"updateSingleReward.do",
						type:"get",
						data:{rewardCode:rowid},
						success:function(data){
							var data = JSON.parse(data);
							alert(data+"명의 회원 지급 완료했습니다.");
							location.reload();
						},
						error:function(){
							console.log("에러 발생!");
						}
					})
				})
				</script>	
		</div>
					<br><br><br><br>
					<h5>개인환급내역</h5>
					<div class="second-div" style="height:300px">
						<table id="singleRewardHistoryTable" class="table table-hover"  style="font-size:14px; text-align:center">
							<tr class="head">
								<th width="8%">회원번호</th>
								<th width="10%">아이디</th>
								<th width="10%">닉네임</th>
								<th width="7%">새싹레벨</th>
								<th width="15%">휴대전화</th>
								<th width="15%">지급일</th>
								<th width="10%">관심분야</th>
								<th width="10%">상태</th>
							</tr>
						</table>
					</div>
						<div class="searchById" style="margin-left: 300px; getSingleRewardListoverflow:auto;">
							<div class="option"
								style="display: inline-block; maring-top: 17px; font-size: 20px;">
								<select class="form-control" id="searchOption"
									style="width: 150px; height: 40px; margin-top: 20px; display: inline-block;">
									<option value="userId">아이디</option>
									<option value="userNick">닉네임</option>
								</select>
							</div>

							<input class="form-control" type="search" id="keyword"
								style="width: 300px; padding-down: 30px; margin-top: 14px; height: 40px; font-size: 14px; display: inline-block;">
							<button class="btn btn-primary" id="searchBtn" name="searchBtn1" onclick="searchSingleRewardHistory()"
								style="font-size: 14px; margin-bottom:5px; display: inline-block; height: 35px;">검색하기</button>
							<script>
								function searchSingleRewardHistory(){
									var option = $("#searchOption").val();
									var keyword = $("#keyword").val();
									
									$.ajax({
										url:"searchSingleRewardHistory.do",
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
								}
									function createTable(data){
										var table = document.querySelector('#singleRewardHistoryTable');
										html = 	'<tr class="head">'+
										'<th width="8%">회원번호</th>'+
										'<th width="10%">아이디</th>'+
										'<th width="10%">닉네임</th>'+
										'<th width="7%">새싹레벨</th>'+
										'<th width="15%">휴대전화</th>'+
										'<th width="15%">지급일</th>'+
										'<th width="10%">관심분야</th>'+
										'<th width="10%">상태</th></tr>'
										for(var i = 0; i < data.length; i++){
											console.log("12");
											html += '<tr><td>'+data[i].MEMBER_CODE+'</td>'+
													'<td>'+data[i].MEMBER_ID+'</td><td>'
													+data[i].MEMBER_NICKNAME+ '</td><td>' + data[i].NEEDLEVEL_LEVEL + '</td><td>'
													+data[i].MEMBER_PHONE + '</td><td>' + data[i].REWARD_ISSUEDATE + '</td><td>'
													+data[i].CATEGORY_NAME + '</td><td>' + '지급완료'+'</td><tr>';
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