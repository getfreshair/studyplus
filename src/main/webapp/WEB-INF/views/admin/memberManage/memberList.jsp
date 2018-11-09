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
	padding:10px;
}
.content{
		float:left;
		width:1330px;
		height:1000px;
		margin-left:20px;
		marign-top:20px;
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
					<h2>회원관리</h2>
					<hr class="topline">
					<br>
					<br>
					<br>
				<form>
					<div class="row1">
						<hr>
							<div class="searchArea searchTotal" align="center">
								
								<div class="searchById">
									<p class="searchAll">통합검색</p>
									<input class="form-control" type="search" id="searchAll"
										name="search" style="width:300px; height:50px; font-size:20px">
								</div>
								<div class="searchByDate">
									<p class="searchDate">가입일</p>
									<input class="form-control" type="date" id="searchDate1"
										name="enrollDate1" style="width:150px; height:50px">
									<input class="form-control" type="date" id="searchDate2"
										name="enrollDate2" style="width:150px; height:50px">
								</div>
								<div class="searchByCategory">
									<p class="searchCategory">카테고리</p>
									<select class="form-control" id="searchOption"
											 name="category_Code" 
											style="width:150px; height:50px" >
										<option value="전체">전체</option>
										<option value="고입">고입</option>
										<option value="대입">대입</option>
										<option value="고시">고시</option>
										<option value="공시">공시</option>
										<option value="외국어">외국어</option>
										<option value="취준">취준</option>
										<option value="자격증">자격증</option>
										<option value="기타">기타</option>
									</select>
								</div>
							</div>
					</div>
					<hr>
				<button type = "button" name="memberSearchBtn" id="searchBtn" onclick="reload();"class="btn btn-primary" style="float:right; margin-top:20px; margin-right:100px; font-size:20px">검색초기화</button>
				<button type="button" name="memberSearchBtn2" id="searchBtn2" onclick="searchMember();" class="btn btn-primary" style="float:right; margin-top:20px; margin-right:40px; font-size:20px">검색하기</button>
				</form>
				<script>
				function reload(){
					location.reload();
				}
				function searchMember(){
					var searchAll = $("#searchAll").val();
					var searchDate1 = $("#searchDate1").val();
					var searchDate2 = $("#searchDate2").val();
					var searchOption = $("#searchOption").val();
				
					
					$.ajax({
						url:"adminSearchMember.do",
						type:"post",
						data:{searchAll:searchAll,
							 searchDate1:searchDate1,
							 searchDate2:searchDate2,
							 searchOption:searchOption},
						success:function(data){
							var data = JSON.parse(data);
							console.log(data);
							getMemberList(data);
						},
						error:function(){
							console.log("에러 발생!");
						}
					})
					return false;
					
				}
					
				function getMemberList(data){
					var table = document.querySelector('#memberListTable');
					html = '<tr class="head"><th width="2%">'+
					'<input type="checkbox" id ="masterCheck"></th>'+
					'<th width="8%">회원번호</th>'+
					'<th width="10%">아이디</th>'+
					'<th width="10%">닉네임</th>'+
					'<th width="20%">휴대전화</th>'+
					'<th width="10%">지역</th>'+
					'<th width="7%">성별</th>'+
					'<th width="15%">가입일</th>'+
					'<th width="10%">카테고리</th><tr>'
					console.log(data.length);
					for(var i = 0; i < data.length; i++){
						console.log("12");
						html += '<tr><td><input onclick='+'"event.cancelBubble=true"'+ ' type="checkbox"'+ 'name="selectMemberCode" ' + 'class="childCheck"' + 'value="'+data[i].MEMBER_CODE+'"></td><td>'
								+data[i].MEMBER_CODE+ '</td><td>' + data[i].MEMBER_ID + '</td><td>'
								+data[i].MEMBER_NICKNAME + '</td><td>' + data[i].MEMBER_PHONE + '</td><td>'
								+data[i].LOCATION_NAME + '</td><td>' + data[i].MEMBER_GENDER+'</td><td>' + 
								data[i].MEMBER_ENROLLDATE + '</td><td>'	+ data[i].CATEGORY_NAME + '</td></tr>';
					}
					table.innerHTML = html;
					$(document).ready(function () {
					    $("#masterCheck").click(function () {
					        $(".childCheck").prop('checked', $(this).prop('checked'));
					    });
					});
					
					
					
				}
			
				</script>
				
				<br><br>
				<div class="table" style="margin-top:50px">
				<table id="memberListTable" class="table table-hover"  name="memberListTable" style="font-size:14px; align:ceter; text-align:center;">
					<tr class="head" >
						<th width="2%" ></th>
						<th width="8%">회원번호</th>
						<th width="10%">아이디</th>
						<th width="10%">닉네임</th>
						<th width="20%">휴대전화</th>
						<th width="10%">지역</th>
						<th width="7">성별</th>
						<th width="15%">가입일</th>
						<th width="10%">카테고리</th>
					</tr>
				</table>
				</div>
				<button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-warning" style="float:right; margin-top:20px; margin-right:100px; font-size:20px;">제재하기</button>
				</div>
				<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog modal-lg">
			     	<div class="modal-content">
			     		<input type="hidden" class="hiddenvalue"/>
			        	<div class="modal-header">
			         	 <h4 class="modal-title" style="width:120px; margin-top:5px">제제 사유 : </h4>
			         	  <select class="form-control" id="selectLock">
			         	 	<option value="직접입력">직접입력</option>
			         	 	<option value="욕설">욕설</option>
			         	 	<option value="불필요한 게시글 도배">불필요한 게시글 도배</option>
			         	 	<option value="광고 게시">광고 게시</option>
						</select>
			        	</div>
			       		 <div class="modal-body">
			       		 	<label>제재 만료일  : </label>
			         		<input class="form-control" type="date" id="lockDate" style="width: 100%">
			         		<textarea class="form-control" id="lockArea" style="width : 100% !important; height:200px !important;">
			         	 	
			         	 	</textarea>
			         	 
			        </div>
			        <script type="text/javascript">
			        	$(function(){
			        		$('#selectLock').change(function(){
			        			console.log($('#lockArea'))
			        			var textarea = document.getElementById("lockArea");
			        			if($('#selectLock').val() == '욕설'){
			        				textarea.value = "욕설 사용";
			        			} else if($('#selectLock').val() == '불필요한 게시글 도배'){
			        				textarea.value = "불필요한 게시글을 도배하였습니다." 
				        		} else if($('#selectLock').val() == '광고 게시'){
				        			textarea.value ="무단 광고 게시" 
			        			} else {
			        				textarea.value="";
			        			}
			        		})
			        	});
			        </script>
			      
			       		<div class="modal-footer">
			       			<button type="button" class="btn btn-warning" data-dismiss="modal" id="lockMember">회원 제재</button>
			         	 	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			        	</div>
			  		</div>
					</div>
			  </div>
			  <script>
			  			$(function(){
			  			$('#lockMember').click(function(){
						var checkBoxs = document.getElementsByName("selectMemberCode"); // 체크박스 객체
						var len = checkBoxs.length;
						var checkRow = "";
						var checkCnt = 0;
						var checkLast = "";
						var rowid = '';
						var values = "";
						var cnt = 0;
						var title = $('#selectLock').val();
						var textarea = document.getElementById("lockArea").value;
						var lockDate = document.getElementById("lockDate").value;
						
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
							alert('제재 처리할 회원을 선택해 주세요.')
							return;
						}
						$.ajax({
							url:"adminPenaltyMember.do",
							type:"get",
							data:{title:title,
								 textarea:textarea,
								 lockDate:lockDate,
								 memberCode:rowid},
							success:function(data){
								var data = JSON.parse(data);
								alert(data+"명의 회원이 제재되었습니다.");
								
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
	
</body>
</html>