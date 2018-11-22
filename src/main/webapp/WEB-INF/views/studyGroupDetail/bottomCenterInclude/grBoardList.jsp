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
	.bordWriteBtn { font-size:13px; color:white; /* font-weight:bold; */ background:#00a0e9;
					border-radius:20px; margin-right:auto; margin-bottom:10px; padding:5px 15px; display:table; }
	.bordWriteBtn:hover { cursor:pointer; /* color:white; */ font-weight:bold; }
	.centerFilterMenu { margin-right:15px; padding-left:15px; padding-bottom:10px; border-bottom:1px solid gray;
						margin-bottom:10px; text-align:right; }
	  .boardFilterBtn { padding:0px 5px; font-size:15px; }
	  
  .boardListWrap { width:100%; display:inline-block; overflow-y:scroll; height:100%; max-height:590px; min-height:480px }
	.boardListArea { width:521.7px; }
      
      .boardOneWrap { background:mistyrose; width:100%; border-radius:15px; padding:20px; margin-bottom:10px; }
		.boardOneTop { width:100%; display:inline-flex; }
		  .writeMemberInfoTbl { margin-right:auto; }
			.writeMemberInfoTbl td { text-align:left; padding-left:12px; vertical-align:middle; }
			.writerProfImg { padding-left:0px !important; width:50px; }
			.writeDate { font-weight:normal; font-size:12px; }
		  .boardCategory { display:inline-block; height:100%; }
		.boardContentPrevWrap { width:100%; padding:10px; }
		  .boardContentPreview { width:100%; height:100%; overflow:hidden; }
			.scrollBlind { width:105.5%; height:100%; max-height:130px; min-height:20px; overflow-y:scroll; padding-right:7px; }
			.contentPreArea { cursor:pointer !important; font-size:13px; text-align:left; }
  	   .boardBottomStatusWrap { width:100%; }
  	     .bottomLine { border-bottom:1px solid gray; margin:5px 0px; }
  	     .boardStatus { text-align:right; padding:0px 10px; }	  
  	       .boardStatus img { width:25px; height:25px; cursor:pointer; vertical-align:top; }	  
  	       .reactCnt { margin-right:5px; vertical-align:text-bottom; cursor:default; font-size:13px; }	  
</style>

<style>
	.modalWrap { width:100%; height:100%; position:absolute; left:0px; top:0px; display:none; }
	  .settingArea { z-index:300; position:relative; top:25%; }
</style>

</head>
<body>
	<div class="modalWrap">
		<div id="settingModalArea" class="settingArea">
			
		</div>
		<div id="settingModalBack" class="w3-modal" style="background:rgba(0, 0, 0, 0.4);"></div>
		<!-- 	<div id="settingModalBack" class="w3-modal"></div> -->
	</div>
	

	<div class="boardListPageWrap">
			<div class="boardTop">
				<div onclick="boardWriteModalShow('${ grCode }');" class="bordWriteBtn">게시물 쓰기</div>
