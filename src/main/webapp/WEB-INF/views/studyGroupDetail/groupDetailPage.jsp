<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- #### CSS FILES ### -->
	<link rel="stylesheet" href="/studyplus/resources/css/bootstrap.css">
	<link rel="stylesheet" href="/studyplus/resources/css/custom.css">
	
	<!-- #### JAVASCRIPT FILES ### -->
	<script src="/studyplus/resources/js/jquery-1.11.1.min.js"></script>
	<script src="/studyplus/resources/js/bootstrap.min.js"></script>
	
	
<!-- /* 전체영역 */ -->
	<style>
		.pageAll * { font-family:맑은고딕 !important;}
		.pageWrap { width:1200px; margin:0px auto; }
		.pageContentArea { width:98%; margin:0px auto; }
	</style>
	
<!-- /* 상단부 */ -->
	<style>
		.titleArea { width:100%; margin-bottom:20px; display:flex; }
		.topInfoArea { border-radius:15px; background:rgb(255, 225, 177); padding:25px 0px; text-align:center; 
						border-style:hidden; box-shadow:4px 5px 5px 1px lightgray; }
		
		    .topInfoAllWrapTbl { width:100%; height:100%; margin:0px auto; /* vertical-align:middle; */ }
	        .topInfoContWrapTbl { width:100%; height:100%; margin:0px auto; vertical-align:middle; }
		
		.groupInfoArea { width:61%; margin-right:0.8%; display:flex; }
		  .groupInfoLeft { width:45%; padding:0px 20px; border-right:1px solid gray; }
			.category { background:lightgray; float:left; }
			.groupTitleTblWrap { margin-left:5px; }
			  .groupTitleTbl { width:100%; margin-bottom:0px;/* margin: 0px 0px 5px; */ }
			  .groupTitleTbl h2 { font-weight:bold; line-height:1.7; font-size:27px; margin:0px; }
	 		  .groupTitleTbl .groupIntro { height:55px; padding:15px 15px 15px 5px; font-size:15px; table-layout:fixed; word-break:keep-all; }
			  .groupOptDetailTbl { width:225px; display:inline-table; font-size:14px; }
	 		  .groupOptDetailTbl td { padding:7px 5px 1px 5px; border-bottom:1px solid gray; }
			  .groupOptDetailTbl strong { float:left; }
			  .groupOptDetailTbl span { float:right; }
		  .groupInfoRight { width:55%; padding:0px 20px; }
		    .radiBtn { background:gray; float:right; cursor:pointer; color:white; border-radius:10px; }
	 	      .groupStatBoxLeft { float:left; background:rgb(211, 0, 0, 0.4); }
	 		  .groupStatBoxRight { float:right; background:rgb(52, 152, 219, 0.4); }
		 	  .statBox { width:171px; height:220px; border-radius:15px; padding:3px 7px; display:table; }
	  		    .statBoxContTbl { display:table-cell; vertical-align:middle; margin:0px; }
	  		    .statBoxContTbl tbody { width:130px; height:170px; display: inline-block; }
			    .statBoxContTbl h3 { font-weight:bold; line-height:1.3; margin:0px 0px 5px; }
	  		    .statBoxContTbl tr:first-child td { /* width:140px; */ padding-bottom:12px; font-size:1.5em; border-bottom:1px dashed; }
	   		    .statBoxContTbl tr:nth-child(2n) td > div { width:100%; height:91px; margin:0px auto; display:inline-table; text-align:center; }
	   		    .statBoxContTbl tr:nth-child(2n) td div div { padding-top:8px; /* font-size:13px; */ display:inline-block; text-align:right;  }
	   		    .statBoxContTbl tr:nth-child(2n) td div div strong { float:right;  }
				.goalRatio { font-weight:bold; font-size:18px; padding-top:0px !important; display:table-cell !important; vertical-align:middle; text-align:center !important; }
	
		.myInfoArea { width:38.2%; padding:25px 20px; }
		  .joinGroupBtn { font-weight:bold; font-size:25px; }
	 	  .myStatBox { float:left; background:rgb(211, 0, 0, 0.4); }
		  .lineGraph { background:white; opacity:0.8; width:100%; height:220px; float:right; padding:3px 7px; display:inline-block; }
	</style>	
	
