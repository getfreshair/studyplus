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
  /*	그룹원 리스트 - 회원 표시 영역 -> 메인에 작성 */	
  
  .enrollDate { font-weight:normal; font-size:11px; }	
  .listBtn { cursor:pointer; border-radius:15px;  display:table-cell; vertical-align:middle;
  			 font-size:11px; font-weight:bold; height:25px; padding: 5px 3px; }
	.addFriendBtn{ background:lightgray; text-align:center; width:57px; }
	/* 그룹장 속성 */			
	.changeLeaderBtn { width:80px;  padding:0px 8px; background:skyblue; text-align:center; }
	.cancelChangeBtn {  width:80px; background:#f74545; text-align:center; color:white; }
	.showChangeLeader { display:none; }
	.deleteGroupMemberBtn { cursor:pointer; color:gray; font-weight:normal; }
	.deleteGroupMemberBtn:hover { color:black; font-weight:bold; }
					
</style>

</head>
<body>
	<div class="listPageWrap">
	
		<div class="memberListArea">		

		<!-- 그룹장 바꾸기 버튼 누르면 hideChangeLeader 가진 요소 숨김 toggleChangeLeaderBtn보이게 -->
			<div class="memberOneWrapArea">
			  <c:forEach var="i" items="${grMemList}">
<%-- 		  	  <c:forEach var="i" begin="0" end="${fn:length(grMemList) - 1}" step="1" > --%>
				<table class="memberInfo">
					<tr>							
						<td rowspan="2">
						  <c:if test="${i.LEADER_CODE == i.MEMBER_CODE}">
<%-- 						  <c:if test="${grMemList[i].LEADER_CODE == grMemList[i].MEMBER_CODE}"> --%>
							<div class="rankImg">
								<img width="100%" src="${ contextPath }/resources/images/studyGroupDetail/grLeader.png" />
							</div>
						  </c:if>							
							<div class="profImg">
<%-- 								<input type="hidden" id="memCode" value="${i.MEMBER_CODE}"/> --%>
								<img src="${ contextPath }/resources/upload/member/thumbnail/${i.FILES_NAME}" />
							</div></td>
						<td class="nickName"><strong>${i.MEMBER_NICKNAME}</strong></td>
						
					  <!-- 로그인유저가 그룹장 일 때 해당 버튼 보이기 -->
					  <c:if test="${i.LEADER_CODE == loginUserCode}">
					   <c:if test="${i.LEADER_CODE == i.MEMBER_CODE}">
						<td rowspan="2" colspan="2">
							<!-- 요소 클릭시 hideCh~속성 디스플레이 논, 캔슬버튼 쇼 , 취소 클릭시 디스플레이 논 반대 풀기 -->
							<div onclick="hideChangeLeader();" class="listBtn changeLeaderBtn hideChangeLeader">그룹장 변경</div>
							<div onclick="cancelChangeLeader();" class="listBtn cancelChangeBtn showChangeLeader">변경취소</div>
						</td>
					   </c:if>
					  </c:if>	
					  <!-- 로그인유저가 그룹장 일 때 해당 버튼 보이기 끝 -->
					  
					  <!-- 로그인유저가 그룹장이 아닐 때 해당 버튼  보이기 -->
					  <c:if test="${i.MEMBER_CODE != loginUserCode}">
						<td rowspan="2">
							<div class="listBtn addFriendBtn <c:if test="${i.LEADER_CODE == loginUserCode}">hideChangeLeader</c:if>">친구신청</div>
						  <c:if test="${i.LEADER_CODE == loginUserCode}">
							<div onclick="changeGrLeader('${i.MEMBER_CODE}', '${loginUserCode}');" class="listBtn changeLeaderBtn showChangeLeader">그룹장 위임</div>
						  </c:if>
						</td>
					  </c:if>
					  <!-- 로그인유저가 그룹장이 아닐 때 해당 버튼 보이기 끝 -->
					  
					  <c:if test="${i.LEADER_CODE == loginUserCode}">
					   <c:if test="${i.LEADER_CODE != i.MEMBER_CODE}">
						<td rowspan="2" class="hideChangeLeader">
							<div onclick="kickOutGrMember('${i.MEMBER_CODE}', '${i.MEMBER_NICKNAME}', '${loginUserCode}', '${i.LEADER_CODE}');" class="deleteGroupMemberBtn" title="강퇴하기">×</div>
						</td>
					   </c:if>
					  </c:if>
					</tr>
					<tr><td class="enrollDate">
						<fmt:formatDate value="${i.JOINGROUP_ENROLLDATE}" pattern="yyyy. MM. dd."/>
					</td></tr>
				</table>
			  </c:forEach>
			</div>
			
		</div>
	</div>
</body>

<script>	
	function hideChangeLeader(){
		$('.hideChangeLeader').css({"display":"none"});
		$('.showChangeLeader').css({"display":"table-cell"});		
	}
	function cancelChangeLeader(){
		$('.hideChangeLeader').css({"display":""});
		$('.showChangeLeader').css({"display":"none"});
	}
	
	function changeGrLeader(afterLeaderCode, loginUserCode){
		var grCode= $('#grCode').val();
		console.log(afterLeaderCode + " / " + grCode);
		
		var changeLeaderChk = confirm("그룹장을 변경 하시겠습니까?");

		if(changeLeaderChk){
			$.ajax({
				url:"updateChangeGroupLeader.sgd",
				data : { grCode : grCode, afterLeaderCode : afterLeaderCode, nowLeaderCode : loginUserCode },
				type : "POST",
				success:function(data) {
					console.log(data);
					
					$('#leftIncludeArea').empty();
					$('#leftIncludeArea').append(data);
				},
				error : function(){
					alert("그룹장 변경에 실패하였습니다.");
				}
			});
		}
	}

	function kickOutGrMember(delMemCode, delMemNick, loginUserCode, grLeaderCode){
		var grCode= $('#grCode').val();
		console.log(loginUserCode + " / " + grLeaderCode);
		
		if(loginUserCode == grLeaderCode){
			var kickOutChk = confirm(delMemNick + "님을 강퇴 하시겠습니까?");
 			
			if(kickOutChk){
				$.ajax({
					url:"updateDeleteGroupMember.sgd",
					data : { grCode : grCode, delMemCode : delMemCode, loginUserCode : loginUserCode },
					type : "POST",
					success:function(data) {
						console.log(data);
						
						$('#leftIncludeArea').empty();
						$('#leftIncludeArea').append(data);
					}
				});
			}
		}else{
			alert("강퇴 권한이 없습니다.");
		}
	}
</script>
</html>