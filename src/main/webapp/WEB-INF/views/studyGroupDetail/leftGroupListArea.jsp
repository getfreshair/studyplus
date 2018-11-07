<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	  .memberOneWrapArea { width:263px; /* border:1px dashed red; display:inline-block; */ }
		.memberInfo { margin:10px 0px; }
		  .memberInfo td { padding-left:12px; text-align:left; display:table-cell; vertical-align:middle; font-size:13px; }
			.listBtn { cursor:pointer; border-radius:15px; padding:3px 10px; display:inline-block; font-size:12px; font-weight:bold; }
			.addFriendBtn{ background:lightgray; text-align:center; }
			.addFriendBtn{ background:lightgray; text-align:center; }
			/* 그룹장 속성 */			
			.changeLeaderBtn { width:86px; background:skyblue; text-align:center; }
			.cancelChangeBtn { width:100%; background:gray; text-align:center; color:white; }
			.showChangeLeader { display:none; }
			.deleteGroupMemberBtn { cursor:pointer; color:gray; }
			.deleteGroupMemberBtn:hover { color:black; font-weight:bold; }
					
					
	
</style>


</head>
<body>
	<div class="listPageWrap">
		<div class="memberAllArea">
			<div class="memberListArea">		

				<!-- 로그인 유저가 그룹장 일 때 기본 뷰 -->     <!-- 그룹장 바꾸기 버튼 누르면 hideChangeLeader 가진 요소 숨김 toggleChangeLeaderBtn보이게 -->
				<div class="leaderMember memberOneWrapArea">
					<table class="memberInfo">
						<tr>							
							<td rowspan="2"><img src="${ contextPath }/resources/images/studyGroupDetail/study.jpg" width="50px" /></td>
							<td><strong>닉네임자리</strong></td>
						  <!-- 로그인유저가 그룹장 일 때 해당 버튼 보이기 -->
							<td rowspan="2" colspan="2">
								<!-- 요소 클릭시 hideCh~속성 디스플레이 논, 캔슬버튼 쇼 , 취소 클릭시 디스플레이 논 반대 풀기 -->
								<div onclick="hideChangeLeader();" class="listBtn changeLeaderBtn hideChangeLeader">그룹장 변경</div>
								<div onclick="cancelChangeLeader();" class="listBtn cancelChangeBtn showChangeLeader">변경 취소</div>
							</td>
						  <!-- 로그인유저가 그룹장 일 때 해당 버튼 보이기 끝 -->
						  <!-- 로그인유저가 그룹장이 아닐 때 해당 버튼  보이기 -->
<!-- 							<td rowspan="2"> -->
<!-- 								<div class="listBtn addFriendBtn">친구신청</div> -->
<!-- 							</td> -->
						  <!-- 로그인유저가 그룹장이 아닐 때 해당 버튼  보이기 여기까지 -->
						</tr>
						<tr><td>2018.10.16.</td></tr>
					</table>
				</div>

				<!-- 반복문(그룹장 제외) -->
				<div class="commonMember memberOneWrapArea">
					<!--  -->
					<table class="memberInfo">
						<tr>
							<td rowspan="2"><img src="${ contextPath }/resources/images/studyGroupDetail/study.jpg" width="50px" /></td>
							<td><strong>닉네임자리</strong></td>
						  <!-- 로그인 유저가 아니라면 보이기 -->
							<td rowspan="2">
								<div class="listBtn addFriendBtn hideChangeLeader">친구신청</div>
								<div class="listBtn changeLeaderBtn showChangeLeader">그룹장 위임</div>
							</td>
						  <!-- 로그인 유저가 아니라면 보이기 여기까지 -->
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 -->
							<td rowspan="2" class="hideChangeLeader">
								<div class="deleteGroupMemberBtn" title="강퇴하기" style="font-size:15px;">×</div>
							</td>
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 여기까지 -->
						</tr>
						<tr><td>2018.10.16.</td></tr>
					</table>
				</div>
				<div class="commonMember memberOneWrapArea">
					<!--  -->
					<table class="memberInfo">
						<tr>
							<td rowspan="2"><img src="${ contextPath }/resources/images/studyGroupDetail/study.jpg" width="50px" /></td>
							<td><strong>닉네임자리</strong></td>
						  <!-- 로그인 유저가 아니라면 보이기 -->
							<td rowspan="2">
								<div class="listBtn addFriendBtn hideChangeLeader">친구신청</div>
								<div class="listBtn changeLeaderBtn showChangeLeader">그룹장 위임</div>
							</td>
						  <!-- 로그인 유저가 아니라면 보이기 여기까지 -->
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 -->
							<td rowspan="2" class="hideChangeLeader">
								<div class="deleteGroupMemberBtn" title="강퇴하기" style="font-size:15px;">×</div>
							</td>
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 여기까지 -->
						</tr>
						<tr><td>2018.10.16.</td></tr>
					</table>
				</div>
				<div class="commonMember memberOneWrapArea">
					<!--  -->
					<table class="memberInfo">
						<tr>
							<td rowspan="2"><img src="${ contextPath }/resources/images/studyGroupDetail/study.jpg" width="50px" /></td>
							<td><strong>닉네임자리</strong></td>
						  <!-- 로그인 유저가 아니라면 보이기 -->
							<td rowspan="2">
								<div class="listBtn addFriendBtn hideChangeLeader">친구신청</div>
								<div class="listBtn changeLeaderBtn showChangeLeader">그룹장 위임</div>
							</td>
						  <!-- 로그인 유저가 아니라면 보이기 여기까지 -->
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 -->
							<td rowspan="2" class="hideChangeLeader">
								<div class="deleteGroupMemberBtn" title="강퇴하기" style="font-size:15px;">×</div>
							</td>
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 여기까지 -->
						</tr>
						<tr><td>2018.10.16.</td></tr>
					</table>
				</div>
				<div class="commonMember memberOneWrapArea">
					<!--  -->
					<table class="memberInfo">
						<tr>
							<td rowspan="2"><img src="${ contextPath }/resources/images/studyGroupDetail/study.jpg" width="50px" /></td>
							<td><strong>닉네임자리</strong></td>
						  <!-- 로그인 유저가 아니라면 보이기 -->
							<td rowspan="2">
								<div class="listBtn addFriendBtn hideChangeLeader">친구신청</div>
								<div class="listBtn changeLeaderBtn showChangeLeader">그룹장 위임</div>
							</td>
						  <!-- 로그인 유저가 아니라면 보이기 여기까지 -->
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 -->
							<td rowspan="2" class="hideChangeLeader">
								<div class="deleteGroupMemberBtn" title="강퇴하기" style="font-size:15px;">×</div>
							</td>
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 여기까지 -->
						</tr>
						<tr><td>2018.10.16.</td></tr>
					</table>
				</div>
				
				<script>
					function hideChangeLeader(){
						$('.hideChangeLeader').css({"display":"none"});
						$('.showChangeLeader').css({"display":"inline-block"});
					}
					function cancelChangeLeader(){
						$('.hideChangeLeader').css({"display":""});
						$('.showChangeLeader').css({"display":"none"});
					}
				</script>
				
								
			</div>
		</div>
	</div>
</body>

<script>
	$(function(){
		
		
	});


</script>
</html>