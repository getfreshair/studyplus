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
<!-- 
	<!-- CSS rules for styling the element inside the editor such as p, h1, h2, etc. -->
<!-- 	<link href="/studyplus/resources/css/froala_style.min.css" rel="stylesheet" type="text/css" /> -->

	
	
<!-- <link href="/studyplus/resources/css/font_awesome.min.css" rel="stylesheet"> -->
<!-- <link href="/studyplus/resources/css/froala_editor.pkgd.min.css" rel="stylesheet"> -->
<!-- <link href="/studyplus/resources/css/froala_editor.pkgd.min.css" rel="stylesheet"> -->

<!-- <script src="/studyplus/resources/js/font_awesome.min.js"></script> -->
<!-- <script src="/studyplus/resources/js/froala_editor.pkgd.min.js"></script> -->
<!-- <script src="/studyplus/resources/js/froala_editor.pkgd.min.js"></script> -->



<!-- ***************** -->
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.8.5/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.8.5/css/froala_style.min.css" rel="stylesheet" type="text/css" />



<!-- 


***********************

  <link href="https://use.fontawesome.com/releases/v5.0.8/css/all.css" rel="stylesheet">
  <link rel="stylesheet" href="../../css/froala_editor.pkgd.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/at.js/1.4.0/css/jquery.atwho.min.css">

  Code Mirror CSS file.
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.css">

  Include the plugin CSS file.
  <link rel="stylesheet" href="../../css/plugins/code_view.css">

	<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/mode/xml/xml.min.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/at.js/1.4.0/js/jquery.atwho.min.js"></script>

  <script type="text/javascript" src="../../js/froala_editor.pkgd.min.js"></script>
  ================================
 -->
<style>
  .boardTobBtnArea { text-align:right; }
  .boardTobBtnArea img { width:25px; height:25px; cursor:pointer; vertical-align:top; margin:0px 5px 5px 5px; }

  .boardWritePageWrap { width:500px; max-height:550px; background:mistyrose; border-radius:15px;
  						display:inline-flex; padding:20px; }
	.boardWriteModalContentWrap { width:100%; }
	  .boardWriteAreaWrap { width:500px; height:100%; overflow-y:auto; min-height:300px; }
		.boardWriteArea { cursor:default; font-size:13px; max-height:455px; /* height:100% */ /* text-align:left; */
						  width:460px; padding:10px; }
</style>

</head>
<body>

	<div class="boardTobBtnArea">
		<img onclick="saveChk();" src="${ contextPath }/resources/images/studyGroupDetail/editIcon2.png"/>
		<img onclick="closeChk();" src="${ contextPath }/resources/images/studyGroupDetail/closeIcon.png"/>
	</div>

	<div class="boardWritePageWrap">
		<div class="boardWriteModalContentWrap">
		
			<div class="boardOneTop">
				<table class="writeMemberInfoTbl">
					<tr>
						<td rowspan="2" class="writerProfImg"><div class="profImg">
							<img src="${ contextPath }/resources/upload/member/thumbnail/23f1a78349d748ba827474a6f638d8d4"/>
						</div></td>
						<td class="nickName"><strong>닉네임자리</strong></td>
					</tr>
					<tr><td class="writeDate">
<%-- 								<fmt:formatDate value="${i.JOINGROUP_ENROLLDATE}" pattern="yyyy. MM. dd."/> --%>
						2018. 11. 17.
					</td></tr>
				</table>
				<div class="boardCategory radiusBoxSmall category">자유</div>
			</div>
			
			
<!-- 			<div class="boardWriteAreaWrap"> -->
<!-- 				<div class="boardWriteArea"> -->
<!-- <!-- 					<textarea id="editor" name="contents"> --> 
<!-- <!-- 					<textarea id="editor" name="editor" style="height:100%;"> -->
<!-- <!-- 						발휘하기 웅대한 별과 이상 것이다. 얼마나 소리다.이것은 구하지 얼음에 발휘하기 우리의 쓸쓸하랴? 하였으며, 인생을 생생하며, 보이는 보이는 동산에는 곳으로 웅대한 있는가? --> 
<!-- <!-- 						천하를 어디 황금시대를 설산에서 갑 열락의 웅대한 있는가? 인류의 설레는 구하지 오아이스도 능히 우는 하는 있는 이것이다. -->
<!-- <!-- 					</textarea> --> 
<!-- 					 <section id="editor" style="text-align:left; width: 810px; margin-left: 60px; "> -->
<!--                			<textarea readonly="readonly" id='edit' name="edit" style="margin-top: 30px; height:500px;"> -->
<!-- 							발휘하기 웅대한 별과 이상 것이다. 얼마나 소리다.이것은 구하지 얼음에 발휘하기 우리의 쓸쓸하랴? 하였으며, 인생을 생생하며, 보이는 보 -->
<!--               			 </textarea>  -->
<!--          			</section> -->
<!-- 				</div> -->
<!-- 			</div>  -->
			
			
   	 <div id="contentWrite2"> 
<!--          <h5>게시글 작성</h5> -->
            <section id="editor" style="text-align:left; width: 810px; margin-left: 60px; ">
               <textarea readonly="readonly" id='edit' name="edit" style="margin-top: 30px; height:500px;">

               </textarea>  
         </section>
       </div>			
			
			<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/mode/xml/xml.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.8.5/js/froala_editor.pkgd.min.js"></script> 
			
     <script> 
     $(function(){
    	 
		$('#edit').froalaEditor({   
        	theme : 'red',
        	imageUploadURL:'http://i.froala.com/upload'     
   		});
     });
 	</script>
			
			
		</div>	
	</div>
</body>
<!-- 
<script>
	$(function() {
		$('#editor').froalaEditor({
			autofocus: true
		});
	});
</script>
 -->
<script>
	function closeChk(){
		var closeChk = confirm("게시글 작성을 취소 하시겠습니까?");
		
		if(closeChk){
			displayNone();
		}
	};
	
	function saveChk(){
		var editor = $("#editor");
		
		if(editor.value == ""){
			alert("게시글을 작성 해주세요.")
			
		}else if(editor.value != ""){
			var saveChk = confirm("게시글을 등록 하시겠습니까?");
			
			if(saveChk){
	// 			컨트롤러 호출 하고 디테일 페이지 다시 부르기 (ajax x)
				
			}
		}
	}

</script>


</html>