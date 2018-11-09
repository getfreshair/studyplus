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
	  .memberOneWrapArea { width:263px; /* border:1px dashed red; display:inline-block; */ }
		.memberInfo { margin:10px 0px; }
		  .memberInfo td { padding-left:12px; text-align:left; display:table-cell; vertical-align:middle; }
		  .profImg { width:50px; height:50px; overflow-y:hidden; border-radius:20%; }
		  	.profImg img { width:100%; }
		  .nickName	{ width:105px; height:20%; font-size:12.5px; font-weight:bold; line-height:1.2; word-break:break-all; }
		    .nickName strong { vertical-align:super; }
		  .enrollDate { font-weight:normal; font-size:11px; }	
		  .listBtn { cursor:pointer; border-radius:15px;  display:table-cell; vertical-align:middle;
		  			 font-size:11px; font-weight:bold; height:25px; padding: 5px 3px; }
			.addFriendBtn{ background:lightgray; text-align:center; width:57px; }
 			/* 그룹장 속성 */			
/*			.changeLeaderBtn { width:80px;  padding:0px 8px; background:skyblue; text-align:center; }
			.cancelChangeBtn {  width:80px; background:#f74545; text-align:center; color:white; }
			.showChangeLeader { display:none; }
			.deleteGroupMemberBtn { cursor:pointer; color:gray; font-weight:normal; }
			.deleteGroupMemberBtn:hover { color:black; font-weight:bold; } */
					
</style>

</head>
<body>
	<div class="rankPageWrap">
		<div class="memberListArea">		

		<!-- 그룹장 바꾸기 버튼 누르면 hideChangeLeader 가진 요소 숨김 toggleChangeLeaderBtn보이게 -->
		  <c:forEach var="i" begin="0" end="${fn:length(grMemList) - 1}" step="1" >
			<div class="leaderMember memberOneWrapArea">
				<table class="memberInfo" border="1">
					<tr>							
						<td rowspan="2"><div class="profImg">
							<input type="hidden" id="memCode" value="${grMemList[i].MEMBER_CODE}"/>
							<img src="${ contextPath }/resources/upload/member/thumbnail/${grMemList[i].FILES_NAME}" />
						</div></td>
						<td class="nickName"><strong>${grMemList[i].MEMBER_NICKNAME}</strong></td>
					</tr>
					<tr><td class="timeStickAera">
						<div class="timeStickWrap">
							<div class="timeStickBack">
							//1등 시간 - > 영역 100%		
							</div>
							<div class="timeStick">
							//그 외 등수	
							</div>
						</div>
					</td></tr>
				</table>
			</div>
		  </c:forEach>
			
		</div>
	</div>
</body>

<script>
	$(function(){
		
		
	});
	
</script>
</html>