<!-- /*	하단 컨텐츠 작성 */ -->
	<style>
		.contentArea { width:100%; /* height:600px; */ margin-bottom:10px; display:flex; }
		.bottomContentArea { background:rgb(235, 235, 235, 0.4); /* height:100%; */ padding:20px 15px; display:inline-block; text-align:center; }
		
		
	/*	그룹원 리스트 영역 */
		.leftContent { width:26.7%; padding-right:0px; margin-right:0.3%; border-right:1px solid gray; }
		  .leftContentWrap { width:100%; /* height:100%; */ display:inline-block; }
			.leftContentTabMenu {/*  width:100%; */ margin-right:15px; padding-bottom:10px; border-bottom:1px solid gray; margin-bottom:10px; text-align:right; }
			.leftContentTabMenu div { display:inline-table; }
			.leftContentTabMenu div:first-child { float:left; }
			.leftContentTabMenu span { cursor:pointer; padding:0px 5px; font-size:15px; /* font-weight:bold; */ }
			
			.leftIncludeArea { width:100%; overflow:auto; /* background:yellow; */ }
			
	/* 게시물 영역 */		
		.centerContent { width:48.7%; margin-right:0.3%; border-right:1px solid gray; }
		
	/* 실시간 채팅 영역 */	
		.rightContent { width:24%; }
	</style>
	
<!-- /*	공통 요소 속성 */ -->
	<style>
		.radiusSmallWrapTd { height:10px; vertical-align:top; max-height:10px;}
		.radiusBoxSmall { border-radius:15px; margin-bottom:13px; padding:3px 12px; font-size:12px; font-weight:bold; display:inline; }
	</style>
</head>

<body>

	<jsp:include page="../common/header.jsp"/>
	<div class="pageAll"><br>
	<div class="pageWrap">
		<div class="pageContentArea">
		
			<div class="titleArea">
			<!-- *가입여부 체크 (가입-1 / 미가입-0 ,(**DB상으로는 가입-0, 미가입-1)) -->
<%-- 				<input type="hidden" id="joinStatus" value="${joinStatus}"/> --%>
				<input type="hidden" id="grCode" value="${gr.studyGroup_Code}"/>
				<div class="groupInfoArea topInfoArea">
					<div class="groupInfoLeft">
						<table class="topInfoAllWrapTbl">
							<tr><td class="radiusSmallWrapTd">
								<div class="category radiusBoxSmall">${gr.location_Name} / ${gr.category_Name}</div>
							</td></tr>
							<tr><td>
								<table class="topInfoContWrapTbl groupTitleTblWrap">
									<tr><td>
										<table class="groupTitleTbl">
											<tr><td><h2>${gr.studyGroup_Name}</h2></td></tr>
											<tr><td class="groupIntro">
												${gr.studyGroup_Intro}
											</td></tr>
										</table>
									</td></tr>
									<tr><td>
										<table class="groupOptDetailTbl">
											<tr><td>
												<strong>목표시간</strong>
<%-- 												<span><fmt:formatNumber value="${gr.studyGroup_GoalTime}" pattern="0"/> 시간</span> --%>
												<span>${gr.studyGroup_GoalTime} 시간</span>
											</td></tr>
											<tr><td>
												<strong>참여인원</strong>
												<span>${gr.gr_Mem_Count} / ${gr.studyGroup_MaxNum} 명</span>
											</td></tr>
											<tr><td>
												<strong>시 작 일</strong>	
												<span>
													<fmt:formatDate value="${gr.studyGroup_StDate}" pattern="yy. MM. dd."/>
													(${gr.gr_Dates} 일 째)