<!-- 				<div class="centerFilterMenu">
					<span id="" class="menuBtn boardFilterBtn">전체</span>
					<span>|</span>
					<span id="" class="menuBtn boardFilterBtn">공지</span>
					<span>|</span>
					<span id="" class="menuBtn boardFilterBtn">질문</span>
					<span>|</span>
					<span id="" class="menuBtn boardFilterBtn">자유</span> -->
				</div>
			</div>
			
			<div class="boardListWrap">
				<div class="boardListArea">
				  
				 <c:forEach var="i" items="${boardList}">
	               <div class="boardOneWrap">
	                  <div class="boardOneTop">
	                     <table class="writeMemberInfoTbl">
	                        <tr>                     
	                           <td rowspan="2" class="writerProfImg"><div class="profImg">
	                              <img src="${ contextPath }/resources/upload/member/thumbnail/${i.FILES_NAME}"/>
	                           </div></td>
	                           <td class="nickName"><strong>${i.MEMBER_NICKNAME}</strong></td>
	                        </tr>
	                        <tr><td class="writeDate">
	<%--                            <fmt:formatDate value="${i.GROUPBOARD_POSTDATE}" pattern="yyyy. MM. dd."/> --%>
	                           ${i.GROUPBOARD_POSTDATE}
	                        </td></tr>
	                     </table>
	                     <div class="boardCategory radiusBoxSmall category">
	                       <c:if test="${i.GROUPBOARD_TYPE == 0}">공지</c:if>
	                       <c:if test="${i.GROUPBOARD_TYPE == 1}">자유</c:if>
	                       <c:if test="${i.GROUPBOARD_TYPE == 2}">질문</c:if>
	                     </div>
	                  </div>
	                  
	                  <div class="boardContentPrevWrap">
	                     <div class="boardContentPreview">
	                        <div class="contentPreArea scrollBlind"  onclick="boardDetailShow(${i.GROUPBOARD_CODE});">
	                           ${i.GROUPBOARD_CONTENT}
	                        </div>
	                     </div>
	                  </div>
	                  <div class="boardBottomStatusWrap">
	                     <hr class="bottomLine">
	                     <div class="boardStatus">
	                       <c:if test="${i.ISLIKE > 0}">   <!-- 내가 눌렀는지 확인하기 -->
	                        <img src="${ contextPath }/resources/images/studyGroupDetail/heartFull.png" />
	                       </c:if>
	                       <c:if test="${i.ISLIKE == 0}">   <!-- 내가 눌렀는지 확인하기 -->
	                        <img src="${ contextPath }/resources/images/studyGroupDetail/heartEmpty.png" />
	                       </c:if>
	                       
	                        <strong class="reactCnt">${i.CLICK_LIKE_CNT}</strong>
	                        <img src="${ contextPath }/resources/images/studyGroupDetail/reply.png" />
	                        <strong class="reactCnt">${i.REPLY_CNT}</strong>
	                     </div>
	                  </div>
	               </div>
	             </c:forEach>
					
					
				</div>
			</div>
		
			<div class="pagingArea">
				<ul class="pagination" style="margin-bottom:0px;">
				  <li>
				    <a href="#" aria-label="Previous" style="margin-right:20px;">
				      <span aria-hidden="true">&laquo;</span>
				    </a>
				  </li>
				  <li><a href="#">1</a></li>
				  <li><a href="#">2</a></li>
				  <li><a href="#">3</a></li>
				  <li><a href="#">4</a></li>
				  <li><a href="#">5</a></li>
				  <li>
				    <a href="#" aria-label="Next" style="margin-left:20px;">
				      <span aria-hidden="true">&raquo;</span>
				    </a>
				  </li>
				</ul>
			</div>
				
			
	</div>
</body>

<script>	
	function boardWriteModalShow(grCode){
		var grLeaderCode = $('#grLeaderCode').val();
		
	
// 		contentType: false,
// 		processData: false,
//	/* 	async : true, */
		
		$.ajax({
			url:"goBoardWriteModalPage.sgd",
			data : { grCode : grCode, grLeaderCode : grLeaderCode },
			
			success:function(data) {
				$('#settingModalArea').empty();
				$('#settingModalArea').append(data);
				
				$('.modalWrap').css({"display":"block"});
				$('#settingModalArea').css({"display":"inline-block"});
				$('#settingModalBack').css({"display":"inline-block"});
			}
		});
		
	}
	
	function boardDetailShow(boardCode){
		var grCode = $('#grCode').val();
		
		$.ajax({
			url:"selectOneBoardDetailShow.sgd",
			data : { grCode : grCode, boardCode : boardCode },
			
			success:function(data) {
				$('#settingModalArea').empty();
				$('#settingModalArea').append(data);
				
				$('.modalWrap').css({"display":"block"});
				$('#settingModalArea').css({"display":"inline-block"});
				$('#settingModalBack').css({"display":"inline-block"});
			}
		});
	};

	function displayNone(){
		$('.modalWrap').css({"display":"none"});
		document.getElementById('settingModalArea').style.display='none';
		document.getElementById('settingModalBack').style.display='none';
	}
</script>
</html>