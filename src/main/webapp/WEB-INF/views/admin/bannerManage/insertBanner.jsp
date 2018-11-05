<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
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
					<h2>광고등록</h2>
					<hr>
					<br>
					<br>
					<div class="first-div" style="height:300px; overflow:auto;">
						<h5>CPP 광고</h5>
						<div class="table" style="margin-top: 50px">
							<table id="CPPTable" class="table table-hover"
								align="center" name="memberListTable"
								style="font-size: 14px; text-align: center">
								<tr class="head">
									<th width="4%"></th>
									<th width="5%">광고번호</th>
									<th width="10%">광고업체명</th>
									<th width="10%">광고제목</th>
									<th width="10%">광고이미지</th>
									<th width="15%">카테고리</th>
									<th width="15%">광고기간</th>
									<th width="10%">상태</th>
								</tr>
							<c:forEach items="${data}"  var="prList" >
							  <c:if test="${prList.PR_TYPE eq 0 and (prList.PR_STATUS eq 0 or prList.PR_STATUS eq 1)}">
								<input type="hidden" id="typeCPP" value="CPP">
								<tr	data-toggle="modal" data-target="#myModal3">
								<td><input type="radio" class="chlidCheck1" id ="checkDelete" onclick="event.cancelBubble = true;" value="${prList.PR_CODE}"></td>
								<td>${prList.PR_CODE}</td>
								<td>${prList.PR_COMPANY}</td>
								<td>${prList.PR_TITLE}</td>
								<td><img src="resources/upload/admin/thumbnail/${prList.FILES_NAME}.png" style="height:40px; width:100px;"></td>
									<c:choose>
										<c:when test="${prList.CATEGORY_CODE eq 1}">
										<td>고입</td>
										</c:when>
										<c:when test="${prList.CATEGORY_CODE eq 2}">
										<td>대입</td>
										</c:when>
										<c:when test="${prList.CATEGORY_CODE eq 3}">
										<td>고시</td>
										</c:when>
										<c:when test="${prList.CATEGORY_CODE eq 4}">
										<td>공시</td>
										</c:when>
										<c:when test="${prList.CATEGORY_CODE eq 5}">
										<td>외국어</td>
										</c:when>
										<c:when test="${prList.CATEGORY_CODE eq 6}">
										<td>취준</td>
										</c:when>
										<c:when test="${prList.CATEGORY_CODE eq 7}">
										<td>자격증</td>
										</c:when>
										<c:otherwise>
										<td>기타</td>
										</c:otherwise>
									</c:choose>
								<td>${prList.PR_STARTDATE}~${prList.PR_ENDDATE}</td>
									<c:choose>
										<c:when test="${prList.PR_STATUS eq 0}">
										<td>게시</td>
										</c:when>
										<c:when test="${prList.PR_STATUS eq 1}">
										<td>종료</td>
										</c:when>
									</c:choose>
								</tr>
							 </c:if>
							</c:forEach>
							</table>
						</div>
						<div class="second-div" style="margin-left:400px">	
						
					<button type="button" id="cppInsertBtn" class="btn btn-primary" data-toggle="modal" data-target="#myModal"
								style="font-size:14px; margin-bottom:6px; display:inline-block;height:35px;">광고등록</button>
					<button type="button" id="cppUpdateBtn" class="btn btn-primary" data-toggle="modal" data-target="#myModal3"
								style="font-size:14px; margin-bottom:6px; display:inline-block;height:35px;margin-left:50px">수정하기</button>
					<button class="btn btn-warning" id="cppDeleteBtn" onclick ="deleteCPP();"name="cppDeleteBtn1" style="margin-bottom:6px; margin-left:50px; 
								font-size:14px; display:inline-block;">삭제하기</button>
					</div>
					<script>
							$(function(){
								$("#CPPTable").find("td").mouseenter(function(){
									$(this).parents("tr").css({"background":"lightgray","cursor":"pointer"});
								}).mouseout(function(){
									$(this).parents("tr").css({"background":"white"});
								}).click(function(){
								    var prCode= $(this).parents().children("td").eq(1).text();
								    var type = $("#typeCPP").val();
										console.log(prCode);
									 	$.ajax({
											url:"selectPR.do",
													type:"post",
													data:{prCode:prCode,
														type:type},
													success:function(data){
														console.log(data);
														$("#myModal3").append(data);
													},
													error:function(){
															console.log("에러 발생!");
													}
												}) 
								})
							})
							function deleteCPP(){
								var prCode = $("#checkDelete").val();
									console.log("CPP여기오니?"+prCode);
									$.ajax({
										url:"deletePR.do",
										data:{prCode:prCode},
										success:function(data){
											console.log(data);
											location.reload();
										},
										error:function(){
											console.log("에러발생!");
										}
									})
								
							}
							
					</script>
					</div>
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">CPP광고등록</h4>
								</div>
								<form action="insertCPP.do" method="post" enctype="multipart/form-data"> 
									<div class="modal-body">
										<label>광고업체명</label> <input type="text" name="prCompany"
											class="form-control modalContent modalContent1">
										<label>광고제목</label> <input type="text" name="prTitle"
											class="form-control modalContent modalContent2">
										<label>URL</label> <input type="text" name="prUrl"
											class="form-control modalContent modalContent3"
											placeholder="">
										<label>이미지</label>	<div id="imageArea" style="height:200px; width:200px; border-style:dashed;">
											<img id="prImage" width="194px" height="194px">
											<!-- <input type="file"
											class="form-control modalContent modalContent4" name="image2"
											placeholder="이미지"> -->
											</div>
											<div id="fileArea">
												<input type="file" name="photo" id="prImageClick" onchange="loadImg(this);">
											</div>
											<script>
												$(function(){
												 	$("#fileArea").hide();
												 	
												 	$("#imageArea").click(function(){
												 		$("#prImageClick").click();
												 	})
												})
												function loadImg(value){
													 if(value.files && value.files[0]){
										                  var reader = new FileReader();
										                  
										                  reader.onload = function(e){
										                	  console.log(e);
										                   		 $("#prImage").attr("src",e.target.result);
										                		console.log(e.target.result); 
										                  }
													 	  reader.readAsDataURL(value.files[0]);
										            }
												}
											</script>
										<label>광고시작일</label> <input type="date" 
											class="form-control modalContent modalContent5" name="prStartDate">
										<label>광고종료일</label> <input type="date" 
											class="form-control modalContent modalContent6" name="prEndDate">
										<label>광고카테고리</label><select class="form-control" id="searchOption"
											 name="category" 
											style="width:150px; height:50px" >
											<option value="1">고입</option>
											<option value="2">대입</option>
											<option value="3">고시</option>
											<option value="4">공시</option>
											<option value="5">외국어</option>
											<option value="6">취준</option>
											<option value="7">자격증</option>
											<option value="8">기타</option>
										</select>
										<label>광고금액</label> <input type="text"
											class="form-control modalContent modalContent7" name="prCost"
											placeholder="금액을 입력하세요">
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-success">추가하기</button>
										<button type="button" class="btn btn-default"
											data-dismiss="modal" onclick="cppimgClose1();">Close</button>
									</div>
									<script>
										function cppimgClose1(){
											$("#prImage").removeAttr("src");
											console.log($("#prImage"));
										}
									</script>
								</form>
							</div>
						</div>
					</div>
					<div class="modal fade" id="myModal3" role="dialog">
					
					</div>
					<div class="third-div">
						<h5>CPC 광고</h5>
						<div class="table" style="margin-top: 50px; height:300px; overflow:auto;">
							<table id="CPCTable" class="table table-hover"
								style="font-size: 14px; text-align: center">
								<tr class="head">
									<th width="4%"></th>
									<th width="5%">광고번호</th>
									<th width="10%">광고업체명</th>
									<th width="10%">광고제목</th>
									<th width="10%">광고이미지</th>
									<th width="15%">카테고리</th>
									<th width="15%">예치금</th>
									<th width="10%">상태</th>
								</tr>
							<c:forEach items="${data}"  var="prList" >
							  <c:if test="${prList.PR_TYPE eq 1 and (prList.PR_STATUS eq 0 or prList.PR_STATUS eq 1)}">
								<input type="hidden" id="typeCPC" value="CPC">
								<tr	data-toggle="modal" data-target="#myModal4">
								<td><input type="radio" class="chlidCheck1" id ="checkDelete1" onclick="event.cancelBubble = true;" value="${prList.PR_CODE}"></td>
								<td>${prList.PR_CODE}</td>
								<td>${prList.PR_COMPANY}</td>
								<td>${prList.PR_TITLE}</td>
								
								<td><img src="resources/upload/admin/thumbnail/${prList.FILES_NAME}.png" style="height:40px; width:100px;"></td>
									<c:choose>
										<c:when test="${prList.CATEGORY_CODE eq 1}">
										<td>고입</td>
										</c:when>
										<c:when test="${prList.CATEGORY_CODE eq 2}">
										<td>대입</td>
										</c:when>
										<c:when test="${prList.CATEGORY_CODE eq 3}">
										<td>고시</td>
										</c:when>
										<c:when test="${prList.CATEGORY_CODE eq 4}">
										<td>공시</td>
										</c:when>
										<c:when test="${prList.CATEGORY_CODE eq 5}">
										<td>외국어</td>
										</c:when>
										<c:when test="${prList.CATEGORY_CODE eq 6}">
										<td>취준</td>
										</c:when>
										<c:when test="${prList.CATEGORY_CODE eq 7}">
										<td>자격증</td>
										</c:when>
										<c:otherwise>
										<td>기타</td>
										</c:otherwise>
									</c:choose>
									<td><fmt:formatNumber value="${prList.PR_CONTRACTMONEY}" type="currency"/><br></td>
									<c:choose>
										<c:when test="${prList.PR_STATUS eq 0}">
										<td>게시</td>
										</c:when>
										<c:when test="${prList.PR_STATUS eq 1}">
										<td>종료</td>
										</c:when>
									</c:choose>
								</tr>
							 </c:if>
							</c:forEach>
							</table>
						</div>
					</div>
					<div class="forth-div" style="margin-left:400px">
					<button type="button" id="cpcInsertBtn" class="btn btn-primary" data-toggle="modal" data-target="#myModal2"
								style="font-size:14px; margin-bottom:6px; display:inline-block;height:35px;">광고등록</button>
					<button type="button" id="cpcUpdateBtn" class="btn btn-primary" data-toggle="modal" data-target="#myModal4"
								 style="font-size:14px; margin-bottom:6px; display:inline-block;height:35px;margin-left:50px">수정하기</button>
					<button class="btn btn-warning" id="cppDeleteBtn" onclick="deleteCPC();"name="cppDeleteBtn1" style="margin-bottom:6px; margin-left:50px; 
								font-size:14px; display:inline-block;">삭제하기</button>
					<script>
							$(function(){
								$("#CPCTable").find("td").mouseenter(function(){
									$(this).parents("tr").css({"background":"lightgray","cursor":"pointer"});
								}).mouseout(function(){
									$(this).parents("tr").css({"background":"white"});
								}).click(function(){
								    var prCode= $(this).parents().children("td").eq(1).text();
								    var type = $("#typeCPC").val();
										console.log(prCode);
									 	$.ajax({
											url:"selectPR.do",
													type:"post",
													data:{prCode:prCode,
														  type:type},
													success:function(data){
														console.log(data);
														$("#myModal4").append(data);
													},
													error:function(){
															console.log("에러 발생!");
													}
												}) 
								})
								})
									function deleteCPC(){
									var prCode = $("#checkDelete1").val();
									console.log("CPP여기오니?"+prCode);
									$.ajax({
										url:"deletePR.do",
										data:{prCode:prCode},
										success:function(data){
											console.log(data);
											location.reload();
										},
										error:function(){
											console.log("에러발생!");
										}
									})
								
							}
					</script>
					
					
					
					<div class="modal fade" id="myModal2" role="dialog">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">CPC광고등록</h4>
								</div>
								<form action="insertCPC.do" method="post" enctype="multipart/form-data"> 
									<div class="modal-body">
										<label>광고업체명</label> <input type="text" name="prCompany"
											class="form-control modalContent modalContent1">
										<label>광고제목</label> <input type="text" name="prTitle"
											class="form-control modalContent modalContent2">
										<label>URL</label> <input type="text" id="prUrl"
											class="form-control modalContent modalContent3"
											name="prUrl" placeholder="">
										<label>이미지</label>
										<div id="cpcImageArea" style="height:200px; width:200px">
											<img id="cpcImage" width="200px" height="200px">
										</div>
											<div id="fileArea2">
												<input type="file" name=photo id="cpcImageClick" onchange="loadImg2(this);">
											</div>
											<script>
												$(function(){
												 	$("#fileArea2").hide();
												 	
												 	$("#cpcImageArea").click(function(){
												 		$("#cpcImageClick").click();
												 	})
												})
												function loadImg2(value){
													 if(value.files && value.files[0]){
										                  var reader = new FileReader();
										                 
										                  reader.onload = function(e){
										                	  console.log(e);
										                   		 $("#cpcImage").attr("src",e.target.result);
										                		console.log(e.target.result); 
										                  }
													 	  reader.readAsDataURL(value.files[0]);
										            }
												}
											</script>
										<label>광고카테고리</label><select class="form-control" id="searchOption"
											 name="category" 
											style="width:150px; height:50px" >
											<option value="1">고입</option>
											<option value="2">대입</option>
											<option value="3">고시</option>
											<option value="4">공시</option>
											<option value="5">외국어</option>
											<option value="6">취준</option>
											<option value="7">자격증</option>
											<option value="8">기타</option>
										</select>
										<label>광고금액</label> <input type="text"
											class="form-control modalContent modalContent7" name="prCost"
											placeholder="금액을 입력하세요">
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-success">추가하기</button>
										<button type="button" class="btn btn-default"
											data-dismiss="modal" onclick="cpcImgClose();">Close</button>
									</div>
									<script>
										function cpcImgClose(){
											$("#cpcImage").removeAttr("src");
										}
									
									</script>
									
								</form>
							</div>
						</div>
					</div>
					<div class="modal fade" id="myModal4" role="dialog">
					
					</div>
					</div>
				</div>
		</div>
	</div>
</body>
</html>