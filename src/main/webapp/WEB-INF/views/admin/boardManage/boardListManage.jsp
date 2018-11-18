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
					<h2>게시판 관리</h2>
					<hr>
					<div class="firt-div">
					<table id="boardListTable" class="table table-hover" style="font-size:14px; text-align:center">
						<tr class="head">
							<th width="2%"><input type="checkbox" id="masterCheck"></th>
							<th width="5%">글번호</th>
							<th width="8%">작성자번호</th>
							<th width="10%">작성자</th>
							<th width="20%">스터디그룹이름</th>
							<th width="10%">글내용</th>
							<th width="10%">작성일</th>
							<th width="10%">글종류</th>
							<th width="10%">구분</th>
							<th width="10%">상태</th>
						</tr>
						<c:forEach items="${data.list}"  var="boardList" >
									<input type="hidden" name="selectType" value="${boardList.TYPE}">
									<tr>
									<td><input type="checkbox" class="childCheck" name="selectBoardCode" value="${boardList.CODE}"></td>
									<td>${boardList.CODE}</td>
									<td>${boardList.MEMBER}</td>
									<td>${boardList.NICK}</td>
									<td>${boardList.GROUPNAME}</td>
									<td>${boardList.CONTENT}</td>
									<td>${boardList.POST}</td>
									
									<c:choose>
										<c:when test="${boardList.BOARD eq 0}">
										<td>공지</td>
										</c:when>
										<c:when test="${boardList.BOARD eq 1}">
										<td>자유</td>
										</c:when>
										<c:otherwise>
										<td>질문</td>
										</c:otherwise>
									</c:choose>
									<td>${boardList.TYPE}</td>
									<c:choose>
										<c:when test="${boardList.STATUS eq 0}">
										<td>게시</td>
										</c:when>
										<c:when test="${boardList.STATUS eq 1}">
										<td>삭제</td>
										</c:when>
										<c:when test="${boardList.STATUS eq 2}">
										<td>제재</td>
										</c:when>
									</c:choose>
									</tr>
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
					</div>
					<div class="second-div">
					<div class="searchById" style="margin-left:50px;">
					<button type="button" id="penaltyBoard" class="btn btn-warning" style="margin-bottom:6px; margin-right:150px; font-size:14px; display:inline-block;">게시물제재</button>
					<div class="option" style="display:inline-block; maring-top:17px;font-size:20px;">
					<select class="form-control" id=searchOpion 
								style="width:150px; height:40px; margin-top:20px;display:inline-block;" >
							<option value="boardContent">내용</option>
							<option value="memberCode">회원번호</option>
					</select>
					</div>
					
					<input class="form-control" type="search" id="keyword"
									style="width:300px; padding-down:30px; margin-top:14px; height:40px; font-size:14px; display:inline-block;">
					<button type="button" class="btn btn-primary" id="searchBtn" onclick="searchBoardList();"
								name="searchBtn1" style="font-size:14px; margin-bottom:6px; display:inline-block;height:35px;">검색하기</button>
					<button class="btn btn-danger" onclick="searchBlack();" id="deleteNotice" name="delete" style="margin-bottom:6px; margin-right:150px; 
								font-size:14px; display:inline-block;">불량게시물탐지</button>
					</div>
					<script>
						function searchBlack(){
							$.ajax({
								url:"searchBlack.do",
								type:"post",
								success:function(data){
									console.log("들어왔어엉");
									createTable(data);
									$(function(){
							  			$('#penaltyBoard').click(function(){
							  			var checkBoxs = document.getElementsByName("selectBoardCode"); // 체크박스 객체
										var checkType = document.getElementsByName("selectType");
										console.log("checkBoxs확인?"+checkBoxs);
										console.log(checkBoxs);
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
											if(checkBoxs[i].checked == true && checkType[i].value == '그룹'){
												checkRow = checkBoxs[i].value;
												console.log(checkRow);
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
											alert('제재할 게시물을 선택해 주세요.')
											return;
										}
										$.ajax({
											url:"updateBoardStatus.do",
											type:"post",
											data:{boardCode:rowid},
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
								},
								error:function(){
									console.log("에러 발생!");
								}
							})
						}
						function createTable(data){
							var table = document.querySelector('#boardListTable');
							html = '<tr class="head">'+
							'<th width="2%"><input type="checkbox" id="masterCheck"></th>'+
							'<th width="5%">글번호</th>'+
							'<th width="8%">작성자번호</th>'+
							'<th width="10%">작성자</th>'+
							'<th width="20%">스터디그룹이름</th>'+
							'<th width="10%">글내용</th>'+
							'<th width="10%">작성일</th>'+
							'<th width="10%">글종류</th>'+
							'<th width="10%">상태</th></tr>'
							console.log("data.length"+data.length);
							
							for(var i = 0; i < data.length; i++){
								console.log("12");
								html += '<tr><td><input onclick='+'"event.cancelBubble=true"'+ ' type="checkbox"'+ 'name="selectBoardCode" ' + 'class="childCheck"' + 'value="'+data[i].CODE+'"></td><td>'
										+data[i].CODE+ '</td><td>' + data[i].MEMBER + '</td><td>'
										+data[i].NICK + '</td><td>' + data[i].GROUPNAME + '</td><td>'
										+data[i].CONTENT + '</td><td>' + data[i].POST+'</td><td name="selectType" value="'+data[i].TYPE+'">' + 
										data[i].TYPE + '</td><td>'	+ data[i].STATUS + '</td></tr>';
							}
							table.innerHTML = html;
					
						}
						
						function searchBoardList(){
							var option = $("#searchOpion").val();
							var keyword = $("#keyword").val();
							location.href = "getGroupBoardList.do?keyword=" + keyword + "&option=" + option;
						}
						$(document).ready(function () {
						    $("#masterCheck").click(function () {
						        $(".childCheck").prop('checked', $(this).prop('checked'));
						    });
						});
				    	$(function(){
				  			$('#penaltyBoard').click(function(){
							var checkBoxs = document.getElementsByName("selectBoardCode"); // 체크박스 객체
							var checkType = document.getElementsByName("selectType");
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
								if(checkBoxs[i].checked == true && checkType[i].value == '그룹'){
									checkRow = checkBoxs[i].value;
									console.log(checkRow);
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
								alert('제재할 게시물을 선택해 주세요.')
								return;
							}
							$.ajax({
								url:"updateBoardStatus.do",
								type:"post",
								data:{boardCode:rowid},
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
</body>
</html>