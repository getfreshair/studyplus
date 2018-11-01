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
					<div class="first-div" style="height:400px;">
						<table id="memberListTable" class="table table-hover" style="font-size:14px; text-align:center">
							<tr class="head">
								<th width="2%"><input type="checkbox" class="masterCheck"></th>
								<th width="8%">회원번호</th>
								<th width="15%">아이디</th>
								<th width="10%">닉네임</th>
								<th width="20%">성별</th>
								<th width="20%">휴대전화</th>
								<th width="15%">문자수신여부</th>
								<th width="10%">최종로그인</th>
							</tr>
							<c:forEach items="${data}"  var="disPauseList" >
							  <c:if test="${disPauseList.MEMBER_STATUS eq 0}">
								<tr>
								<td width="10%"><input type="checkbox" class="chlidCheck" name ="selectBlockCode" value="${penaltyEndList.BLOCK_CODE}"></td>
								<td>${disPauseList.MEMBER_CODE}</td>
								<td>${disPauseList.MEMBER_ID}</td>
								<td>${disPauseList.MEMBER_NICKNAME}</td>
								<td>${disPauseList.MEMBER_GENDER}</td>
								<td>${disPauseList.MEMBER_PHONE}</td>
								<td>${disPauseList.MEMBER_ID}</td>
								<td>${disPauseList.MEMBER_ID}</td>
								</tr>
							 </c:if>
							</c:forEach>
						</table>
					</div>
					<div class="second-div" style="height:300px;">
						<h5>휴면계정목록</h5>
						<table id="memberListTable" class="table table-hover" style="font-size:14px; text-align:center">
							<tr class="head">
								<th width="2%"><input type="checkbox" class="masterCheck"></th>
								<th width="8%">회원번호</th>
								<th width="15%">아이디</th>
								<th width="10%">닉네임</th>
								<th width="20%">성별</th>
								<th width="20%">휴대전화</th>
								<th width="15%">문자수신여부</th>
								<th width="10%">최종로그인</th>
							</tr>
						</table>
						<div class="searchById" style="margin-left: 300px;">
							<div class="option"
								style="display: inline-block; maring-top: 17px; font-size: 20px;">
								<select class="form-control" id="searchOption"
									style="width: 150px; height: 40px; margin-top: 20px; display: inline-block;">
									<option value="userId">아이디</option>
									<option value="userNum">유저번호</option>
								</select>
							</div>

							<input class="form-control" type="search" id="searchAll"
								style="width: 300px; padding-down: 30px; margin-top: 14px; height: 40px; font-size: 14px; display: inline-block;">
							<button class="btn btn-primary" id="searchBtn" name="searchBtn1"
								style="font-size: 14px; padding-down: 30px; margin-bottom: 8px; display: inline-block; height: 30px;">검색하기</button>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>