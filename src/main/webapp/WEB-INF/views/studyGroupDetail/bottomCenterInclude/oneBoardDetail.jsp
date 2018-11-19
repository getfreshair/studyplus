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
	.editBtnArea { text-align:left; }
	  .editBtnArea img { width:25px; height:25px; cursor:pointer; vertical-align:top; margin:0px 0px 5px 5px; }

	.boardDetailPageWrap { display:inline-flex; width:100%; }
	  .oneBoardDetailWrap { width:900px; height:550px; background:mistyrose; border-radius:15px; display:inline-flex; padding:20px; }
		.boardSideWrap { width:50%; display:contents; }
		.boardDetailLeft { width:100%; padding-right:20px; border-right:1px solid; }
		  .boardContentview { width:100%; height:100%; overflow:hidden; min-height:300px; }
  	    	.contentArea { cursor:default; font-size:13px; text-align:left; max-height:100%; }
	
	
		.boardDetailRight { width:100%; height:100%; padding-left:20px; display:table-cell; }
		.replyListWrapArea { width:100%; max-height:435px; margin-bottom:10px; overflow:hidden; }
		.replyListArea { overflow-y:scroll; padding-right:7px; margin-bottom:5px; max-height:390px; width:105%; }
		  .oneReplyWrap { width:100%; display:inline-flex; margin-bottom:10px; }
		  .replyMemberInfoTbl { width:100%; margin-right:auto; }
			.replyMemberInfoTbl td { text-align:left; padding-left:12px; padding-right:5px;
									 vertical-align:middle; font-size:11px; }
			.replyMemberProfImg { padding-left:0px !important; padding-right:0px !important; vertical-align:top !important; }
			  .replyMemberProfImg div { width:40px; height:40px; overflow:hidden; border-radius:50%;  }
				.replyMemberProfImg img { width:100% !important; }
			.replyMemberNick { height:25px; font-size:12px !important; line-height:1.2; word-break:break-all; }
			.replyDate { width:30%; font-weight:bold; text-align:right !important; }
			.deleteBoardReplyBtn { width:10px; cursor:pointer; color:gray; font-weight:normal; margin-top:23px; }
			.deleteBoardReplyBtn:hover { color:black; font-weight:bold; }
		.replyWriteWrap { border-bottom-right-radius:15px; border-bottom-left-radius:15px; background:lightgray; padding: 10px 10px 5px 10px; }
		  .replyWriteTextAreaTd { width:80%; }
			.replyWirteArea { resize:none; width:100%; }
		  .replyWriteBtnAreaTd { width:20%; }
		    .replyWriteBtn { width:80%; margin:auto; margin-right:0px; border-radius:10px; background:rgb(41, 128, 185); 
		    				 font-weight:bold; padding:10px; 5px; color:white; }
</style>

</head>
<body>

	<div class="editBtnArea">
		<img src="${ contextPath }/resources/images/studyGroupDetail/edit2.png" />
		<img src="${ contextPath }/resources/images/studyGroupDetail/delete2.png" />
		<img onclick="displayNone();" src="${ contextPath }/resources/images/studyGroupDetail/closeIcon.png" style="margin-right:5px; float:right;"/>
	</div>

	<div class="boardDetailPageWrap">
		<div class="oneBoardDetailWrap">
			<div class="boardSideWrap">
			
				<div class="boardDetailLeft">
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
					<div class="boardContentPrevWrap">
						<div class="boardContentview"><div class="contentArea scrollBlind">
							발휘하기 웅대한 별과 이상 것이다. 얼마나 소리다.이것은 구하지 얼음에 발휘하기 우리의 쓸쓸하랴? 하였으며, 인생을 생생하며, 보이는 보이는 동산에는 곳으로 웅대한 있는가?
							천하를 어디 황금시대를 설산에서 갑 열락의 웅대한 있는가? 인류의 설레는 구하지 오아이스도 능히 우는 하는 있는 이것이다.
						</div></div>
					</div>
				</div>	
					
				<div class="boardDetailRight">
				
					<div class="replyListWrapArea">
						<div class="boardBottomStatusWrap" style="margin-bottom:10px;">
							<div class="boardStatus">
								<img src="${ contextPath }/resources/images/studyGroupDetail/heartEmpty.png" />
	<%-- 							<img src="${ contextPath }/resources/images/studyGroupDetail/heartFull.png" /> --%>
								<strong class="reactCnt">3</strong>
								<img src="${ contextPath }/resources/images/studyGroupDetail/reply.png" />
								<strong class="reactCnt">3</strong>
							</div>
							<hr class="bottomLine">
						</div>
						
						<div class="replyListArea">
							<div class="oneReplyWrap">
								<table class="replyMemberInfoTbl">
									<tr>							
										<td rowspan="2" width="40px" class="replyMemberProfImg"><div>
											<img src="${ contextPath }/resources/upload/member/thumbnail/23f1a78349d748ba827474a6f638d8d4"/>
										</div></td>
										<td class="replyMemberNick"><strong>닉네임자리</strong></td>
										<td class="replyDate">
		<%-- 								<fmt:formatDate value="${i.JOINGROUP_ENROLLDATE}" pattern="yyyy. MM. dd."/> --%>
											2018. 11. 17.
										</td>
									</tr>
									<tr><td colspan="2" rowspan="2" class="reply">
										발휘하기 웅대한 별과 이상 것이다. 얼마나 소리다.이것은 구하지 얼음에 발휘하기 우리의 쓸쓸하랴?
									</td></tr>
								</table>
								<div onclick="();" class="deleteBoardReplyBtn" title="삭제하기">×</div>
							</div>
							
							
							<div class="oneReplyWrap">
								<table class="replyMemberInfoTbl">
									<tr>							
										<td rowspan="2" width="40px" class="replyMemberProfImg"><div>
											<img src="${ contextPath }/resources/upload/member/thumbnail/23f1a78349d748ba827474a6f638d8d4"/>
										</div></td>
										<td class="replyMemberNick"><strong>닉네임자리</strong></td>
										<td class="replyDate">
		<%-- 								<fmt:formatDate value="${i.JOINGROUP_ENROLLDATE}" pattern="yyyy. MM. dd."/> --%>
											2018. 11. 17.
										</td>
									</tr>
									<tr><td colspan="2" rowspan="2" class="reply">
										발휘하기 웅대한 별과 이상 것이다. 얼마나 소리다.이것은 구하지 얼음에 발휘하기 우리의 쓸쓸하랴?
									</td></tr>
								</table>
								<div onclick="();" class="deleteBoardReplyBtn" title="삭제하기">×</div>
							</div>
						</div>
					</div>
					
					<div class="replyWriteWrap">
						<table style="width:100%;"><tr>
							<td class="replyWriteTextAreaTd">
								<div>
									<textArea class="replyWirteArea"></textArea>
								</div>
							</td>
							<td class="replyWriteBtnAreaTd">
								<div class="replyWriteBtn">Reply</div>
							</td>
						</tr></table>
					</div>
				</div>	
									
			</div>
		</div>
			
	</div>
</body>


</html>