<%-- 												<span style="font-size:12px; line-height:1.9; font-weight:bold;">&nbsp;(${gr.gr_Dates} 일 째)</span> --%>
												</span>
											</td></tr>
										</table>
									</td></tr>
								</table>
							</td></tr>									
						</table>
					</div>
					
					<div class="groupInfoRight">
						<table class="topInfoAllWrapTbl">
						  <c:if test="${joinStatus >= 1}">
							<tr><td colspan="2" class="radiusSmallWrapTd">
								<div onclick="" class="radiBtn radiusBoxSmall">통계보기</div>
							</td></tr>
						  </c:if>
							<tr><td>
								<table class="topInfoContWrapTbl"><tr>
									<td width="50%"><div class="statBox groupStatBoxLeft">
										<table class="statBoxContTbl">
											<tr><td><h3>그룹 순위</h3> <strong>${gr.gr_Rank} 위</strong></td></tr>
											<tr><td><div>
												<div>
													<strong>이 주의 공부시간</strong> <br>
													<span>
														<c:set var="gr_Week_Hour" value="${(gr.gr_Week_Total / 3600)}"/>
														<c:set var="gr_Week_Min" value="${(gr.gr_Week_Total % 3600) / 60}"/>
														<fmt:formatNumber var="gr_Week_H" value="${gr_Week_Hour - (gr_Week_Hour % 1)}" pattern="#00"/>
														<fmt:formatNumber var="gr_Week_M" value="${gr_Week_Min - (gr_Week_Min % 1)}" pattern="00"/>
														<fmt:formatNumber var="gr_Week_Sec" value="${(gr.gr_Week_Total % 3600) % 60}" pattern="00"/>
														${gr_Week_H}:${gr_Week_M}:${gr_Week_Sec}
													</span>
												</div>
												<div>
													<strong>오늘의 공부시간</strong> <br> 
													<span><!-- 6:57:37 --><!-- pages-(pages%1) -> 내림처리 -->
														<c:set var="gr_Day_Hour" value="${(gr.gr_Day_Total / 3600)}"/>
														<c:set var="gr_Day_Min" value="${(gr.gr_Day_Total % 3600) / 60}"/>
														<fmt:formatNumber var="gr_Day_H" value="${gr_Day_Hour - (gr_Day_Hour % 1)}" pattern="#00"/>
														<fmt:formatNumber var="gr_Day_M" value="${gr_Day_Min - (gr_Day_Min % 1)}" pattern="00"/>
														<fmt:formatNumber var="gr_Day_Sec" value="${(gr.gr_Day_Total % 3600) % 60}" pattern="00"/>
														${gr_Day_H}:${gr_Day_M}:${gr_Day_Sec}
													</span>
												</div>
											</div></td></tr>
										</table>
									</div></td>
									<td><div class="statBox groupStatBoxRight">
										<table class="statBoxContTbl">
											<tr><td><h3>목표 완수율</h3> <strong>${gr.gr_Week_Fulfill_Ratio} %</strong></td></tr>
											<tr><td>
												<div><div class="goalRatio">${gr.gr_Fulfill_Mem_Cnt} / ${gr.gr_Mem_Count} 명 완수</div></div>
											</td></tr>
										</table>
									</div></td>
								</tr></table>
							</td></tr>
						</table>			
					</div>
				</div>
				
				<div class="myInfoArea topInfoArea">
					<table class="topInfoAllWrapTbl">
					<!-- 그룹 미가입시 -->
					  <c:if test="${joinStatus < 1}">
						<tr><td>
							<div><a onclick="joinGroup();"href="" class="joinGroupBtn">그룹 가입하기</a></div>
						</td></tr>
					  </c:if>
					  
					<!-- 그룹 가입시 -->
					  <c:if test="${joinStatus >= 1}">
						<tr><td class="radiusSmallWrapTd">
							<div onclick="" class="radiBtn radiusBoxSmall">설 정</div>
						</td></tr>
						<tr><td>
							<table class="topInfoContWrapTbl" style="display:table;"><tr>
								<td><div class="statBox groupStatBoxLeft">
									<table class="statBoxContTbl">
										<tr><td>
											<h3>나의 순위</h3>
											<strong>
<%-- 											  <c:if test="${join.my_Rank empty}"> --%>
<%-- 											  	${gr.gr_Mem_Count} --%>
<%-- 											  </c:if> --%>
												<fmt:formatNumber value="${join.my_Rank}" pattern="0" /> 위
											</strong>
										</td></tr>
										<tr><td><div>
											<div>
												<strong>이 주의 공부시간</strong> <br>
												<span>
													<c:set var="my_Week_Hour" value="${(join.my_Week_Total / 3600)}"/>
													<c:set var="my_Week_Min" value="${(join.my_Week_Total % 3600) / 60}"/>
													<fmt:formatNumber var="my_Week_H" value="${my_Week_Hour - (my_Week_Hour % 1)}" pattern="#00"/>
													<fmt:formatNumber var="my_Week_M" value="${my_Week_Min - (my_Week_Min % 1)}" pattern="00"/>
													<fmt:formatNumber var="my_Week_Sec" value="${(join.my_Week_Total % 3600) % 60}" pattern="00"/>
													${my_Week_H}:${my_Week_M}:${my_Week_Sec}
												</span>
											</div>
											<div>
												<strong>오늘의 공부시간</strong> <br>
												<span>
													<c:set var="my_Day_Hour" value="${(join.my_Day_Total / 3600)}"/>
													<c:set var="my_Day_Min" value="${(join.my_Day_Total % 3600) / 60}"/>
													<fmt:formatNumber var="my_Day_H" value="${my_Day_Hour - (my_Day_Hour % 1)}" pattern="#00"/>
													<fmt:formatNumber var="my_Day_M" value="${my_Day_Min - (my_Day_Min % 1)}" pattern="00"/>
													<fmt:formatNumber var="my_Day_Sec" value="${(join.my_Day_Total % 3600) % 60}" pattern="00"/>
													${my_Day_H}:${my_Day_M}:${my_Day_Sec}
												</span>
											</div>
										</div></td></tr>
									</table>
								</div></td>
								<td><div class="statBox lineGraph" style="float:right;">
									<table class="statBoxContTbl">
										<tr><td width="56%">
											<div>dfsf</div>
										</td></tr>
									</table>
								</div></td>
							</tr></table>
						</td></tr>
					  </c:if>
