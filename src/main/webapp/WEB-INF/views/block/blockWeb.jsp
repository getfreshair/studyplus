<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<style>
/* .webMenu {
	background: red !important;
} */
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-xs-12 col-md-12">
		<div class="panel panel-default col-xs-11 col-md-11 "
			style="margin-left: 50px; margin-right: 50px">
			<div class="panel-body" align="left" style="font-weight: bold">
				웹 사이트 차단을 설정합니다. 일부 설정은 프로그램을 재시작해야 정상 적용됩니다.</div>
		</div>

		<div class="col-xs-11 col-md-6"
			style="margin-left: 50px; padding-right: 9%; float: left">
			<div class="form-group" style="margin-left: 30px">
				<h4 align="left">
					<span style="color: red;">*</span> 차단 웹 사이트 주소 목록
				</h4>
				<div align="left" class="container"
					style="width: 100%; overflow: auto; height: 300px">

					<table class="table table-hover" id="webListTable">
						<thead>
							<tr align="center">
								<th style="width: 10%"><input id="webMasterCheckBox"
									type="checkbox"></th>
								<th align="center">웹 사이트 주소</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>

					<script>
						webCnt = 0;
						$("#webMasterCheckBox").click(function() {
							if ($("#webMasterCheckBox").prop("checked")) {
								$(".webChildCheckBox").prop("checked", true);
							} else {
								$(".webChildCheckBox").prop("checked", false);
							}

						})

						$(function() {
							$
									.ajax({
										url : "selectWebSiteList.bl",
										type : "get",
										success : function(data) {
											console.log(data);
											for (var i = 0; i < data.length; i++) {
												$("#webListTable")
														.append(
																"<tr class='webResetTr'>"
																		+ "<td><input type='checkbox' name='webSelectBox' class='webChildCheckBox' value="+i+" /></td>"
																		+ "<td align='center'>"
																		+ data[i]
																		+ "</td>"
																		+ "</tr>")
												cnt++;
											}
										},
										error : function(request, status, error) {
											console.log("code:"
													+ request.status
													+ "\n message : "
													+ request.responseText
													+ "\n error : " + error);
										}
									})
						})
					</script>
				</div>
				<button type="button" class="btn btn-default"
					style="margin-top: 20px; margin-left: 70%" id="webDeleteBtn">삭제하기</button>
				<script>
					$(document).ready(function() {
						$('#webDeleteBtn').click(function() {
							var checkBoxs = document.getElementsByName("webSelectBox"); // 체크박스 객체
							var len = checkBoxs.length;
							var checkRow = "";
							var checkCnt = 0;
							var checkLast = "";
							var rowid = '';
							var values = "";
							var cnt = 0;
							for (var i = 0; i < len; i++) {
								if (checkBoxs[i].checked == true) {
									checkCnt++;
									checkLast = i;
								}
							}
							for (var i = 0; i < len; i++) {
								if (checkBoxs[i].checked == true) {
									checkRow = checkBoxs[i].value;

									if (checkCnt == 1) {
										rowid += checkRow;
									} else {
										if (i == checkLast) {
											rowid += checkRow;
										} else {
											rowid += checkRow+ ",";
										}
									}
									cnt++;
									checkRow = '';
									}
							}
							if (rowid === '') {
								alert('차단을 해제할 웹 사이트를 선택해 주세요.')
								return;
							}
							console.log(rowid);
							$.ajax({
								url : "deleteWebSite.bl",
								type : "post",
								data : {
									deleteIndex : rowid
								},success : function(data) {
									$(".webResetTr").remove();
									webCnt = 0;
									for (var i = 0; i < data.length; i++) {
										console.log(i);
										$("#webListTable").append("<tr class='webResetTr'>"
											+ "<td><input type='checkbox' name='webSelectBox' class='webChildCheckBox' value="+i+" /></td>"
											+ "<td align='center'>"
											+ data[i]
											+ "</td>"
											+ "</tr>")
										webCnt++;
										}
									console.log("성공");
								},error : function() {
									console.log("에러 발생!");
								}
							});
						});

					});
				</script>
			</div>
		</div>
		<div class="vl col-xs-0 col-md-1" align="center"></div>
		<div style="float: left; height: 400px" class="col-xs-11 col-md-4">
			<h4 align="left">
				<span style="color: red;">*</span> 차단 웹사이트 URL 입력
			</h4>
			<div class="form-group" align="left">
			

			<input type="text" class="form-control" name="blockURL" id="blockURL" placeholder="ex)www.test.com 의 형식으로 입력해주세요..">
			<button id="webSaveBtn"
				style="display: inline-block; margin-left: 65%; margin-top: 20px"
				type="submit" class="btn btn-danger">차단 등록 하기</button>

			<script type="text/javascript">
				$(function(){
					$("#webSaveBtn").click(function(){
						$.ajax({
							url : "saveWebSite.bl",
							type : "post",
							data : {
								URLName : $("#blockURL").val()
							},success:function(data){
								$("#webListTable").append(
					    				"<tr class='webResetTr'>"+ 
					    					"<td><input type='checkbox' name='webSelectBox' class='webChildCheckBox' value="+webCnt+" /></td>" +
					    					"<td align='center'>"+data+"</td>"+
					    				"</tr>"
					    			)
					    			webCnt++;
								$("#blockURL").val("");
							}, error:function(request,status,error){
						          console.log("code:"+request.status + "\n message : " + request.responseText + "\n error : " + error );
					        }
						}); 
					});
				});
			</script>
					
			</div>
			
			<h4 align="left" style="margin-top: 80px">
				<span style="color: red;">*</span>자동으로 추가 하기
			</h4>
			<h5 align="left" style="width: 100%; display: inline-block">
				Study PLUS에서 설정한 차단 권장 프로그램들을 한번에 차단 목록에 추가해줍니다.</h5>
			<button
				style="display: inline-block; margin-left: 65%; margin-top: 20px"
				type="button" class="btn btn-warning">자동 등록 하기</button>
		</div>

	</div>
	<%-- <div class="col-xs-12 col-md-3">
		<jsp:include page="blockSideMenu.jsp"/>
	</div>
	<div class="col-xs-12 col-md-9" >
		<div class="panel panel-default col-xs-11 col-md-11" style="margin-top:100px; margin-left:50px; margin-right:50px">
  			<div class="panel-body">웹 사이트 차단을 설정합니다. 설정 후 완료 버튼을 눌러야 적용이 완료 됩니다.</div>
		</div>
		<br><br>
		<div >
			<div style="margin-left:50px; float:left ;padding-right:9%;" class="col-xs-11 col-md-6">
				<h1 style="color:blue;">웹 사이트 차단 설정</h1>
				
				<div class="form-group" style="margin-left:30px">
				  	<label for="comment">차단할 웹 사이트 목록</label>
				  	<textarea class="form-control" cols="10" rows="20" id="comment" style="resize:none;"></textarea>
				</div>
			</div>
			<div class="vl col-xs-0 col-md-1" ></div>
			<div style="float:left" class="col-xs-11 col-md-4">
				<br><br><br><br><br>
				<h2>차단할 웹 사이트 주소</h2>
				<div class="form-group">
					  <input type="text" class="form-control" id="usr" style="width:70%; display:inline-block"> &nbsp;&nbsp;<button style="display:inline-block" type="button" class="btn btn-primary">파일 찾기</button>
				</div>
				<h4>컴퓨터를 재시작 하셔야, 설정이 완벽하게 적용됩니다.</h4>
				<button style="margin-left:71%" type="button" class="btn btn-warning">설정 완료</button>
			</div>
		</div>
	</div> --%>
</body>
</html>