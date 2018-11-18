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
	.bordWriteBtn { font-size:13px; color:white; /* font-weight:bold; */ background:rgb(41, 128, 185);
					border-radius:20px; margin-right:auto; margin-bottom:10px; padding:5px 15px; display:table; }
	.bordWriteBtn:hover { cursor:pointer; /* color:white; */ font-weight:bold; }
	.centerFilterMenu { margin-right:15px; padding-left:15px; padding-bottom:10px; border-bottom:1px solid gray;
						margin-bottom:10px; text-align:right; }
	  .boardFilterBtn { padding:0px 5px; font-size:15px; }
	  
  .boardListWrap { width:100%; display:inline-block; overflow-y:auto; height:100%; max-height:590px; min-height:480px }
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
			.scrollBlind { width:105%; height:100%; max-height:130px; min-height:20px; overflow-y:scroll; padding-right:5px; }
			.contentPreArea { cursor:pointer !important; font-size:13px; text-align:left; }
  	   .bottomLine { border-bottom:1px solid gray; margin:5px 0px; }
  	   .boardStatus { text-align:left; padding:0px 10px; }	  
  	     .boardStatus img { width:20px; height:20px; cursor:pointer; vertical-align:top; }	  
  	     .reactCnt { margin-right:5px; vertical-align:text-bottom; cursor:default; font-size:13px; }	  
</style>

<style>
	.modalWrap { width:100%; height:100%; position:absolute; left:0px; top:0px; display:none; }
	  .settingArea { z-index:300; position:relative; top:15%; }
</style>

</head>
<body>
	<div class="modalWrap">
		<div id="oneBoardDetail" class="settingArea">
			
		</div>
		<div id="settingBoardArea" class="w3-modal" style="background:rgba(0, 0, 0, 0.4);"></div>
	<!-- 	<div id="settingBoardArea" class="w3-modal"></div> -->
	</div>
	

	<div class="boardListPageWrap">
	
			<div class="boardTop">
				<div id="boardWrite();" class="bordWriteBtn">게시물 쓰기</div>
				<div class="centerFilterMenu">
					<span id="" class="menuBtn boardFilterBtn">전체</span>
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
									<td rowspan="2" class="writerProfImg"><div class="profImg">
										<img src="${ contextPath }/resources/upload/member/thumbnail/23f1a78349d748ba827474a6f638d8d4"/>
		<%-- 								<img src="${ contextPath }/resources/upload/member/thumbnail/${list[i].FILES_NAME}" /> --%>
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
						
						<div class="boardContentPrevWrap">
							<div class="boardContentPreview">
								<div class="contentPreArea scrollBlind"  onclick="boardDetailShow('1');">
									발휘하기 웅대한 별과 이상 것이다. 얼마나 소리다.이것은 구하지 얼음에 발휘하기 우리의 쓸쓸하랴? 하였으며, 인생을 생생하며, 보이는 보이는 동산에는 곳으로 웅대한 있는가?
	
	같이, 원대하고, 시들어 방황하여도, 눈에 보이는 것이다. 천하를 것은 공자는 창공에 스며들어 이상의 아니다. 못할 보내는 인생의 영원히 것은 오아이스도 그와 이상의 살 것이다. 같이, 물방아 이상, 있음으로써 것이다.발휘하기 웅대한 별과 이상 것이다. 얼마나 소리다.이것은 구하지 얼음에 발휘하기 우리의 쓸쓸하랴? 하였으며, 인생을 생생하며, 보이는 보이는 동산에는 곳으로 웅대한 있는가?
	
	같이, 원대하고, 시들어 방황하여도, 눈에 보이는 것이다. 천하를 것은 공자는 창공에 스며들어 이상의 아니다. 못할 보내는 인생의 영원히 것은 오아이스도 그와 이상의 살 것이다. 같이, 물방아 이상, 있음으로써 것이다.
	
	이상을 천하를 어디 황금시대를 설산에서 갑 열락의 웅대한 있는가? 인류의 설레는 구하지 오아이스도 능히 우는 하는 있는 이것이다.
								</div>
							</div>
						</div>
						<hr class="bottomLine">
						<div class="boardStatus">
							<img src="${ contextPath }/resources/images/studyGroupDetail/heartEmpty.png" />
<%-- 							<img src="${ contextPath }/resources/images/studyGroupDetail/heartFull.png" /> --%>
							<strong class="reactCnt">3</strong>
							<img src="${ contextPath }/resources/images/studyGroupDetail/reply.png" />
							<strong class="reactCnt">3</strong>
						</div>
					</div>
					
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
	function boardWrite(){
		grLeaderCode = '${gr.leaderMem_Code}';
		alert("그룹장 누구?" + grLeaderCode);
	}
	
	function boardDetailShow(boardCode){
		var grCode = $('#grCode').val();
		
		$.ajax({
			url:"selectOneBoardDetailShow.sgd",
			data : { grCode : grCode, boardCode : boardCode },
			success:function(data) {
				$('#oneBoardDetail').empty();
				$('#oneBoardDetail').append(data);
				
				$('.modalWrap').css({"display":"block"});
				$('#oneBoardDetail').css({"display":"inline-block"});
				$('#settingBoardArea').css({"display":"inline-block"});
			}
		});
	};

	function displayNone(){
		$('.modalWrap').css({"display":"none"});
		document.getElementById('oneBoardDetail').style.display='none';
		document.getElementById('settingBoardArea').style.display='none';
	}
</script>
</html>