<!-- 만약 로그인유저가 그룹 멤버라면 보이도록 끝 -->
					</table>			
				</div>
			</div>
			
<script>	
	function joinGroup(){
		var grCode = $('#grCode').val();
		var memCode = '${loginUser}';
// 		var memCode = '${ sessionScope.loginUser.member_Code }';
		
		$.ajax({
			url : "insertGroupJoin.sgd",
			data : { grCode : grCode, memCode : memCode },
			type : "POST",
			success : function(data){
					if(data >= 1){
						location.href="selectOneGroup.sgd?group_No=" + grCode;
					}else{
						alert("그룹 가능 최대 인원을 초과하여 가입 할 수 없습니다.");
					}
			},
			
			error : function(){
				alert("에러냐?");
			}
		});
	};
</script>			
						
<!-- 만약 로그인유저가 그룹 멤버라면 보이도록 -->
			<div class="contentArea includeArea">
				<div class="leftContent bottomContentArea">
					<div class="leftContentWrap">
						<div class="leftContentTabMenu">
							<div>
								<span id="showMemList" onclick="selectGrMemList('${gr.studyGroup_Code}', '${loginUser}');">그룹원 보기</span>
							</div>
							<div>
								<span id="showMemRank" onclick="selectGrMemRank('${gr.studyGroup_Code}');">그룹원 순위</span>
								<span style="cursor:auto;">|</span>
								<span id="showMemStudyStatus" onclick="showMemStudyStatus();">수행 현황</span>
							</div>
						</div>
						<div id="leftIncludeArea" class="leftIncludeArea">
<%-- 							<jsp:include page="leftGroupListArea.jsp"/> --%>
						</div>
					</div>
				</div>
				<div class="centerContent bottomContentArea">
					
				</div>
				<div class="rightContent bottomContentArea">
					
				</div>
			</div>

<!-- 페이지 호출시 -->
<script>	
	$(function(){
		var grCode = $('#grCode').val();
// 		var grCode = '${gr.studyGroup_Code}';
		var loginUserCode = '${loginUser}';
		
		selectGrMemList(grCode, loginUserCode);
 		
	});
</script>

<!-- 그룹원 목록 보기 메뉴 -->
<script>
	function selectGrMemList(grCode, loginUserCode){
		$('#showMemList').css({"font-weight":"bold"});
		$('#showMemRank').css({"font-weight":""});
		
		$.ajax({
			url:"selectGroupMemberList.sgd",
			data : { grCode : grCode, loginUserCode : loginUserCode },		/* 로그인유저 코드 바꾸기 변경하기 수정하기 */
			type : "POST",
			success:function(data) {
				console.log(data);
				$('#leftIncludeArea').empty();
				$('#leftIncludeArea').append(data);
			}
		
		});
	};
	
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
					
					selectGrMemList(grCode, loginUserCode);
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
					data : { grCode : grCode, delMemCode : delMemCode },
					type : "POST",
					success:function(data) {
						console.log(data);
						$('#leftIncludeArea').empty();
						$('#leftIncludeArea').append(data);
						
						selectGrMemList(grCode, loginUserCode);
						
					}
				});
			}
		}else{
			alert("강퇴 권한이 없습니다.");
		}
	}
</script>

<script>
	function selectGrMemRank(grCode, loginUserCode){
		$('#showMemList').css({"font-weight":""});
		$('#showMemRank').css({"font-weight":"bold"});
		
		$.ajax({
			url:"selectGroupMemberList.sgd",
			data : { grCode : grCode, loginUserCode : loginUserCode },		/* 로그인유저 코드 바꾸기 변경하기 수정하기 */
			type : "POST",
			success:function(data) {
				console.log(data);
				$('#leftIncludeArea').empty();
				$('#leftIncludeArea').append(data);
			}
		
		});
	};	
</script>		

			
		</div>
	</div>
	</div>	
</body>

</html>

