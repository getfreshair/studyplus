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
			  .groupOptDetailTbl { width:230px; display:inline-table; font-size:14px; }
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
			
			.leftIncludeArea { width:100%; overflow:auto; background:yellow; }
			
	/* 게시물 영역 */		
		.centerContent { width:48.7%; margin-right:0.3%; border-right:1px solid gray; }
		
	/* 실시간 채팅 영역 */	
		.rightContent { width:24%; }
	</style>
	
<!-- /*	공통 요소 속성 */ -->
	<style>
		.radiusSmallWrapTd { height:10px; vertical-align:top; max-height:10px;}
		.radiusBoxSmall { border-radius:15px; margin-bottom:13px; padding:3px 12px; font-size:12px; font-weight:bold; display:inline; }
		.afterLoginShow { /* display:none; */ }  /* 후에 로그인 회원이 아니면 none으로 변경속성 변경하기(스타일 태그 지우고)  */
	</style>
</head>

<body>

	<jsp:include page="../common/header.jsp"/>
	<div class="pageAll"><br>
	<div class="pageWrap">
		<div class="pageContentArea">
		
			<div class="titleArea">
			<!-- *가입여부 체크 (가입-1 / 미가입-0 ,(**DB상으로는 가입-0, 미가입-1)) -->
				<input type="hidden" id="joinStatus" value="${joinStatus}"/>
				<div class="groupInfoArea topInfoArea">
					<div class="groupInfoLeft">
						<table class="topInfoAllWrapTbl" border="1">
							<tr><td class="radiusSmallWrapTd">
								<div class="category radiusBoxSmall">${group.location_Name} / ${group.category_Name}</div>
							</td></tr>
							<tr><td>
								<table class="topInfoContWrapTbl groupTitleTblWrap" border="1">
									<tr><td>
										<table class="groupTitleTbl">
											<tr><td><h2>${group.studyGroup_Name}</h2></td></tr>
											<tr><td class="groupIntro">
												${group.studyGroup_Intro}
											</td></tr>
										</table>
									</td></tr>
									<tr><td>
										<table class="groupOptDetailTbl">
											<tr><td>
												<strong>목표시간</strong>
												<span><fmt:formatNumber value="${group.studyGroup_GoalTime}" pattern="0"/> 시간</span>
<%-- 											<span>${group.studyGroup_GoalTime} 시간</span> --%>
											</td></tr>
											<tr><td>
												<strong>참여인원</strong>
												<span>${group.gr_Mem_Count} / ${group.studyGroup_MaxNum} 명</span>
											</td></tr>
											<tr><td>
												<strong>시 작 일</strong>	
												<span><fmt:formatDate value="${group.studyGroup_StDate}" pattern="yyyy. MM. dd."/> (${group.gr_Dates} 일 째)</span>
											</td></tr>
										</table>
									</td></tr>
								</table>
							</td></tr>									
						</table>
					</div>
					
					<div class="groupInfoRight">
						<table class="topInfoAllWrapTbl">
							<tr class="afterLoginShow"><td colspan="2" class="radiusSmallWrapTd">
								<div onclick="" class="radiBtn radiusBoxSmall">통계보기</div>
							</td></tr>
							<tr><td>
								<table class="topInfoContWrapTbl"><tr>
									<td width="50%"><div class="statBox groupStatBoxLeft">
										<table class="statBoxContTbl">
											<tr><td><h3>그룹 순위</h3> <strong>35 위</strong></td></tr>
											<tr><td><div>
												<div><strong>이 주의 공부시간</strong> <br> <span>346:57:37</span></div>
												<div>
													<strong>오늘의 공부시간</strong> <br> 
													<span><!-- 6:57:37 --><!-- pages-(pages%1) -> 내림처리 -->
														<c:set var="gr_Day_Total" value="${group.gr_Day_Total}"/>
														<fmt:formatNumber value="${(gr_Day_Total / 3600) - (gr_Day_Total % 3600)}" pattern="0"/>:
														<fmt:formatNumber value="${(gr_Day_Total % 3600) / 60}" pattern="0"/>:
														<fmt:formatNumber value="${(gr_Day_Total % 3600) % 60}" pattern="0"/>
													</span>
												</div>
											</div></td></tr>
										</table>
									</div></td>
									<td><div class="statBox groupStatBoxRight">
										<table class="statBoxContTbl">
											<tr><td><h3>목표 완수율</h3> <strong>${group.gr_Mem_Count / group.studyGroup_MaxNum * 100} %</strong></td></tr>
											<tr><td>
												<div><div class="goalRatio">${group.gr_Mem_Count} / ${group.studyGroup_MaxNum} 명 완수</div></div>
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
						<tr><td>
							<div><a href="" class="joinGroupBtn">그룹 가입하기</a></div>
						</td></tr>
<!-- 만약 로그인유저가 그룹 멤버라면 보이도록 -->
						<tr class="afterLoginShow"><td class="radiusSmallWrapTd">
							<div onclick="" class="radiBtn radiusBoxSmall">설 정</div>
						</td></tr>
						<tr class="afterLoginShow"><td>
							<table class="topInfoContWrapTbl"><tr>
								<td><div class="statBox groupStatBoxLeft">
									<table class="statBoxContTbl">
										<tr><td><h3>나의 순위</h3> <strong>5 위</strong></td></tr>
										<tr><td><div>
											<div><strong>이 주의 공부시간</strong> <br> <span>46:57:37</span></div>
											<div><strong>오늘의 공부시간</strong> <br> <span>6:57:37</span></div>
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
<!-- 만약 로그인유저가 그룹 멤버라면 보이도록 끝 -->
					</table>			
				</div>
			</div>
			
<script>
	$(function(){
		if (('#joinStatus').val() < 1){
			('.afterLoginShow').css({"display":"none"});
		}
	});


</script>			
			
			
<!-- 만약 로그인유저가 그룹 멤버라면 보이도록 -->
			<div class="contentArea includeArea">
				<div class="leftContent bottomContentArea">
					<div class="leftContentWrap">
						<div class="leftContentTabMenu">
							<div><span>그룹원 보기</span></div>
							<div>
								<span>그룹원 순위</span><span style="cursor:auto;">|</span><span>수행 현황</span>
							</div>
						</div>
						<div class="leftIncludeArea">
						
							<jsp:include page="leftGroupListArea.jsp"/>
							
						</div>
					</div>
				</div>
				<div class="centerContent bottomContentArea">
					
				</div>
				<div class="rightContent bottomContentArea">
					
				</div>
			</div>
			
		</div>
	</div>
	</div>	
</body>

	
</html>