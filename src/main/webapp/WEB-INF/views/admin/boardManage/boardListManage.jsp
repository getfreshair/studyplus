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
		padding-top:20px;
		padding-left:20px;
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
					<h2>게시판 관리</h2>
					<hr>
					<div class="firt-div">
					<table id="boardListTable" class="table table-hover" style="font-size:14px; text-align:center">
						<tr class="head">
							<th width="2%"><input type="checkbox" class="masterCheck"></th>
							<th width="8%">글번호</th>
							<th width="35%">글내용</th>
							<th width="10%">작성자</th>
							<th width="20%">작성일</th>
							<th width="10%">글분류</th>
							<th width="15%">관리</th>
						</tr>
						<c:forEach items="${data.list}"  var="boardList" >
								  <c:if test="${boardList.NOTICE_STATUS eq 0}">
									<tr>
									<td><input type="checkbox" class="childCheck" name="selectNoticeCode" value="${noticeList.NOTICE_CODE}"></td>
									<td>${boardList.NOTICE_CODE}</td>
									<td>${boardList.NOTICE_TITLE}</td>
									<td>${boardList.NOTICE_ENROLLDATE}</td>
									<td>${boardList.NOTICE_COUNT}</td>
									<td>${boardList.NOTICE_CONTENT}</td>
									</tr>
								 </c:if>
						</c:forEach>
					</table>
					</div>
					<div class="second-div">
					<div class="searchById" style="margin-left:50px;">
					<button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-warning" style="margin-bottom:6px; margin-right:150px; font-size:14px; display:inline-block;">작성자제재</button>
					<div class="option" style="display:inline-block; maring-top:17px;font-size:20px;">
					<select class="form-control" id="searchOption" 
								style="width:150px; height:40px; margin-top:20px;display:inline-block;" >
							<option value="boardTitle">제목</option>
							<option value="memberCode">회원번호</option>
					</select>
					</div>
					
					<input class="form-control" type="search" id="keyword"
									style="width:300px; padding-down:30px; margin-top:14px; height:40px; font-size:14px; display:inline-block;">
					<button type="button" class="btn btn-primary" id="searchBtn" onclick="searchBoardList();"
								name="searchBtn1" style="font-size:14px; margin-bottom:6px; display:inline-block;height:35px;">검색하기</button>
					<button class="btn btn-danger" id="deleteNotice" name="delete" style="margin-bottom:6px; margin-right:150px; 
								font-size:14px; display:inline-block;">불량게시물탐지</button>
					</div>
					<script>
						function searchBoardList(){
							var option = $("#searchOpion").val();
							var keyword = $("#keyword").val();
							
							location.href = "getGroupBoardList.do?keyword=" + keyword + "&option=" + option;
						}
						
					</script>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>