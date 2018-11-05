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
									<h4 class="modal-title">CPC광고수정</h4>
								</div>
								<form action="updateCPC.do" method="post" enctype="multipart/form-data">
									<div class="modal-body">
										<label>광고업체명</label> <input type="text" name="prCompany" value="${map[0].PR_COMPANY}"
											class="form-control modalContent modalContent1">
										<label>광고제목</label> <input type="text" name="prTitle" value="${map[0].PR_TITLE }"
											class="form-control modalContent modalContent2" >
										<label>URL</label> <input type="text" name="prUrl" value="${map[0].PR_LINK}"
											class="form-control modalContent modalContent3"	>
										<label>이미지</label>
										<div id="cpcImageUpdateArea" style="height:200px; width:200px">
											<img id="cpcUpdateImage" src="resources/upload/admin/thumbnail/${map[0].FILES_NAME}.png" width="200px" height="200px">
										</div>
											<div id="fileArea4">
												<input type="file" name="photo" id="cpcImageUpdateClick" onchange="loadImg4(this);">
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
											class="form-control modalContent modalContent7" name="prCost" value="${map[0].PR_CONTRACTMONEY }"
											placeholder="금액을 입력하세요">
										<input type="hidden" name = "code" value = "${map[0].PR_CODE }">
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
</body>
</html>