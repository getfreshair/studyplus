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
					<h2>광고등록</h2>
					<hr>
					<br>
					<br>
					<div class="first-div">
						<h5>CPP 광고</h5>
						<div class="table" style="margin-top: 50px">
							<table id="memberListTable" class="table table-hover"
								align="center" name="memberListTable"
								style="font-size: 14px; text-align: center">
								<tr class="head">
									<th width="2%"><input type="checkbox" class="masterCheck"></th>
									<th width="7%">광고번호</th>
									<th width="15%">광고업체명</th>
									<th width="25%">광고이미지</th>
									<th width="15%">카테고리</th>
									<th width="20%">광고기간</th>
									<th width="10%">상태</th>
								</tr>
								<tr>
									<td><input type="checkbox" class="masterCheck"></th>
									<td>1</th>
									<td>sji1123</th>
									<td>신재익</th>
									<td>sji1123@naver.com</th>
									<td>010-5242-1241</th>
									<td>2018-10-1</th>
								</tr>
							</table>
						</div>
						<div class="second-div" style="margin-left:400px">	
						
					<button type="button" id="cppInsertBtn" class="btn btn-primary" data-toggle="modal" data-target="#myModal"
								style="font-size:14px; margin-bottom:6px; display:inline-block;height:35px;">광고등록</button>
					<button type="button" id="cppUpdateBtn" class="btn btn-primary" data-toggle="modal" data-target="#myModal3"
								style="font-size:14px; margin-bottom:6px; display:inline-block;height:35px;margin-left:50px">수정하기</button>
					<button class="btn btn-warning" id="cppDeleteBtn" name="cppDeleteBtn1" style="margin-bottom:6px; margin-left:50px; 
								font-size:14px; display:inline-block;">삭제하기</button>
					</div>
					</div>
					<div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">CPP광고등록</h4>
								</div>
								<form method="post"
									action="" onsubmit="return checkModalForm()" name="moform">
									<div class="modal-body">
										<label>광고업체명</label> <input type="text" name="prCompany"
											class="form-control modalContent modalContent1">
										<label>광고제목</label> <input type="text" name="prTitle"
											class="form-control modalContent modalContent2">
										<label>URL</label> <input type="text" id="prUrl"
											class="form-control modalContent modalContent3"
											name="" placeholder="">
										<label>이미지</label>	<div id="imageArea" style="height:200px; width:200px; border-style:dashed;">
											<img id="prImage" width="194px" height="194px">
											<!-- <input type="file"
											class="form-control modalContent modalContent4" name="image2"
											placeholder="이미지"> -->
											</div>
											<div id="fileArea">
												<input type="file" id="prImageClick" onchange="loadImg(this);">
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
											class="form-control modalContent modalContent5" name="">
										<label>광고종료일</label> <input type="date" 
											class="form-control modalContent modalContent6" name="">
										<label>광고금액</label> <input type="text"
											class="form-control modalContent modalContent7" name=""
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
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">CPP광고수정</h4>
								</div>
								<form method="post"
									action="" onsubmit="return checkModalForm()" name="moform">
									<div class="modal-body">
										<label>광고업체명</label> <input type="text" name="prCompany"
											class="form-control modalContent modalContent1">
										<label>광고제목</label> <input type="text" name="prTitle"
											class="form-control modalContent modalContent2">
										<label>URL</label> <input type="text" id="prUrl"
											class="form-control modalContent modalContent3"
											name="" placeholder="">
										<label>이미지</label>	<div id="cppImageUpdateArea" style="height:200px; width:200px; border-style:dashed;">
											<img id="cppUpdateImage" width="194px" height="194px">
											</div>
											<div id="fileArea3">
												<input type="file" id="cppImageUpdateClick" onchange="loadImg3(this);">
											</div>
											<script>
												$(function(){
												 	$("#fileArea3").hide();
												 	
												 	$("#cppImageUpdateArea").click(function(){
												 		$("#cppImageUpdateClick").click();
												 	})
												})
												function loadImg3(value){
													 if(value.files && value.files[0]){
										                  var reader = new FileReader();
										                  
										                  reader.onload = function(e){
										                	  console.log(e);
										                   		 $("#cppUpdateImage").attr("src",e.target.result);
										                		console.log(e.target.result); 
										                  }
													 	  reader.readAsDataURL(value.files[0]);
										            }
												}
											</script>
										<label>광고시작일</label> <input type="date" 
											class="form-control modalContent modalContent5" name="">
										<label>광고종료일</label> <input type="date" 
											class="form-control modalContent modalContent6" name="">
										<label>광고금액</label> <input type="text"
											class="form-control modalContent modalContent7" name=""
											placeholder="금액을 입력하세요">
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-success">수정하기</button>
										<button type="button" class="btn btn-default"
											data-dismiss="modal" onclick="cppimgClose2();">Close</button>
									</div>
									<script>
										function cppimgClose2(){
											$("#cppUpdateImage").removeAttr("src");
										}
									</script>
								</form>
							</div>
						</div>
					</div>
					<div class="third-div">
						<h5>CPC 광고</h5>
						<div class="table" style="margin-top: 50px">
							<table id="memberListTable" class="table table-hover"
								align="center" name="memberListTable"
								style="font-size: 14px; text-align: center">
								<tr class="head">
									<th width="2%"><input type="checkbox" class="masterCheck"></th>
									<th width="7%">광고번호</th>
									<th width="15%">광고업체명</th>
									<th width="25%">광고이미지</th>
									<th width="15%">카테고리</th>
									<th width="20%">예치금</th>
									<th width="10%">상태</th>
								</tr>
								<tr>
									<td><input type="checkbox" class="masterCheck"></td>
									<td>1</td>
									<td>sji1123</td>
									<td>신재익</td>
									<td>sji1123@naver.com</td>
									<td>010-5242-1241</td>
									<td>2018-10-1</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="forth-div" style="margin-left:400px">
					<button type="button" id="cpcInsertBtn" class="btn btn-primary" data-toggle="modal" data-target="#myModal2"
								style="font-size:14px; margin-bottom:6px; display:inline-block;height:35px;">광고등록</button>
					<button type="button" id="cpcUpdateBtn" class="btn btn-primary" data-toggle="modal" data-target="#myModal4"
								 style="font-size:14px; margin-bottom:6px; display:inline-block;height:35px;margin-left:50px">수정하기</button>
					<button class="btn btn-warning" id="cppDeleteBtn" name="cppDeleteBtn1" style="margin-bottom:6px; margin-left:50px; 
								font-size:14px; display:inline-block;">삭제하기</button>
					<div class="modal fade" id="myModal2" role="dialog">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">CPC광고등록</h4>
								</div>
								<form method="post"
									action="" onsubmit="return checkModalForm()" name="moform">
									<div class="modal-body">
										<label>광고업체명</label> <input type="text" name="prCompany"
											class="form-control modalContent modalContent1">
										<label>광고제목</label> <input type="text" name="prTitle"
											class="form-control modalContent modalContent2">
										<label>URL</label> <input type="text" id="prUrl"
											class="form-control modalContent modalContent3"
											name="" placeholder="">
										<label>이미지</label>
										<div id="cpcImageArea" style="height:200px; width:200px">
											<img id="cpcImage" width="200px" height="200px">
										</div>
											<div id="fileArea2">
												<input type="file" id="cpcImageClick" onchange="loadImg2(this);">
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
										<label>광고금액</label> <input type="text"
											class="form-control modalContent modalContent7" name=""
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
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">CPC광고등록</h4>
								</div>
								<form method="post"
									action="" onsubmit="return checkModalForm()" name="moform">
									<div class="modal-body">
										<label>광고업체명</label> <input type="text" name="prCompany"
											class="form-control modalContent modalContent1">
										<label>광고제목</label> <input type="text" name="prTitle"
											class="form-control modalContent modalContent2">
										<label>URL</label> <input type="text" id="prUrl"
											class="form-control modalContent modalContent3"
											name="" placeholder="">
										<label>이미지</label>
										<div id="cpcImageUpdateArea" style="height:200px; width:200px">
											<img id="cpcUpdateImage" width="200px" height="200px">
										</div>
											<div id="fileArea4">
												<input type="file" id="cpcImageUpdateClick" onchange="loadImg4(this);">
											</div>
											<script>
												$(function(){
												 	$("#fileArea4").hide();
												 	
												 	$("#cpcImageUpdateArea").click(function(){
												 		$("#cpcImageUpdateClick").click();
												 	})
												})
												function loadImg4(value){
													 if(value.files && value.files[0]){
										                  var reader = new FileReader();
										                 
										                  reader.onload = function(e){
										                	  console.log(e);
										                   		 $("#cpcUpdateImage").attr("src",e.target.result);
										                		console.log(e.target.result); 
										                  }
													 	  reader.readAsDataURL(value.files[0]);
										            }
												}
											</script>
										<label>광고금액</label> <input type="text"
											class="form-control modalContent modalContent7" name=""
											placeholder="금액을 입력하세요">
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-success">추가하기</button>
										<button type="button" class="btn btn-default"
											data-dismiss="modal" onclick="cpcImgClose2();">Close</button>
									</div>
									<script>
										function cpcImgClose2(){
											$("#cpcUpdateImage").removeAttr("src");
										}
									
									</script>
									
								</form>
							</div>
						</div>
					</div>
					</div>
				</div>
		</div>
	</div>
</body>
</html>