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
					<h2>그룹환급리스트</h2>
					<hr>
					<div class="wrap-div" >
						<button type="button"name="selectAll" onclick="clicked();" id = "allBtn"  class="btn btn-warning" style="float:right; maring-right: 50px; font-size:15px;">전체선택</button>
						<button name="memberPenalty" id="updateGroupRewardBtn" class="btn btn-primary" style="float:right;  margin-right:25px; font-size:15px;">선택처리</button>
				<script>
				    function clicked() {
				        $("input:checkbox[id='childCheck']").prop('checked', true);
				    };
					$('#updateGroupRewardBtn').click(function(){
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
							alert('지급 완료할 그룹을 선택해 주세요.')
							return;
						}
						console.log(rowid);
						$.ajax({
							url:"updateGroupReward.do",
							type:"get",
							data:{groupRewardCode:rowid},
							success:function(data){
								var data = JSON.parse(data);
								alert(data+"명의 그룹에 지급 완료했습니다.");
								location.reload();
							},
							error:function(){
								console.log("에러 발생!");
							}
						})
					})
					</script>	
						<p>고입</p>
						<div class="first-div"style="height:500px; overflow: auto" >
							<table id="category1" name="categoryOne" class="table table-hover" style="text-align:center">
								<tr class="head">
									<th width="2%"></th>
									<th width="8%">그룹번호</th>
									<th width="15%">그룹이름</th>
									<th width="10%">그룹목표시간</th>
									<th width="20%">총공부량</th>
									<th width="20%">그룹개설일</th>
									<th width="10%">분야</th>
									<th width="5%">순위</th>
									<th width="10%">상태</th>
								</tr>
								<c:forEach items="${data.list}"  var="groupRewardList" >
									<c:if test="${groupRewardList.CATEGORY_NAME eq '고입'}">
									<tr>
									<td><input type="checkbox" id="childCheck" name="selectRewardCode" value="${groupRewardList.STUDYGROUP_CODE}"></td>
									<td>${groupRewardList.STUDYGROUP_CODE}</td>
									<td>${groupRewardList.STUDYGROUP_NAME}</td>
									<td>${groupRewardList.STUDYGROUP_GOALTIME}</td>
									<td>${groupRewardList.GR_MONTH_TOTAL}</td>
									<td>${groupRewardList.STUDYGROUP_STDATE}</td>
									<td>${groupRewardList.CATEGORY_NAME}</td>
									<td>${groupRewardList.RK}</td>
									<c:choose>
										<c:when test="${groupRewardList.REWARD_STATUS eq 0}">
										<td>대기</td>
										</c:when>
										<c:otherwise>
										<td>지급완료</td>
										</c:otherwise>
									</c:choose>
									</tr>
									</c:if>
								</c:forEach>
							</table>
							<p>대입</p>
							<table id="category2" name="categoryTwo" class="table table-hover" style="text-align:center">
									<tr class="head">
									<th width="2%"></th>
									<th width="8%">그룹번호</th>
									<th width="15%">그룹이름</th>
									<th width="10%">그룹목표시간</th>
									<th width="20%">총공부량</th>
									<th width="20%">그룹개설일</th>
									<th width="10%">분야</th>
									<th width="5%">순위</th>
									<th width="10%">상태</th>
								</tr>
								<c:forEach items="${data.list}"  var="groupRewardList" >
									<c:if test="${groupRewardList.CATEGORY_NAME eq '대입'}">
									<tr>
									<td><input type="checkbox" id="childCheck" name="selectRewardCode" value="${groupRewardList.STUDYGROUP_CODE}"></td>
									<td>${groupRewardList.STUDYGROUP_CODE}</td>
									<td>${groupRewardList.STUDYGROUP_NAME}</td>
									<td>${groupRewardList.STUDYGROUP_GOALTIME}</td>
									<td>${groupRewardList.GR_MONTH_TOTAL}</td>
									<td>${groupRewardList.STUDYGROUP_STDATE}</td>
									<td>${groupRewardList.CATEGORY_NAME}</td>
									<td>${groupRewardList.RK}</td>
									<c:choose>
										<c:when test="${groupRewardList.REWARD_STATUS eq 0}">
										<td>대기</td>
										</c:when>
										<c:otherwise>
										<td>지급완료</td>
										</c:otherwise>
									</c:choose>
									</tr>
									</c:if>
								</c:forEach>
							</table>
							<p>고시</p>
							<table id="category3" name="categoryThree" class="table table-hover" style="text-align:center">
									<tr class="head">
									<th width="2%"></th>
									<th width="8%">그룹번호</th>
									<th width="15%">그룹이름</th>
									<th width="10%">그룹목표시간</th>
									<th width="20%">총공부량</th>
									<th width="20%">그룹개설일</th>
									<th width="10%">분야</th>
									<th width="5%">순위</th>
									<th width="10%">상태</th>
								</tr>
								<c:forEach items="${data.list}"  var="groupRewardList" >
									<c:if test="${groupRewardList.CATEGORY_NAME eq '고시'}">
									<tr>
									<td><input type="checkbox" id="childCheck" name="selectRewardCode" value="${groupRewardList.STUDYGROUP_CODE}"></td>
									<td>${groupRewardList.STUDYGROUP_CODE}</td>
									<td>${groupRewardList.STUDYGROUP_NAME}</td>
									<td>${groupRewardList.STUDYGROUP_GOALTIME}</td>
									<td>${groupRewardList.GR_MONTH_TOTAL}</td>
									<td>${groupRewardList.STUDYGROUP_STDATE}</td>
									<td>${groupRewardList.CATEGORY_NAME}</td>
									<td>${groupRewardList.RK}</td>
									<c:choose>
										<c:when test="${groupRewardList.REWARD_STATUS eq 0}">
										<td>대기</td>
										</c:when>
										<c:otherwise>
										<td>지급완료</td>
										</c:otherwise>
									</c:choose>
									</tr>
									</c:if>
								</c:forEach>
							</table>
							<p>공시</p>
							<table id="category4" name="categoryFour" class="table table-hover" style="text-align:center">
									<tr class="head">
									<th width="2%"></th>
									<th width="8%">그룹번호</th>
									<th width="15%">그룹이름</th>
									<th width="10%">그룹목표시간</th>
									<th width="20%">총공부량</th>
									<th width="20%">그룹개설일</th>
									<th width="10%">분야</th>
									<th width="5%">순위</th>
									<th width="10%">상태</th>
								</tr>
								<c:forEach items="${data.list}"  var="groupRewardList" >
									<c:if test="${groupRewardList.CATEGORY_NAME eq '공시'}">
									<tr>
									<td><input type="checkbox" id="childCheck" name="selectRewardCode" value="${groupRewardList.STUDYGROUP_CODE}"></td>
									<td>${groupRewardList.STUDYGROUP_CODE}</td>
									<td>${groupRewardList.STUDYGROUP_NAME}</td>
									<td>${groupRewardList.STUDYGROUP_GOALTIME}</td>
									<td>${groupRewardList.GR_MONTH_TOTAL}</td>
									<td>${groupRewardList.STUDYGROUP_STDATE}</td>
									<td>${groupRewardList.CATEGORY_NAME}</td>
									<td>${groupRewardList.RK}</td>
									<c:choose>
										<c:when test="${groupRewardList.REWARD_STATUS eq 0}">
										<td>대기</td>
										</c:when>
										<c:otherwise>
										<td>지급완료</td>
										</c:otherwise>
									</c:choose>
									</tr>
									</c:if>
								</c:forEach>
							</table>
								<p>외국어</p>
							<table id="category4" name="categoryFour" class="table table-hover" style="text-align:center">
									<tr class="head">
									<th width="2%"></th>
									<th width="8%">그룹번호</th>
									<th width="15%">그룹이름</th>
									<th width="10%">그룹목표시간</th>
									<th width="20%">총공부량</th>
									<th width="20%">그룹개설일</th>
									<th width="10%">분야</th>
									<th width="5%">순위</th>
									<th width="10%">상태</th>
								</tr>
								<c:forEach items="${data.list}"  var="groupRewardList" >
									<c:if test="${groupRewardList.CATEGORY_NAME eq '외국어'}">
									<tr>
									<td><input type="checkbox" id="childCheck" name="selectRewardCode" value="${groupRewardList.STUDYGROUP_CODE}"></td>
									<td>${groupRewardList.STUDYGROUP_CODE}</td>
									<td>${groupRewardList.STUDYGROUP_NAME}</td>
									<td>${groupRewardList.STUDYGROUP_GOALTIME}</td>
									<td>${groupRewardList.GR_MONTH_TOTAL}</td>
									<td>${groupRewardList.STUDYGROUP_STDATE}</td>
									<td>${groupRewardList.CATEGORY_NAME}</td>
									<td>${groupRewardList.RK}</td>
									<c:choose>
										<c:when test="${groupRewardList.REWARD_STATUS eq 0}">
										<td>대기</td>
										</c:when>
										<c:otherwise>
										<td>지급완료</td>
										</c:otherwise>
									</c:choose>
									</tr>
									</c:if>
								</c:forEach>
							</table>
								<p>취준</p>
							<table id="category4" name="categoryFour" class="table table-hover" style="text-align:center">
								<tr class="head">
									<th width="2%"></th>
									<th width="8%">그룹번호</th>
									<th width="15%">그룹이름</th>
									<th width="10%">그룹목표시간</th>
									<th width="20%">총공부량</th>
									<th width="20%">그룹개설일</th>
									<th width="10%">분야</th>
									<th width="5%">순위</th>
									<th width="10%">상태</th>
								</tr>
								<c:forEach items="${data.list}"  var="groupRewardList" >
									<c:if test="${groupRewardList.CATEGORY_NAME eq '취준'}">
									<tr>
									<td><input type="checkbox" id="childCheck" name="selectRewardCode" value="${groupRewardList.STUDYGROUP_CODE}"></td>
									<td>${groupRewardList.STUDYGROUP_CODE}</td>
									<td>${groupRewardList.STUDYGROUP_NAME}</td>
									<td>${groupRewardList.STUDYGROUP_GOALTIME}</td>
									<td>${groupRewardList.GR_MONTH_TOTAL}</td>
									<td>${groupRewardList.STUDYGROUP_STDATE}</td>
									<td>${groupRewardList.CATEGORY_NAME}</td>
									<td>${groupRewardList.RK}</td>
									<c:choose>
										<c:when test="${groupRewardList.REWARD_STATUS eq 0}">
										<td>대기</td>
										</c:when>
										<c:otherwise>
										<td>지급완료</td>
										</c:otherwise>
									</c:choose>
									</tr>
									</c:if>
								</c:forEach>
							</table>
								<p>자격증</p>
							<table id="category4" name="categoryFour" class="table table-hover" style="text-align:center">
									<tr class="head">
									<th width="2%"></th>
									<th width="8%">그룹번호</th>
									<th width="15%">그룹이름</th>
									<th width="10%">그룹목표시간</th>
									<th width="20%">총공부량</th>
									<th width="20%">그룹개설일</th>
									<th width="10%">분야</th>
									<th width="5%">순위</th>
									<th width="10%">상태</th>
								</tr>
								<c:forEach items="${data.list}"  var="groupRewardList" >
									<c:if test="${groupRewardList.CATEGORY_NAME eq '자격증'}">
									<tr>
									<td><input type="checkbox" id="childCheck" name="selectRewardCode" value="${groupRewardList.STUDYGROUP_CODE}"></td>
									<td>${groupRewardList.STUDYGROUP_CODE}</td>
									<td>${groupRewardList.STUDYGROUP_NAME}</td>
									<td>${groupRewardList.STUDYGROUP_GOALTIME}</td>
									<td>${groupRewardList.GR_MONTH_TOTAL}</td>
									<td>${groupRewardList.STUDYGROUP_STDATE}</td>
									<td>${groupRewardList.CATEGORY_NAME}</td>
									<td>${groupRewardList.RK}</td>
									<c:choose>
										<c:when test="${groupRewardList.REWARD_STATUS eq 0}">
										<td>대기</td>
										</c:when>
										<c:otherwise>
										<td>지급완료</td>
										</c:otherwise>
									</c:choose>
									</tr>
									</c:if>
								</c:forEach>
							</table>
								<p>기타</p>
							<table id="category4" name="categoryFour" class="table table-hover" style="text-align:center">
									<tr class="head">
									<th width="2%"></th>
									<th width="8%">그룹번호</th>
									<th width="15%">그룹이름</th>
									<th width="10%">그룹목표시간</th>
									<th width="20%">총공부량</th>
									<th width="20%">그룹개설일</th>
									<th width="10%">분야</th>
									<th width="5%">순위</th>
									<th width="10%">상태</th>
								</tr>
								<c:forEach items="${data.list}"  var="groupRewardList" >
									<c:if test="${groupRewardList.CATEGORY_NAME eq '기타'}">
									<tr>
									<td><input type="checkbox" id="childCheck" name="selectRewardCode" value="${groupRewardList.STUDYGROUP_CODE}"></td>
									<td>${groupRewardList.STUDYGROUP_CODE}</td>
									<td>${groupRewardList.STUDYGROUP_NAME}</td>
									<td>${groupRewardList.STUDYGROUP_GOALTIME}</td>
									<td>${groupRewardList.GR_MONTH_TOTAL}</td>
									<td>${groupRewardList.STUDYGROUP_STDATE}</td>
									<td>${groupRewardList.CATEGORY_NAME}</td>
									<td>${groupRewardList.RK}</td>
									<c:choose>
										<c:when test="${groupRewardList.REWARD_STATUS eq 0}">
										<td>대기</td>
										</c:when>
										<c:otherwise>
										<td>지급완료</td>
										</c:otherwise>
									</c:choose>
									</tr>
									</c:if>
								</c:forEach>
							</table>
						</div>
						<div class="second-div"style="height:500px; overflow: auto">
							<h3>그룹환급내역</h3>
							<table id="groupRewardHistoryTable" name="categoryFour" class="table table-hover" style="text-align:center">
								<tr class="head">
									<th width="8%">그룹번호</th>
									<th width="15%">그룹이름</th>
									<th width="10%">그룹목표시간</th>
									<th width="20%">방장닉</th>
									<th width="20%">그룹개설일</th>
									<th width="10%">분야</th>
									<th width="5%">지급일</th>
									<th width="10%">상태</th>
								</tr>
							</table>
							<div class="searchById" style="margin-left:300px;">
					<div class="option" style="display:inline-block; maring-top:17px;font-size:20px;">
					<select class="form-control" id="searchOption" 
								style="width:150px; height:40px; margin-top:20px;display:inline-block;" >
							<option value="전체">전체</option>
							<option value="groupCode">그룹번호</option>
							<option value="groupName">그룹이름</option>
					</select>
					</div>
					
					<input class="form-control" type="search" id="keyword"
									style="width:300px; padding-down:30px; margin-top:14px; height:40px; font-size:14px; display:inline-block;">
					<button class="btn btn-primary" id="searchBtn" onclick="searchGroupRewardHistory();"
								name="searchBtn1" style="font-size:14px; padding-down:30px; margin-bottom:8px; display:inline-block;height:35px;">검색하기</button>
					<script>
								function searchGroupRewardHistory(){
									var option = $("#searchOption").val();
									var keyword = $("#keyword").val();
									console.log(option);
									console.log(keyword);
									$.ajax({
										url:"searchGroupRewardHistory.do",
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
										var table = document.querySelector('#groupRewardHistoryTable');
										html = 	'<tr class="head">'+
										'<th width="8%">그룹번호</th>'+
										'<th width="10%">그룹이름</th>'+
										'<th width="10%">그룹목표시간</th>'+
										'<th width="7%">방장닉</th>'+
										'<th width="15%">그룹개설일</th>'+
										'<th width="15%">분야</th>'+
										'<th width="10%">지급일</th>'+
										'<th width="10%">상태</th></tr>'
										for(var i = 0; i < data.length; i++){
											console.log("12");
											html += '<tr><td>'+data[i].STUDYGROUP_CODE+'</td>'+
													'<td>'+data[i].STUDYGROUP_NAME+'</td><td>'
													+data[i].STUDYGROUP_GOALTIME+ '</td><td>' + data[i].MEMBER_NICKNAME + '</td><td>'
													+data[i].STUDYGROUP_STDATE + '</td><td>' + data[i].CATEGORY_NAME + '</td><td>'
													+data[i].REWARD_ISSUEDATE + '</td><td>' + '지급완료'+'</td><tr>';
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
	</div>
</body>
</html>