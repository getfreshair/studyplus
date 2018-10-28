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
					<h2>공지사항</h2>
					<hr>
					<div class="first-div">
						<table id="noticeListTable" class="table table-hover"
							style="font-size: 14px; text-align: center">
							<tr class="head">
								<th width="2%"><input type="checkbox" class="masterCheck"></th>
								<th width="8%">게시물번호</th>
								<th width="15%">제목</th>
								<th width="10%">작성자</th>
								<th width="20%">작성일</th>
								<th width="20%">조회수</th>
								<th width="15%">관리</th>
							</tr>
							<tr>
								<td width="2%"><input type="checkbox" class="masterCheck"></td>
								<td width="8%">게시물번호</td>
								<td width="15%">제목</td>
								<td width="10%">작성자</td>
								<td width="20%">작성일</td>
								<td width="20%">조회수</td>
								<td width="15%">관리</td>
							</tr>
						</table>
					<div class="searchById" style="margin-left:50px;">
					
					<button class="btn btn-primary" id="deleteNotice" name="delete" style="margin-bottom:6px; margin-right:150px; font-size:14px; display:inline-block;">선택삭제</button>
					<div class="option" style="display:inline-block; maring-top:17px;font-size:20px;">
					<select class="form-control" id="searchOption" 
								style="width:150px; height:40px; margin-top:20px;display:inline-block;" >
							<option value="noticeListNum">게시물번호</option>
							<option value="noticeTitle">제목</option>
					</select>
					</div>
					
					<input class="form-control" type="search" id="searchAll"
									style="width:300px; padding-down:30px; margin-top:14px; height:40px; font-size:14px; display:inline-block;">
					<button class="btn btn-primary" id="searchBtn"
								name="searchBtn1" style="font-size:14px; margin-bottom:6px; display:inline-block;height:35px;">검색하기</button>
					<button type="button" class="btn btn-info btn-lg" style="margin-bottom:6px; margin-right:150px; 
								font-size:14px; display:inline-block;" data-toggle="modal" data-target="#myModal">글쓰기</button>
					<div id="myModal" class="modal fade" role="dialog">
					  <div class="modal-dialog">
					
						    <!-- Modal content-->
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title">공지사항 작성</h5>
						      </div>
						      	<label>제목</label>
						      	<input class="form-control" id="noticeTitle" style="width:94%; margin-left:14px">
						        <label class="textArea">내용</label>
						      <div class="modal-body">
								<textarea class="form-control" id="textArea" style="width : 100% !important; height:200px !important;">
			         	 		</textarea>
						      </div>
						      <div class="modal-footer">
						      	<button type="button" class="btn btn-success">작성</button>
						        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						      </div>
						    </div>
					  </div>
					</div>
					<%-- <button class="btn btn-warning" id="deleteNotice" name="delete" style=">글쓰기</button> --%>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>