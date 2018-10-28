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
			.listBtn { cursor:pointer; border-radius:15px; padding:3px 10px; display:inline-table; font-size:12px; font-weight:bold; }
			.addFriendBtn{ background:lightgray; text-align:center; }
			.addFriendBtn{ background:lightgray; text-align:center; }
			/* 그룹장 속성 */			
			.changeLeaderBtn { width:100%; background:skyblue; text-align:center; }
			.cancelChangeBtn { width:100%; background:gray; text-align:center; color:white; }
			.deleteGroupMemberBtn { cursor:pointer; color:gray; }
			.deleteGroupMemberBtn:hover { color:black; font-weight:bold; }
					
					
	
</style>


</head>
<body>
	<div class="listPageWrap">
		<div class="memberAllArea">
			<div class="memberListArea">		

				<!-- 로그인 유저가 그룹장 일 때 기본 뷰 -->     <!-- 그룹장 바꾸기 버튼 누르면 hideChangeLeaderBtn 가진 요소 숨김 toggleChangeLeaderBtn보이게 -->
				<div class="leaderMember memberOneWrapArea hideChangeLeaderBtn">
					<table class="memberInfo">
						<tr>
							<td rowspan="2"><img src="${ contextPath }/resources/images/studyGroupDetail/spring.png" width="50px" /></td>
							<td><strong>닉네임자리</strong></td>
						  <!-- 로그인유저가 그룹장 일 때 해당 버튼 보이기 -->
							<td rowspan="2">
								<div class="listBtn changeLeaderBtn">그룹장 변경</div>
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
				
				<!-- 로그인 유저가 그룹장이면서 그룹장 변경 버튼 클릭했을 때 -->
				<div class="leaderMember memberOneWrapArea toggleChangeLeaderBtn">
					<table class="memberInfo">
						<tr>
							<td rowspan="2"><img src="${ contextPath }/resources/images/studyGroupDetail/spring.png" width="50px" /></td>
							<td><strong>닉네임자리</strong></td>
						  <!-- 로그인유저가 그룹장 변경 버튼 누르면 버튼 바뀌는 부분 -->
							<td rowspan="2">
								<div class="listBtn cancelChangeBtn">변경 취소</div>
							</td>		
						</tr>
						<tr><td>2018.10.16.</td></tr>
					</table>
				</div>
				
				
				그룹장이 그룹장 변경 누르면 일반회원들 친구신청 버튼이 그룹장 위임하기로 변경되고 x안보이도록 처리하기
				
				
				
				<!-- 반복문(그룹장 제외) -->
				<div class="commonMember memberOneWrapArea">
					<!--  -->
					<table class="memberInfo">
						<tr>
							<td rowspan="2"><img src="${ contextPath }/resources/images/studyGroupDetail/spring.png" width="50px" /></td>
							<td><strong>닉네임자리</strong></td>
						  <!-- 로그인 유저가 아니라면 보이기 -->
							<td rowspan="2">
								<div class="listBtn addFriendBtn hideChangeLeaderBtn">친구신청</div>
							</td>
							<td rowspan="2" class="toggleChangeLeaderBtn">	첨엔 display:none;으로
								<div class="listBtn toggleChangeLeaderBtn">그룹장 위임</div>
							</td>	
						  <!-- 로그인 유저가 아니라면 보이기 여기까지 -->
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 -->
							<td rowspan="2">
								<div class="deleteGroupMemberBtn hideChangeLeaderBtn" title="강퇴하기" style="font-size:15px;">×</div>
							</td>
							<td rowspan="2">
								<div class="listBtn changeLeaderBtn">그룹장 위임</div>
							</td>
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 여기까지 -->
						  
						  
						</tr>
						<tr><td>2018.10.16.</td></tr>
					</table>
				</div>
				
				<!-- 반복문(그룹장 제외) -->
				<div class="commonMember memberOneWrapArea">
					<!--  -->
					<table class="memberInfo">
						<tr>
							<td rowspan="2"><img src="${ contextPath }/resources/images/studyGroupDetail/spring.png" width="50px" /></td>
							<td><strong>닉네임자리</strong></td>
						  <!-- 로그인 유저가 아니라면 보이기 -->
							<td rowspan="2">
								<div class="listBtn addFriendBtn">친구신청</div>
							</td>
						  <!-- 로그인 유저가 아니라면 보이기 여기까지 -->
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 -->
							<td rowspan="2">
								<div class="deleteGroupMemberBtn" title="강퇴하기" style="font-size:15px;">×</div>
							</td>
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 여기까지 -->
						</tr>
						<tr><td>2018.10.16.</td></tr>
					</table>
				</div>
				
				
				<!-- 반복 수정 안되어있음-->
				<div class="commonMember memberOneWrapArea">
					<table class="memberInfo">
						<tr>
							<td rowspan="2"><img src="${ contextPath }/resources/images/studyGroupDetail/spring.png" width="50px" /></td>
							<td><strong>닉네임자리</strong></td>
						  <!-- 로그인유저(본인)는 해당 버튼 숨기기(로그인 유저가 아니라면 보이기) -->
							<td rowspan="2">
								<div class="listBtn addFriendBtn">친구신청</div>
							</td>
						  <!-- 로그인유저(본인)는 해당 버튼 숨기기 여기까지 -->
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 -->
<!-- 							<td rowspan="2"> -->
<!-- 								<div class="deleteGroupMemberBtn" style="font-size:15px;">×</div> -->
<!-- 							</td> -->
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 여기까지 -->
						</tr>
						<tr><td>2018.10.16.</td></tr>
					</table>
				</div>
				<div class="commonMember memberOneWrapArea">
					<table class="memberInfo">
						<tr>
							<td rowspan="2"><img src="${ contextPath }/resources/images/studyGroupDetail/spring.png" width="50px" /></td>
							<td><strong>닉네임자리</strong></td>
						  <!-- 로그인유저(본인)는 해당 버튼 숨기기(로그인 유저가 아니라면 보이기) -->
							<td rowspan="2">
								<div class="listBtn addFriendBtn">친구신청</div>
							</td>
						  <!-- 로그인유저(본인)는 해당 버튼 숨기기 여기까지 -->
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 -->
<!-- 							<td rowspan="2"> -->
<!-- 								<div class="deleteGroupMemberBtn" style="font-size:15px;">×</div> -->
<!-- 							</td> -->
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 여기까지 -->
						</tr>
						<tr><td>2018.10.16.</td></tr>
					</table>
				</div>
				<div class="commonMember memberOneWrapArea">
					<table class="memberInfo">
						<tr>
							<td rowspan="2"><img src="${ contextPath }/resources/images/studyGroupDetail/spring.png" width="50px" /></td>
							<td><strong>닉네임자리</strong></td>
						  <!-- 로그인유저(본인)는 해당 버튼 숨기기(로그인 유저가 아니라면 보이기) -->
							<td rowspan="2">
								<div class="listBtn addFriendBtn">친구신청</div>
							</td>
						  <!-- 로그인유저(본인)는 해당 버튼 숨기기 여기까지 -->
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 -->
<!-- 							<td rowspan="2"> -->
<!-- 								<div class="deleteGroupMemberBtn" style="font-size:15px;">×</div> -->
<!-- 							</td> -->
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 여기까지 -->
						</tr>
						<tr><td>2018.10.16.</td></tr>
					</table>
				</div>
				<div class="commonMember memberOneWrapArea">
					<table class="memberInfo">
						<tr>
							<td rowspan="2"><img src="${ contextPath }/resources/images/studyGroupDetail/spring.png" width="50px" /></td>
							<td><strong>닉네임자리</strong></td>
						  <!-- 로그인유저(본인)는 해당 버튼 숨기기(로그인 유저가 아니라면 보이기) -->
							<td rowspan="2">
								<div class="listBtn addFriendBtn">친구신청</div>
							</td>
						  <!-- 로그인유저(본인)는 해당 버튼 숨기기 여기까지 -->
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 -->
<!-- 							<td rowspan="2"> -->
<!-- 								<div class="deleteGroupMemberBtn" style="font-size:15px;">×</div> -->
<!-- 							</td> -->
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 여기까지 -->
						</tr>
						<tr><td>2018.10.16.</td></tr>
					</table>
				</div>
				<div class="commonMember memberOneWrapArea">
					<table class="memberInfo">
						<tr>
							<td rowspan="2"><img src="${ contextPath }/resources/images/studyGroupDetail/spring.png" width="50px" /></td>
							<td><strong>닉네임자리</strong></td>
						  <!-- 로그인유저(본인)는 해당 버튼 숨기기(로그인 유저가 아니라면 보이기) -->
							<td rowspan="2">
								<div class="listBtn addFriendBtn">친구신청</div>
							</td>
						  <!-- 로그인유저(본인)는 해당 버튼 숨기기 여기까지 -->
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 -->
<!-- 							<td rowspan="2"> -->
<!-- 								<div class="deleteGroupMemberBtn" style="font-size:15px;">×</div> -->
<!-- 							</td> -->
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 여기까지 -->
						</tr>
						<tr><td>2018.10.16.</td></tr>
					</table>
				</div>
				<div class="commonMember memberOneWrapArea">
					<table class="memberInfo">
						<tr>
							<td rowspan="2"><img src="${ contextPath }/resources/images/studyGroupDetail/spring.png" width="50px" /></td>
							<td><strong>닉네임자리</strong></td>
						  <!-- 로그인유저(본인)는 해당 버튼 숨기기(로그인 유저가 아니라면 보이기) -->
							<td rowspan="2">
								<div class="listBtn addFriendBtn">친구신청</div>
							</td>
						  <!-- 로그인유저(본인)는 해당 버튼 숨기기 여기까지 -->
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 -->
<!-- 							<td rowspan="2"> -->
<!-- 								<div class="deleteGroupMemberBtn" style="font-size:15px;">×</div> -->
<!-- 							</td> -->
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 여기까지 -->
						</tr>
						<tr><td>2018.10.16.</td></tr>
					</table>
				</div>
				<div class="commonMember memberOneWrapArea">
					<table class="memberInfo">
						<tr>
							<td rowspan="2"><img src="${ contextPath }/resources/images/studyGroupDetail/spring.png" width="50px" /></td>
							<td><strong>닉네임자리</strong></td>
						  <!-- 로그인유저(본인)는 해당 버튼 숨기기(로그인 유저가 아니라면 보이기) -->
							<td rowspan="2">
								<div class="listBtn addFriendBtn">친구신청</div>
							</td>
						  <!-- 로그인유저(본인)는 해당 버튼 숨기기 여기까지 -->
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 -->
<!-- 							<td rowspan="2"> -->
<!-- 								<div class="deleteGroupMemberBtn" style="font-size:15px;">×</div> -->
<!-- 							</td> -->
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 여기까지 -->
						</tr>
						<tr><td>2018.10.16.</td></tr>
					</table>
				</div>
				<div class="commonMember memberOneWrapArea">
					<table class="memberInfo">
						<tr>
							<td rowspan="2"><img src="${ contextPath }/resources/images/studyGroupDetail/spring.png" width="50px" /></td>
							<td><strong>닉네임자리</strong></td>
						  <!-- 로그인유저(본인)는 해당 버튼 숨기기(로그인 유저가 아니라면 보이기) -->
							<td rowspan="2">
								<div class="listBtn addFriendBtn">친구신청</div>
							</td>
						  <!-- 로그인유저(본인)는 해당 버튼 숨기기 여기까지 -->
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 -->
<!-- 							<td rowspan="2"> -->
<!-- 								<div class="deleteGroupMemberBtn" style="font-size:15px;">×</div> -->
<!-- 							</td> -->
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 여기까지 -->
						</tr>
						<tr><td>2018.10.16.</td></tr>
					</table>
				</div>
				<div class="commonMember memberOneWrapArea">
					<table class="memberInfo">
						<tr>
							<td rowspan="2"><img src="${ contextPath }/resources/images/studyGroupDetail/spring.png" width="50px" /></td>
							<td><strong>닉네임자리</strong></td>
						  <!-- 로그인유저(본인)는 해당 버튼 숨기기(로그인 유저가 아니라면 보이기) -->
							<td rowspan="2">
								<div class="listBtn addFriendBtn">친구신청</div>
							</td>
						  <!-- 로그인유저(본인)는 해당 버튼 숨기기 여기까지 -->
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 -->
<!-- 							<td rowspan="2"> -->
<!-- 								<div class="deleteGroupMemberBtn" style="font-size:15px;">×</div> -->
<!-- 							</td> -->
						  <!-- 로그인유저(본인)가 그룹장일 때 보여지는 버튼 여기까지 -->
						</tr>
						<tr><td>2018.10.16.</td></tr>
					</table>
				</div>

				
				
			</div>
			
		</div>
			
		
	</div>
</body>
</html>