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
					<h2>공지사항</h2>
					<hr>
					<div class="first-div">
						<table id="noticeListTable" class="table table-hover"
							style="font-size: 14px; text-align: center">
							<tr class="head">
								<th width="2%"><input type="checkbox" id="masterCheck"></th>
								<th width="8%">게시물번호</th>
								<th width="15%">제목</th>
								<th width="10%">작성자</th>
								<th width="15%">작성일</th>
								<th width="5%">조회수</th>
								<th width="25%">내용</th>
							</tr>
							<c:forEach items="${data.list}"  var="noticeList" >
								  <c:if test="${noticeList.NOTICE_STATUS eq 0}">
									<tr>
									<td><input type="checkbox" class="childCheck" name="selectNoticeCode" value="${noticeList.NOTICE_CODE}"></td>
									<td>${noticeList.NOTICE_CODE}</td>
									<td>${noticeList.NOTICE_TITLE}</td>
									<td>관리자</td>
									<td>${noticeList.NOTICE_ENROLLDATE}</td>
									<td>${noticeList.NOTICE_COUNT}</td>
									<td>${noticeList.NOTICE_CONTENT}</td>
									</tr>
								 </c:if>
							</c:forEach>
						</table>
						<div id="pagingArea" align="center">
			<c:if test="${data.pi.currentPage <= 1}">
				[이전] &nbsp;
			</c:if>
			<c:if test="${data.pi.currentPage > 1}">
				<c:url var="blistBack" value="/getNoticeList.do">
					<c:param name="currentPage" value="${data.pi.currentPage - 1}"/>
					<c:param name="option" value="${data.option }"/>
					<c:param name="keyword" value="${data.keyword }"/>
				</c:url>
				<a href="${ blistBack }">[이전]</a>
				
			</c:if>
			
			<c:forEach var="p" begin="${data.pi.startPage}" end="${data.pi.endPage}">
				<c:if test="${p eq data.pi.currentPage }">
					<font color ="red" size="4"><b>[${p}]</b></font>
				</c:if>
				<c:if test="${p ne data.pi.currentPage }">
					<c:url var="blistCheck" value="getNoticeList.do">
						<c:param name="currentPage" value="${p}"/>
						<c:param name="option" value="${data.option }"/>
						<c:param name="keyword" value="${data.keyword }"/>
					</c:url>
					<a href="${blistCheck}">${p}</a>
				</c:if>
			</c:forEach>
			
			<c:if test="${data.pi.currentPage >= data.pi.maxPage }">
				&nbsp; [다음]
			</c:if>
			<c:if test="${data.pi.currentPage < data.pi.maxPage}">
				<c:url var="blistEnd" value="getNoticeList.do">
					<c:param name="currentPage" value="${data.pi.currentPage + 1}"/>
					<c:param name="option" value="${data.option }"/>
					<c:param name="keyword" value="${data.keyword }"/>
				</c:url>
				&nbsp;
				<a href="${blistEnd}">[다음]</a>
			</c:if>
		</div>
					<div class="searchById" style="margin-left:50px;">
					
					<button class="btn btn-primary" id="deleteNotice" name="delete" style="margin-bottom:6px; margin-right:150px; font-size:14px; display:inline-block;">선택삭제</button>
					<div class="option" style="display:inline-block; maring-top:17px;font-size:20px;">
					<select class="form-control" id="searchOption" name="option"
								style="width:150px; height:40px; margin-top:20px;display:inline-block;" >
							<option value="noticeCode">게시물번호</option>
							<option value="noticeTitle">제목</option>
					</select>
					</div>
					
					<input class="form-control" type="search" id="keyword" name="searchKeyword"
									style="width:300px; padding-down:30px; margin-top:14px; height:40px; font-size:14px; display:inline-block;">
					<button type="button" class="btn btn-primary" id="searchBtn" onclick="searchNotice();"
								name="searchBtn1" style="font-size:14px;  margin-bottom:6px; display:inline-block;height:35px;">검색하기</button>
					<button type="button" class="btn btn-info btn-lg" style="margin-bottom:6px; margin-right:150px; 
								font-size:14px; display:inline-block;" data-toggle="modal" data-target="#myModal">글쓰기</button>
					<script>
				    	function searchNotice(){
			      		var keyword = $("#keyword").val();
			      		var option = $("#searchOption").val();
			      	
			      		location.href = "getNoticeList.do?keyword=" + keyword + "&option=" + option;
			     	 	} 
					</script>
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
						      	<button type="button" class="btn btn-success" onclick="noticeInsert();">작성</button>
						        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						      <script>
						  
						      	function noticeInsert(){
						      		var noticeTitle = $("#noticeTitle").val();
						      		var textArea = $("#textArea").val();
						      		
						      		console.log(noticeTitle);
						      		console.log(textArea);
						      		$.ajax({
						      			url:"adminInsertNotice.do",
						      			type:"post",
						      			data:{title:noticeTitle,
						      				content:textArea},
						      			success:function(data){
						      				alert("공지사항이 등록되었습니다.");
						      				$("#myModal").modal('hide');
						      				location.reload();
						      			},
						      			error:function(){
						      				console.log("에러발생!");
						      			}
						      			
						      		})
						      	}
						    	$(document).ready(function () {
								    $("#masterCheck").click(function () {
								        $(".childCheck").prop('checked', $(this).prop('checked'));
								    });
								});
						    	$(function(){
						  			$('#deleteNotice').click(function(){
									var checkBoxs = document.getElementsByName("selectNoticeCode"); // 체크박스 객체
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
										alert('삭제할 게시물을 선택해 주세요.')
										return;
									}
									$.ajax({
										url:"adminDeleteNotice.do",
										type:"post",
										data:{noticeCode:rowid},
										success:function(data){
											var data = JSON.parse(data);
											alert(data+"개의 게시물이 삭제 되었습니다.");
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
						    </div>
					  </div>
					</div>
					
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>