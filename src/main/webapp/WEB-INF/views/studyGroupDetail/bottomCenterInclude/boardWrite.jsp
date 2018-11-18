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



<style>
  .boardTop { display:inline-flex; width:100%; }
	.prevListBtn { font-size:13px; color:white; /* font-weight:bold; */ background:rgb(41, 128, 185); border-radius:20px;
					margin-right:auto; margin-bottom:10px; padding:5px 15px; display:table; }
	.prevListBtn:hover { cursor:pointer; /* color:white; */ font-weight:bold; }
	.centerFilterMenu { margin-right:15px; padding-left:15px; padding-bottom:10px; border-bottom:1px solid gray;
						margin-bottom:10px; text-align:right; }
	 .boardEditBtn { padding:0px 5px; width:40px; }
  .boardListWrap { width:100%; display:inline-block;
  				   overflow-y:auto; height:100%; max-height:590px; min-height:480px }
	.boardListArea { width:521.7px; }
      
      .boardOneWrap { background:mistyrose; width:100%; border-radius:15px; padding:20px; margin-bottom:10px; }
	   .boardOneTop { width:100%; display:inline-flex; }
		 .writeMemberInfoTbl { margin-right:auto; }
		   .writeMemberInfoTbl td { text-align:left; padding-left:12px; vertical-align:middle; }
           .writerProfImg { padding-left:0px !important; }
           .writeDate { font-weight:normal; font-size:11px; }
  	     .boardCategory { height:100%; border-radius:15px;
  	    				  background:lightgray; padding:3px 10px; font-size:12px; font-weight:bold;  }
  	   .boardContentPrevWrap { width:100%; padding:10px; }
  	     .boardContentPreview { width:100%; height:100%; overflow:hidden; cursor:pointer !important; }
  	       .scrollBlind { width:105%; height:100%; max-height:130px;
  	       				  overflow-y:scroll; padding-right:5px; }
  	       .contentPreArea { cursor:pointer; font-size:13px; text-align:left; }
  	   .bottomLine { border-bottom:1px solid gray; margin:5px 0px; }
  	   .boardStatus { width:100%; text-align:left; padding:0px 10px; display:table; }	  
  	     .boardStatus img { width:20px; height:100%; margin-right:3px; cursor:pointer; }	  
  	     .reactCnt { margin-right:10px; vertical-align:bottom; cursor:default; }	  
</style>

</head>
<body>
	<div class="boardListPageWrap">
	
			<div class="boardTop">
				<div id="" class="prevListBtn">이전으로</div>
				<div class="boardEditBtnArea">
					<span id="" class="menuBtn boardEditBtn">
<%-- 						<img src="${ contextPath }/resources/images/studyGroupDetail/editIcon.png"/> --%>
<%-- 						<img src="${ contextPath }/resources/images/studyGroupDetail/editIcon.png"/> --%>
					</span>
					<span>|</span>
					<span id="" class="menuBtn boardFilterBtn">공지</span>
					<span>|</span>
					<span id="" class="menuBtn boardFilterBtn">질문</span>
					<span>|</span>
					<span id="" class="menuBtn boardFilterBtn">자유</span>
				</div>
			</div>
			
			<div class="boardListWrap">
				<div class="boardListArea">
				
					<div class="boardOneWrap">
						<div class="boardOneTop">
							<table class="writeMemberInfoTbl">
								<tr>							
									<td rowspan="2" class="writerProfImg">
										<div class="profImg">
											<img src="${ contextPath }/resources/upload/member/thumbnail/23f1a78349d748ba827474a6f638d8d4"/>
			<%-- 								<img src="${ contextPath }/resources/upload/member/thumbnail/${list[i].FILES_NAME}" /> --%>
										</div>
									</td>
									<td class="nickName"><strong>닉네임자리</strong></td>
								</tr>
								<tr><td class="writeDate">
	<%-- 								<fmt:formatDate value="${i.JOINGROUP_ENROLLDATE}" pattern="yyyy. MM. dd."/> --%>
									2018. 11. 17.
								</td></tr>
							</table>
							<div class="boardCategory">자유</div>
						</div>
						
						<div class="boardContentPrevWrap">
							<div class="boardContentPreview">
								<div class="contentPreArea scrollBlind">
								
									<!-- 에디터 영역 -->
				                      <textarea id="editor" name="contents"></textarea>
				                    <!-- // 에디터 영역 -->

								
									<script>
											$(function() {
												$('#editor').froalaEditor({
											      language: 'ko'
													
												})
											});
											
											
											
									</script>
									
								</div>
							</div>
						</div>
						<hr class="bottomLine">
						<div class="boardStatus">
							<img src="${ contextPath }/resources/images/studyGroupDetail/heartIcon.png" />
							<strong class="reactCnt">3</strong>
							<img src="${ contextPath }/resources/images/studyGroupDetail/replyIcon2.png" />
							<strong class="reactCnt">3</strong>
						</div>
					</div>
					
				</div>
			</div>
			
	</div>
</body>

<script>	
	
	
	
</script>
</html>