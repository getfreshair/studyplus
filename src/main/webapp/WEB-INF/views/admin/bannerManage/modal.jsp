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
</head>
<body>
		<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">CPP광고수정</h4>
								</div>
						
	<form action="updateCPP.do" method="post" enctype="multipart/form-data">
		<div class="modal-body">
			<label>광고업체명</label> <input type="text" name="prCompany"
				class="form-control modalContent modalContent1" value="${map[0].PR_COMPANY}" readonly> <label>광고제목</label>
			<input type="text" name="prTitle"
				class="form-control modalContent modalContent2" value="${map[0].PR_TITLE }"> <label>URL</label>
			<input type="text" id="prUrl"
				class="form-control modalContent modalContent3"  value="${map[0].PR_LINK}" name=""
				placeholder=""> <label>이미지</label>
			<div id="cppImageUpdateArea"
				style="height: 200px; width: 200px; border-style: dashed;">
				<img id="cppUpdateImage" src="resources/upload/admin/thumbnail/${map[0].FILES_NAME}.png" width="194px" height="194px">
			</div>
			<div id="fileArea3">
				<input type="file" id="cppImageUpdateClick"
					onchange="loadImg3(this);">
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
			<label>광고시작일</label> <input type="text"
				class="form-control modalContent modalContent5" value = "${map[0].PR_STARTDATE}"name="" readonly> <label>광고종료일</label>
			<input type="text" class="form-control modalContent modalContent6" value = "${map[0].PR_ENDDATE}"
				name="" readonly > <label>광고금액</label> <input type="text"
				class="form-control modalContent modalContent7" name="" value="${map[0].PR_CONTRACTMONEY }"
				placeholder="금액을 입력하세요" readonly>
		</div>
		<div class="modal-footer">
			<button type="submit" class="btn btn-success" >수정하기</button>
			<button type="button" class="btn btn-default" data-dismiss="modal"
				onclick="cppimgClose2();">Close</button>
		</div>
		<script>
			function cppimgClose2(){
			$("#cppUpdateImage").removeAttr("src");
			}
		</script>
	</form>
			
							</div>
						</div>
</body>
</html>