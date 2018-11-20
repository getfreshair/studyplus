<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script> 
<script src="http://malsup.github.com/jquery.form.js"></script> 
<style>
.programMenu {
	background: red !important;
}

.vl {
	border-left: 2px solid lightgray;
	height: 430px;
	float: left;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-xs-12 col-md-12">
		<div class="panel panel-default col-xs-11 col-md-11 "
			style="margin-left: 50px; margin-right: 50px">
			<div class="panel-body" align="left" style="font-weight: bold">
			프로그램 차단을 설정합니다. 일부 설정은 프로그램을 재시작해야 정상 적용됩니다.</div>
		</div>

		<div class="col-xs-11 col-md-6"
			style="margin-left: 50px; padding-right: 9%; float: left">
			<div class="form-group" style="margin-left: 30px">
			<h4 align="left"><span style="color:red;">*</span> 차단 프로그램 목록</h4>
				<div align="left"class="container" style="width:100% ; overflow: auto; height:300px">
					
					<table class="table table-hover" id="programListTable">
						<thead>
							<tr align="center">
								<th style="width:10%"><input id="masterCheckBox" type="checkbox"></th>
								<th align="center">프로그램명</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
					
					<script>
						cnt = 0;
						$("#masterCheckBox").click(function(){
							if($("#masterCheckBox").prop("checked")){
					            $(".childCheckBox").prop("checked",true);
					        }else{
					            $(".childCheckBox").prop("checked",false);
					        }

						})
							
						
						$(function(){
							$.ajax({
							     url:"selectBlockProgramList.bl",
							     type:"get",
							     success:function(data){	
							    	console.log(data);
							    	for(var i = 0; i < data.length; i ++) {
							    		$("#programListTable").append(
							    				"<tr>"+ 
							    					"<td><input type='checkbox' name='selectBox' class='childCheckBox' value="+i+" /></td>" +
							    					"<td align='center'>"+data[i]+"</td>"+
							    				"</tr>"
							    				)	
							    				cnt++;
							    	}
							     },
							     error:function(request,status,error){
							          console.log("code:"+request.status + "\n message : " + request.responseText + "\n error : " + error );
							          }
							    })
						})
					</script>
				</div>
				<button type="button" class="btn btn-default" style="margin-top:20px ; margin-left:70%" id="deleteBtn">삭제하기</button>
				<script>
				$(document).ready(function () {
			  		$('#deleteBtn').click(function(){
					var checkBoxs = document.getElementsByName("selectBox"); // 체크박스 객체
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
						alert('차단을 해제할 프로그램을 선택해 주세요.')
						return;
					}
					console.log(rowid);
						$.ajax({
							url:"deleteBlockPrograme.bl",
							type:"post",
							data:{deleteIndex:rowid},
							success:function(data){
								console.log("성공");
							},
							error:function(){
								console.log("에러 발생!");
							}
						});
			  		});
						
						    $("#masterCheck1").click(function () {
						        $(".childCheck1").prop('checked', $(this).prop('checked'));
						    });
						});
					
					</script>
			</div>
		</div>
		<div class="vl col-xs-0 col-md-1" align="center"></div>
		<div style="float: left; height:400px" class="col-xs-11 col-md-4" >
			<h4 align="left"><span style="color:red;">*</span> 차단 프로그램 검색</h4>
			<div class="form-group" align="left">
			<form enctype="multipart/form-data" method="post" id="fileForm">
				<input type="file" class="btn btn-default" name="file" value="파일 찾기" style="width:100%">
				<script>
					var option = {
						url:"saveBlockProgram.bl",
						type:"post",
						data:$("#fileForm").serialize(),
						success:function(data){
							$("#programListTable").append(
				    				"<tr>"+ 
				    					"<td><input type='checkbox' name='selectBox' class='childCheckBox' value="+cnt+" /></td>" +
				    					"<td align='center'>"+data+"</td>"+
				    				"</tr>"
				    			)
				    			cnt++;
						}, error:function(request,status,error){
					          console.log("code:"+request.status + "\n message : " + request.responseText + "\n error : " + error );
				        }
					});
					
					$("#saveBtn").click(function(){
						console.log($('#file'))
						$("#fileForm").ajaxSubmit(option);
					});
				</script>
			</form>
				<button id="saveBtn" style="display: inline-block; margin-left:65% ; margin-top:20px" type="button"
				class="btn btn-danger">차단 등록 하기</button>
			</div>
			<h4 align="left" style="margin-top:80px"><span style="color:red;">*</span>자동으로 추가 하기</h4>
			<h5 align="left" style="width: 100%; display: inline-block">
				Study PLUS에서 설정한 차단 권장 프로그램들을 한번에 차단 목록에 추가해줍니다.
			</h5>
			<button  style="display: inline-block; margin-left:65% ;margin-top:20px" type="button"
				class="btn btn-warning">자동 등록 하기</button>
		</div>

	</div>
</body>
</html>