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
	  .oneBoardDetailWrap { width:900px; background:mistyrose; border-radius:15px; display:inline-flex; padding:20px; }
		.boardSideWrap { width:50%; display:contents; }
		.boardDetailLeft { width:100%; padding-right:15px; border-right:1px solid; }
		  .boardContentview { width:100%; height:100%; overflow:hidden; min-height:300px; }
  	    	.contentArea { cursor:default; font-size:13px; text-align:left; max-height:100%; }
	
	
		.boardDetailRight { width:100%; padding-left:15px; }
		  .replyMemberInfoTbl { width:100%; margin-right:auto; }
			.replyMemberInfoTbl td { text-align:left; padding-left:12px; vertical-align:middle; }
			.replyMemberProfImg { padding-left:0px !important; width:40px !important; }
			.replyMemberProfImg img { padding-left:0px !important; width:100% !important; }
			.replyDate { width:30%; text-align:right; }
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
						<div class="boardContentview"><div class="contentArea scrollBlind">
							발휘하기 웅대한 별과 이상 것이다. 얼마나 소리다.이것은 구하지 얼음에 발휘하기 우리의 쓸쓸하랴? 하였으며, 인생을 생생하며, 보이는 보이는 동산에는 곳으로 웅대한 있는가?
							천하를 어디 황금시대를 설산에서 갑 열락의 웅대한 있는가? 인류의 설레는 구하지 오아이스도 능히 우는 하는 있는 이것이다.
						</div></div>
					</div>
					<hr class="bottomLine">
					<div class="boardStatus">
<%-- 						<img src="${ contextPath }/resources/images/studyGroupDetail/heartEmpty.png"/> --%>
						<img src="${ contextPath }/resources/images/studyGroupDetail/heartFull.png"/>
						<strong class="reactCnt">3</strong>
						<img src="${ contextPath }/resources/images/studyGroupDetail/reply.png"/>
						<strong class="reactCnt">3</strong>
					</div>
				</div>	
					
				<div class="boardDetailRight">
					<div class="boardOneTop">
						<table class="replyMemberInfoTbl">
							<tr>							
								<td rowspan="2" class="replyMemberProfImg"><div class="profImg">
										<img src="${ contextPath }/resources/upload/member/thumbnail/23f1a78349d748ba827474a6f638d8d4"/>
		<%-- 								<img src="${ contextPath }/resources/upload/member/thumbnail/${list[i].FILES_NAME}" /> --%>
								</div></td>
								<td class="nickName"><strong>닉네임자리</strong></td>
								<td class="writeDate replyDate">
<%-- 								<fmt:formatDate value="${i.JOINGROUP_ENROLLDATE}" pattern="yyyy. MM. dd."/> --%>
								2018. 11. 17.
								</td>
							</tr>
							<tr><td colspan="3" class="reply">
								발휘하기 웅대한 별과 이상 것이다. 얼마나 소리다.이것은 구하지 얼음에 발휘하기 우리의 쓸쓸하랴?
							</td></tr>
						</table>
					</div>
				</div>	
									
			</div>
		</div>
			
	</div>
</body>


</html>