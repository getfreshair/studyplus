<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Sources Page의 노란 파일 확인하기 -->


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/at.js/1.4.0/css/jquery.atwho.min.css">

<!-- <link href="/studyplus/resources/css/font_awesome.min.css" rel="stylesheet" type="text/css" /> -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.8.5/css/froala_editor.pkgd.min.css">
<link href="/studyplus/resources/css/froala_editor.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.8.5/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.8.5/css/froala_style.min.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.css">
<link rel="stylesheet" href="/studyplus/resources/css/plugins/code_view.css">

<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/mode/xml/xml.min.js"></script>

<!-- <script type="text/javascript" src="/studyplus/resources/js/froala_editor.min.js" ></script> -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.8.5/js/froala_editor.pkgd.min.js"></script> 

<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->

<!--   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/at.js/1.4.0/js/jquery.atwho.min.js"></script> -->



	<!-- ============================= -->
	<!-- ../js/plugins/draggable.min.js
	../css/plugins/draggable.min.css -->

<style>
  .boardTobBtnArea { text-align:right; }
  .boardTobBtnArea img { width:25px; height:25px; cursor:pointer; vertical-align:top; margin:0px 5px 5px 5px; }

  .boardWritePageWrap { width:500px; max-height:550px; background:#f8f8f8; border-radius:15px;
  						display:inline-flex; padding:20px; }
	.boardWriteModalContentWrap { width:100%; }
	  #boardWriteCategory { cursor:pointer; background:#59d3a5; }
	  .boardWriteAreaWrap { width:500px; overflow-y:auto; min-height:300px; }
		.boardWriteArea { cursor:default; font-size:13px; max-height:455px; /* height:100% */ /* text-align:left; */
						  width:460px; padding:10px; }
		  .boardWriteArea > div { height: 245px;display:inline-block; width:100%; }
			.boardWriteArea > div > .fr-wrapper { min-height:100%; height:auto; display: inline-block; width:100%; }

/* 			.fr-toolbar { display:none; } */

</style>

</head>
<body>
	<input type="hidden" id="grCode" value="${grCode}"/>
	<input type="hidden" id="grLeaderCode" value="${grLeaderCode}"/>
	
	<div class="boardTobBtnArea">
		<img onclick="saveChk();" src="${ contextPath }/resources/images/studyGroupDetail/editIcon2.png"/>
		<img onclick="closeChk();" src="${ contextPath }/resources/images/studyGroupDetail/closeIcon.png"/>
	</div>

	<div class="boardWritePageWrap">
		<div class="boardWriteModalContentWrap">
		
			<div class="boardOneTop">
				<table class="writeMemberInfoTbl">
					<tr>
						<td rowspan="2" class="loginUserNickname"><div class="profImg">
							<img class="loginUserProfImg" src=""/>
						</div></td>
						<td class="nickName"><strong id="boardWriteMem">${loginUser.member_Nickname}</strong></td>
					</tr>
					<tr><td id="boardWriteDate" class="writeDate"></td></tr>
				</table>
				<div id="boardWriteCategory" class="boardCategory radiusBoxSmall category">
<!-- 					질문 -->
<!-- 					<input type="hidden" id="boardCateNum" value="" /> -->
				</div>
			</div>
			
			<div class="boardWriteAreaWrap">
				<div class="boardWriteArea">
					<textarea id="edit" name="contents">
					</textarea>
				</div>
			</div>
			
		</div>	
	</div>
</body>

<script>
	$(function() {
		var today = new Date();
		today = today.getFullYear() + ". " + (today.getMonth() + 1) + ". " + today.getDate() + ". "; 
		
		$('#boardWriteDate').text(today);
		$('.loginUserProfImg').attr("src", "/studyplus/resources/upload/member/thumbnail/${loginUserProf}");
		
// 		$('#boardCateNum').val(1);
// 		boardType = $('#boardCateNum').val();
		var boardType = 3;
		alert(boardType);
		changeCategory();

		$("#boardWriteCategory").click(function(){
			changeCategory(boardType);
		});
		
// 		$('#edit').froalaEditor({
// 			theme : 'red',
// 			autofocus: true,
// 			imageUploadURL:'http://i.froala.com/upload'
// 		});
		 
		$.getScript("/studyplus/resources/js/froala_editor.min.js",
					function() { $('#edit').froalaEditor({
						toolbarInline: false,
						theme : 'red',
						autofocus: true,
 						imageUploadURL:'http://i.froala.com/upload'

					})});
	});
	
</script>

<script>
 	function changeCategory(boardType){
		var leader = $('#grLeaderCode').val();
		loginUser = '${loginUser.member_Code}'; 		
		
		if(boardType <= 2){
			boardType++;
		}else if(boardType > 2){
			if(leader == loginUser){
				boardType = 0;
			}else{
				boardType = 1;
			}
		}
		
// 		$('#boardCateNum').val(boardType);
		alert("함수 안에 들어옴 " + boardType);
		
		if(boardType == 0){
			$('#boardWriteCategory').text("공지");
			$('#boardWriteCategory').css({"background":"#f27553", "color":"white"});
		}else if(boardType == 1){
			$('#boardWriteCategory').text("자유");
			$('#boardWriteCategory').css({"background":"#59d3a5", "color":"black"});
		}else {
			$('#boardWriteCategory').text("질문");
			$('#boardWriteCategory').css({"background":"#59d3a5", "color":"black"});
		}
		
	}

	function closeChk(){
		var closeChk = confirm("게시글 작성을 취소 하시겠습니까?");
		
		if(closeChk){
			displayNone();
		}
	};
	
	function saveChk(){
		var grCode = $('#grCode').val();
		boardType = $('#boardCateNum').val();
		alert(boardType);
		
		var editor = $("#edit");
		
		if(editor.value == ""){
			alert("게시글을 작성 해주세요.")
			
		}else if(editor.value != ""){
			var saveChk = confirm("게시글을 등록 하시겠습니까?");
			
			if(saveChk){
				$.ajax({
					url:"insertGroupBoardWrite.sgd",
					data : { grCode : grCode, contents : editor,
							 loginUserCode : loginUser, boardType : boardType },
					
					success:function(data) {
						location.href="selectOneGroup.sgd?group_No=" + grCode;
					}
				});
			}
		}
	};
</script>


</html>