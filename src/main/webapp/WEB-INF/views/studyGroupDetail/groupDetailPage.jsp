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

	<!-- #### CSS FILES ### -->
	<link rel="stylesheet" href="/studyplus/resources/css/bootstrap.css">
	<link rel="stylesheet" href="/studyplus/resources/css/custom.css">
	
	<link rel="stylesheet" href="/studyplus/resources/css/w3.css">
	
	<!-- #### JAVASCRIPT FILES ### -->
	<script src="/studyplus/resources/js/jquery-1.11.1.min.js"></script>
	<script src="/studyplus/resources/js/bootstrap.min.js"></script>
	



		
	
<!-- /* 전체영역 */ -->
<style>
	html { overflow-x:auto; }
	html, body { background:#f8f8f8; font-family:맑은고딕 !important; }
	.pageAll * { font-family:맑은고딕 !important; cursor:default; }
	.pageWrap { width:1200px; margin:0px auto; }
	.pageContentArea { width:98%; margin:0px auto; }
</style>
	
<!-- /* 상단부 */ -->
<style>
	.titleArea { width:100%; margin-bottom:20px; display:flex; }
	.topInfoArea { border-radius:40px; background:white; padding:25px 0px; text-align:center; 
					border-style:hidden; box-shadow:4px 5px 5px 1px lightgray; }
	
	    .topInfoAllWrapTbl { width:100%; height:100%; margin:0px auto; position:relative; }
        .topInfoContWrapTbl { width:100%; height:100%; margin:0px auto; vertical-align:middle; }
	
	.groupInfoArea { width:56.5%; margin-right:0.8%; display:flex; }
	  .groupInfoLeft { width:46%; padding:0px 10px 0px 15px; border-right:1px solid gray; }
		.category { background:lightgray; }
		.groupTitleTblWrap { margin-left:5px; position:relative; }
		  .groupTitleTbl { width:100%; margin-bottom:0px;/* margin: 0px 0px 5px; */ }
		  .groupTitleTbl h2 { font-weight:bold; line-height:1.7; font-size:27px; margin:10px 0px 0px; }
 		  .groupTitleTbl .groupIntro { height:55px; padding:15px 15px 15px 5px; font-size:15px; table-layout:fixed; word-break:keep-all; }
		  .groupOptDetailTbl { width:225px; display:inline-table; font-size:14px; }
 		  .groupOptDetailTbl td { padding:7px 5px 1px 5px; border-bottom:1px solid gray; }
		  .groupOptDetailTbl strong { float:left; }
		  .groupOptDetailTbl div { float:right; }
		  .dataResultColor { color:#f1bc3c; }
	  .groupInfoRight { width:54%; padding:0px 15px; }
	    .radiBtn { background:#00a0e9; float:right; cursor:pointer; color:white; border-radius:10px; }
 	      .groupStatBoxLeft { float:left; background:#f8f8f8; }
 		  .groupStatBoxRight { float:right; background:#f8f8f8; }
	 	  .statBox { width:160px; height:220px; border-radius:15px; padding:3px 7px; display:table; }
  		    .statBoxContTbl { display:table-cell; vertical-align:middle; margin:0px; }
  		    .statBoxContTbl tbody { width:160px; height:190px; display:inline-table; vertical-align:middle; }
		    .statBoxContTbl h3 { font-size:17px; font-weight:bold; line-height:1.2; margin:0px 0px 15px; }
  		    .statBoxContTbl tr:first-child td { /* width:140px; */ padding-bottom:12px; font-size:21px; }
   		    .statBoxContTbl tr:nth-child(2n) td > div { width:85%; height:92px; border-top:1px dashed; margin:0px auto; display:inline-table; text-align:center; }
   		    .statBoxContTbl tr:nth-child(2n) td div div { padding-top:8px; font-size:13px; display:inline-block; text-align:right;  }
   		    .statBoxContTbl tr:nth-child(2n) td div div strong { float:right;  }
			.goalRatio { font-weight:bold; font-size:18px !important; padding-top:0px !important; display:table-cell !important; vertical-align:middle; text-align:center !important; }
/*   */ 
	.myInfoArea { width:42.8%; overflow:hidden; position:relative; padding:25px 15px; }
	  .myInfoAreaBack { position:absolute; top:0%; left:0%; background:rgba(0, 0, 0, 0.3); width:100%; height:100%; }
	    .joinGroupBtn { font-weight:bold; font-size:25px; color:white; }
 	    .myStatBox { float:left; background:#f8f8f8; }
	    .lineGraph { background:white; width:100%; height:220px; float:right; padding:3px 7px; display:inline-block; }
</style>	
	
<!-- /*	하단 컨텐츠 작성 */ -->
<style>
	.contentArea { width:100%; max-height:720px; margin-bottom:10px; display:flex; }
	.bottomContentArea { background:white; /* height:100%; */ padding:20px 15px; display:inline-block; text-align:center; }
	
	
	/*	그룹원 리스트 영역 */
	.leftContent { width:26.7%; padding-right:1px; margin-right:0.3%; border-right:1px solid gray; }
	  .leftContentWrap { width:100%; height:100%; display:inline-block; }
		.leftContentTabMenu {/*  width:100%; */ margin-right:15px; padding-bottom:10px; border-bottom:1px solid gray; margin-bottom:10px; text-align:right; }
		.leftContentTabMenu div { display:inline-table; }
		.leftContentTabMenu div:first-child { float:left; }
		.leftContentTabMenu span { padding:0px 5px; font-size:15px; /* font-weight:bold; */ }
		
		.leftIncludeArea { width:100%; overflow-y:auto; height:100% }
		
	.priodTabMenuArea {/*  width:100%; */ margin-right:15px; padding:0px 10px 0px 10px; /* border-bottom:1px solid gray; */ text-align:right; }
	 .priodTabMenuArea tbody { vertical-align:baseline; }
	  .priodTabMenuArea span { font-size:14px;}
 		.prevBtn:hover, .nextBtn:hover { cursor:pointer; color:#ed876a; font-weight:bold; }
 		
 	/*	그룹원 리스트 - 회원 표시 공통 영역 */	
	.memberOneWrapArea { width:263px; /* border:1px dashed red; display:inline-block; */ }
	  .memberInfo { margin:10px 0px; }
		.memberInfo td { position:relative; padding-left:12px; text-align:left; display:table-cell; vertical-align:middle; }
		  .rankImg { position:absolute; width:15px; margin-top:-8px; }
		    .rankImg img{ margin-left:37px; }
		  .profImg { width:50px; height:50px; overflow-y:hidden; border-radius:50%; }
		  	.profImg img { width:100%; }
		.nickName { width:105px; height:25.56px; font-size:12.5px; line-height:1.2; word-break:break-all; }
	
	/*  게시물 영역 */		
	.centerContent { width:48.7%; padding-right:1px; margin-right:0.3%; border-right:1px solid gray; }
	  .centerContentWrap { width:100%; height:100%; display:inline-block; }
	  .centerIncludeArea { width:100%; overflow:auto; }
	  
	/*  실시간 채팅 영역 */	
	.rightContent { width:24%; }
</style>
	
<!-- /*	 공통 요소 속성 */ -->
<style>
	.radiusSmallWrapTd { height:10px; vertical-align:top; max-height:10px;}
	.radiusBoxSmall { border-radius:15px; margin-bottom:13px; padding:3px 12px; font-size:12px; font-weight:bold; display:table-cell; }
	.menuBtn { cursor:pointer;  }
	.menuBtn:hover { font-weight:bold; color:darkgray; }
</style>
</head>

<body>

	<jsp:include page="../common/header.jsp"/>
	
	<div class="pageAll"><br>
	<div class="pageWrap">
		<div class="pageContentArea">
		
			<div class="titleArea">
			<!-- *가입여부 체크 (가입-1 / 미가입-0 ,(**DB상으로는 가입-0, 미가입-1)) -->
				<input type="hidden" id="grCode" value="${gr.studyGroup_Code}"/>
 				<input type="hidden" id="grLeaderCode" value="${gr.leaderMem_Code}"/>
				
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
											<tr><td class="groupIntro">${gr.studyGroup_Intro}</td></tr>
										</table>
									</td></tr>
									<tr><td>
										<table class="groupOptDetailTbl">
											<tr><td>
												<strong>목표시간</strong>
												<div><span class="dataResultColor">${gr.studyGroup_GoalTime}</span><span> 시간</span></div>
											</td></tr>
											<tr><td>
												<strong>참여인원</strong>
												<div><span class="dataResultColor">${gr.gr_Mem_Count}</span><span> / ${gr.studyGroup_MaxNum} 명</span></div>
											</td></tr>
											<tr><td>
												<strong>시 작 일</strong>	
												<div><span>
													<fmt:formatDate value="${gr.studyGroup_StDate}" pattern="yy. MM. dd."/>
													(<span class="dataResultColor">${gr.gr_Dates}</span> 일 째)
												</span></div>
												
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
											<tr><td>
												<h3>주간 그룹 순위</h3>
												<strong><c:out value="${grR.gr_Rank}" default="-"/> 위</strong>
											</td></tr>
											<tr><td><div>
												<div>
													<strong>이 주의 공부시간</strong> <br>
													<span>
														<c:set var="gr_Week_Hour" value="${(grR.gr_Week_Total / 3600)}"/>
														<c:set var="gr_Week_Min" value="${(grR.gr_Week_Total % 3600) / 60}"/>
														<fmt:formatNumber var="gr_Week_H" value="${gr_Week_Hour - (gr_Week_Hour % 1)}" pattern="#00"/>
														<fmt:formatNumber var="gr_Week_M" value="${gr_Week_Min - (gr_Week_Min % 1)}" pattern="00"/>
														<fmt:formatNumber var="gr_Week_Sec" value="${(grR.gr_Week_Total % 3600) % 60}" pattern="00"/>
														${gr_Week_H}:${gr_Week_M}:${gr_Week_Sec}
													</span>
												</div>
												<div>
													<strong>오늘의 공부시간</strong> <br> 
													<span><!-- 6:57:37 --><!-- pages-(pages%1) -> 내림처리 -->
														<c:set var="gr_Day_Hour" value="${(grR.gr_Day_Total / 3600)}"/>
														<c:set var="gr_Day_Min" value="${(grR.gr_Day_Total % 3600) / 60}"/>
														<fmt:formatNumber var="gr_Day_H" value="${gr_Day_Hour - (gr_Day_Hour % 1)}" pattern="#00"/>
														<fmt:formatNumber var="gr_Day_M" value="${gr_Day_Min - (gr_Day_Min % 1)}" pattern="00"/>
														<fmt:formatNumber var="gr_Day_Sec" value="${(grR.gr_Day_Total % 3600) % 60}" pattern="00"/>
														${gr_Day_H}:${gr_Day_M}:${gr_Day_Sec}
													</span>
												</div>
											</div></td></tr>
										</table>
									</div></td>
									<td><div class="statBox groupStatBoxRight">
										<table class="statBoxContTbl">
											<tr><td>
												<h3>주간 목표 완수율</h3>
												<strong><c:out value="${grR.gr_Week_Fulfill_Ratio}" default="-"/> %</strong>
											</td></tr>
											<tr><td>
												<div><div class="goalRatio"><c:out value="${grR.gr_Fulfill_Mem_Cnt}" default="0"/> / ${gr.gr_Mem_Count} 명 완수</div></div>
											</td></tr>
										</table>
									</div></td>
								</tr></table>
							</td></tr>
						</table>			
					</div>
				</div>
				
				<div class="myInfoArea topInfoArea" style="background-image:url(${ contextPath }/resources/images/studyGroupDetail/study.jpg");">
					<div><div class="myInfoAreaBack"></div></div>
					<table class="topInfoAllWrapTbl">
					<!-- 그룹 미가입시 -->
					  <c:if test="${joinStatus < 1}">
						<tr><td>
							<div><a onclick="joinGroup();"href="" class="joinGroupBtn">그룹 가입하기</a></div>
						</td></tr>
					  </c:if>
<%--					<c:if test="${joinStatus < 1}"> 		 설정버튼 클릭 하면 그룹 탈퇴 버튼 뜨거나 그룹 설정 버튼 띄우기 --%>
<!-- 						<tr><td> -->
<!-- 							<div><a onclick="breakAwayGroup();" href="" class="breakAwayGroupBtn">그룹 탈퇴하기</a></div> -->
<!-- 						</td></tr> -->
<%-- 					</c:if> --%>
					  
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
											<h3>나의 주간 순위</h3>
											<strong><c:out value="${join.my_Rank}" default="-"/> 위</strong>
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
								<td><div class="statBox lineGraph">
									<table class="statBoxContTbl">
										<tr><td width="56%">
											<div><jsp:include page="topRightGraphArea.jsp"/></div>
										</td></tr>
									</table>
								</div></td>
							</tr></table>
						</td></tr>
					  </c:if>
<!-- 만약 로그인유저가 그룹 멤버라면 보이도록 끝 -->
					</table>			
<!-- 					</div> -->
				</div>
			</div>
			
<script>	
	function joinGroup(){
		var grCode = $('#grCode').val();
		var memCode = '${sessionScope.loginUser.member_Code}';
		
// 		var grCode = '${gr.studyGroup_Code}';
// 		var memCode = '${loginUser}';
		
		$.ajax({
			url : "insertGroupJoin.sgd",
			data : { grCode : grCode, memCode : memCode },
			type : "POST",
			success : function(data){
					if(data >= 1){
						location.href="selectOneGroup.sgd?group_No=" + grCode;
					}else{
						alert("가입 가능 최대 인원을 초과하여 가입 할 수 없습니다.");
					}
			},
			error : function(){
				alert("에러냐?");
			}
		});
	}
	
	function breakAwayGroup(){
		var grCode= $('#grCode').val();
		var loginUserCode = '${loginUser}';
		
		var breakAwayChk = confirm("그룹에서 탈퇴  하시겠습니까?");
			
		if(breakAwayChk){

			$.ajax({
				url:"updateDeleteGroupMember.sgd",
				data : { grCode : grCode, delMemCode : loginUserCode, loginUserCode : loginUserCode },
				type : "POST",
				success:function(data) {
					console.log(data);
					if(data >= 1){
						location.href="selectOneGroup.sgd?group_No=" + grCode;
					}else{
						alert("탈퇴 할 수 없습니다.");
					}
				}
			});
		}else{
			alert("강퇴 권한이 없습니다.");
		}
	}	
</script>			
						
<!-- 만약 로그인유저가 그룹 멤버라면 보이도록 -->
		  <c:if test="${joinStatus >= 1}">
			<div class="contentArea includeArea">
				<div class="leftContent bottomContentArea">
					<div class="leftContentWrap">
						<div class="leftContentTabMenu">
							<input type="hidden" id="menuTypeValue" value="0"/>
							<div>
								<span id="showMemList" class="menuBtn" onclick="selectGrMemList('${gr.studyGroup_Code}', '${loginUser}');">그룹원 보기</span>
							</div>
							<div>
								<span id="showMemRank" class="menuBtn" onclick="selectGrMemRankPeriod('${gr.studyGroup_Code}');">그룹원 순위</span>
								<span style="cursor:default;">|</span>
								<span id="showMemTime" class="menuBtn" onclick="selectGrMemTimePeriod('${gr.studyGroup_Code}');">수행 현황</span>
							</div>
						</div>
						<div class="leftIncludeArea">

							<div class="priodTabMenuArea">
								<table width="100%"><tr>
									<td class="textAlignStyle">
										<span><strong class="prevBtn">&laquo; &nbsp;</strong></span>
											<span class="selectDay"><label id="thisDayLbl"></label></span>
											<span class="selectWeek"><label id="thisWeek"></label><label>주차</label></span>
											<span class="selectMonth"><label id="thisMonth"></label></span>
										<span><strong class="nextBtn">&nbsp; &raquo;</strong></span>
									</td>
									<td style="text-align:right;" class="hideMemTime">
										<span id="selectDay" class="menuBtn">일간</span>
										<span>|</span>
										<span id="selectWeek" class="menuBtn">주간</span>
										<span>|</span>
										<span id="selectMonth" class="menuBtn">월간</span>
									</td>
								</tr></table>
							</div>

							<div id="leftIncludeArea">
<%-- 							<jsp:include page="leftGroupStudyTimeTotal.jsp"/> --%>
							</div>

						</div>
					</div>
				</div>
				
				<div class="centerContent bottomContentArea">
					<div class="centerContentWrap">
						<div class="centerIncludeArea">		
<%-- 							<jsp:include page="bottomCenterInclude/boardWrite.jsp"/> --%>
<%-- 							<jsp:include page="bottomCenterInclude/grBoardList.jsp"/> --%>
						</div>
					</div>
				</div>
				
				<div class="rightContent bottomContentArea">
					
				</div>
			</div>
		  </c:if>

<!-- 페이지 호출시 -->
<script>
	$(function(){
		var grCode = $('#grCode').val();
		var loginUserCode = '${loginUser}';
		
 		selectGrMemList(grCode, loginUserCode);
 		
 		selectGrBoardList(grCode, loginUserCode);
 		
 		$.ajax({
			url : "${contextPath}/web/groupChat.groupSocket",
			type : "GET",
			success : function(data){
				$(".rightContent").empty();
				$(".rightContent").append(data);
			}
		});
	});
</script>

<!-- 그룹원 목록 보기 메뉴 -->
<script>
	function selectGrMemList(grCode, loginUserCode){
		$('#showMemList').css({"font-weight":"bold"});
		$('#showMemRank').css({"font-weight":""});
		$('#showMemTime').css({"font-weight":""});
		$('.priodTabMenuArea').css({"display":"none"});
		
		$.ajax({
			url:"selectGroupMemberList.sgd",
			data : { grCode : grCode, loginUserCode : loginUserCode },
			type : "POST",
			success:function(data) {
				console.log(data);
				$('#leftIncludeArea').empty();
				$('#leftIncludeArea').append(data);
			}
		});
	};
</script>

<!-- 그룹원 순위 보기 메뉴 -->
<script>
	function selectGrMemRankPeriod(grCode){
		var periodType = 1;
		var dayPick = 0;
		var monthPick = 0;
		var changeCnt = 0;
		var grStDate = '${gr.studyGroup_StDate}';
		
		var menuType = 2;
		
		
		$('#showMemList').css({"font-weight":""});
		$('#showMemRank').css({"font-weight":"bold"});
		$('#showMemTime').css({"font-weight":""});
			
		$('.priodTabMenuArea').css({"display":""});
		$('.hideMemTime').css({"display":""});
		$('.textAlignStyle').css({"text-align":"left"});
		
		console.log("grCode : " + grCode);
		console.log("changeCnt : " + changeCnt + " / menuType : " + menuType);
		console.log("periodType : " + periodType + " / dayPick : " + dayPick + " / monthPick : " + monthPick);
	
		//메뉴 열리면 초기 설정
		selectPeriodMenu(periodType, menuType);
		
		//호출 함수로 변수를 객체property로 받아오기
/* 		var selectPeriodUnit = selectPeriodMenu(periodType);
		var periodUnit = selectPeriodUnit();
		dayPick = periodUnit.dayPick;
		monthPick = periodUnit.monthPick;
		changeCnt = periodUnit.changeCnt; */
		
		$("#selectDay").click(function(){
			periodType = 1;
			selectPeriodMenu(periodType, menuType);
		});
		$("#selectWeek").click(function(){
			periodType = 2;
			selectPeriodMenu(periodType, menuType);
		});
		$("#selectMonth").click(function(){
			periodType = 3;
			selectPeriodMenu(periodType, menuType);
		});

		function selectPeriodMenu(periodType, menuType){
// 			alert("기간 타입 : " + periodType);
// 			alert("2번 메뉴 : " + menuType);
			
			if(periodType == 1){
				
				if(dayPick != 1){
					dayPick = 1;
					monthPick = 0;
					
					changeCnt = 0;
		
					$('.selectDay').css({"display":""},{"cursor":"auto"});
					$('.selectWeek').css({"display":"none"});
					$('.selectMonth').css({"display":"none"});
					
					$('#selectDay').css({"font-weight":"bold"});
					$('#selectWeek').css({"font-weight":""});
					$('#selectMonth').css({"font-weight":""});
				}
			}
			
			if(periodType == 2){
				if(dayPick != 7){
					dayPick = 7;
					monthPick = 0;
					
					changeCnt = 0;
		
					$('.selectDay').css({"display":"none"});
					$('.selectWeek').css({"display":""},{"cursor":"auto"});
					$('.selectMonth').css({"display":"none"});
					
					$('#selectDay').css({"font-weight":""});
					$('#selectWeek').css({"font-weight":"bold"});
					$('#selectMonth').css({"font-weight":""});
				}
			}
			
			if(periodType == 3){
				if(monthPick != 1){
					monthPick = 1;
					dayPick = 0;
					
					changeCnt = 0;
		
					$('.selectDay').css({"display":"none"});
					$('.selectWeek').css({"display":"none"});
					$('.selectMonth').css({"display":""},{"cursor":"auto"});
					
					$('#selectDay').css({"font-weight":""});
					$('#selectWeek').css({"font-weight":""});
					$('#selectMonth').css({"font-weight":"bold"});
				}
			}
			
			console.log("기간 메뉴 클릭시 변수 값 =>");
			console.log("changeCnt : " + changeCnt + " / menuType : " + menuType);
			console.log("periodType : " + periodType + " / dayPick : " + dayPick + " / monthPick : " + monthPick);
			
			selectDateByPeriod(periodType, changeCnt, dayPick, monthPick, grCode, menuType);
		};
		
		$(".prevBtn").click(function(){
			changeCnt = clickPrevBtn(changeCnt, thisDay2, grStDate);
			selectDateByPeriod(periodType, changeCnt, dayPick, monthPick, grCode, menuType);
		});
		
		$(".nextBtn").click(function(){
			changeCnt = clickNextBtn(changeCnt);
			selectDateByPeriod(periodType, changeCnt, dayPick, monthPick, grCode, menuType);
		});
		
		console.log("바뀌었나 ? : " + periodType);
	};
	
	function selectGrMemRankListPage(grCode, thisDay, periodType){
		console.log("2번 메뉴 페이지 부르기 => ");
		console.log("thisDay : " + thisDay + " / thisDay2 : " + thisDay2 + " / thisDay3 : " + thisDay3);
		
 		$.ajax({
			url:"selectGroupMemberRankList.sgd",
			data : { grCode : grCode, thisDay : thisDay,
					 periodType : periodType },
			type : "POST",
			success:function(data) {
				console.log("들어오니?");
				console.log(data);
				console.log("thisDay : " + thisDay);
				
				$('#leftIncludeArea').empty();
				$('#leftIncludeArea').append(data);
			}
		});
	};	
</script>

<!-- 그룹원 현황 보기 메뉴 -->
<script>
	function selectGrMemTimePeriod(grCode){
		var periodType = 2;
		var dayPick = 7;
		var monthPick = 0;
		var changeCnt = 0;
		var grStDate = '${gr.studyGroup_StDate}';
		
		var menuType = 3;
		
		$('#showMemList').css({"font-weight":""});
		$('#showMemRank').css({"font-weight":""});
		$('#showMemTime').css({"font-weight":"bold"});
			
		$('.selectDay').css({"display":"none"});
		$('.selectWeek').css({"display":""},{"cursor":"auto"});
		$('.selectMonth').css({"display":"none"});
		
		$('.priodTabMenuArea').css({"display":""});
		$('.hideMemTime').css({"display":"none"});
		$('.textAlignStyle').css({"text-align":"center"});
		
		console.log("3번메뉴 호출시 변수 값 확인1 =>");
		console.log("grCode : " + grCode);
		console.log("changeCnt : " + changeCnt + " / menuType : " + menuType);
		console.log("periodType : " + periodType + " / dayPick : " + dayPick + " / monthPick : " + monthPick);
		
		if(changeCnt == 0){
			selectDateByPeriod(periodType, changeCnt, dayPick, monthPick, grCode, menuType);
			console.log("3번메뉴 호출시 변수 값 확인2 =>");
			console.log("changeCnt : " + changeCnt + " / menuType : " + menuType);
			console.log("periodType : " + periodType + " / dayPick : " + dayPick + " / monthPick : " + monthPick);
		}
		
		
// 		$('#showMemList:hover').css({"pointer":"auto"});
		$(".prevBtn").click(function(){
			changeCnt = clickPrevBtn(changeCnt, thisDay3, grStDate);
			selectDateByPeriod(periodType, changeCnt, dayPick, monthPick, grCode, menuType);
		});
		
		$(".nextBtn").click(function(){
			changeCnt = clickNextBtn(changeCnt);
			selectDateByPeriod(periodType, changeCnt, dayPick, monthPick, grCode, menuType);
		});
	};
	
	function selectGrMemTimeListPage(grCode, thisDay){
		console.log("3번 메뉴 페이지 부르기 => ");
		console.log("thisDay : " + thisDay + " / thisDay2 : " + thisDay2 + " / thisDay3 : " + thisDay3);
		
 		$.ajax({
			url:"selectGroupMemberTimeList.sgd",
			data : { grCode : grCode, thisDay : thisDay },
			type : "POST",
			success:function(data) {
				console.log("들어오니?");
				console.log(data);
				console.log("thisDay : " + thisDay);
				
				$('#leftIncludeArea').empty();
				$('#leftIncludeArea').append(data);
			}
		});
	};	
</script>

<!-- 출력 날짜에 해당하는 기간 선택 함수(공통사용) -->
<script>
	function clickPrevBtn(changeCnt, thisDay, grStDate){
// 		alert(thisDay);
		if(thisDay > grStDate){
			changeCnt -= 1;
			if(thisDay < grStDate){
				changeCnt += 1;
			}
		}
		return changeCnt;
	}
	
	function clickNextBtn(changeCnt){			
		if(changeCnt < 0){
			changeCnt += 1;
		}
		return changeCnt;
	}
	
	function selectDateByPeriod(periodType, changeCnt, dayPick, monthPick, grCode, menuType){
		var changeDates = 0;
		var changeMonths = 0;
		thisDay2 = 0;
		thisDay3 = 0;
		
		if(periodType <= 2){
			changeDates = changeCnt * dayPick;
		}else if(periodType > 2){
			changeMonths = changeCnt * monthPick;
		}

		console.log("기간별 날짜 정보 가져오는 함수에서 ajax로 전달 할 변수 값 => " + " / menuType : " + menuType);
		console.log("changeCnt : " + changeCnt + " / changeDates : " + changeDates + " / changeMonths : " + changeMonths);
		console.log("periodType : " + periodType + " / dayPick : " + dayPick + " / monthPick : " + monthPick);

// 			"	async : false,	"
		$.ajax({
			url:"selectDateByPeriod.sgd",
			data : { periodType : periodType, 
					 changeDates : changeDates, changeMonths : changeMonths },
			type : "POST",
			
			success:function(data) {
				if(menuType == 2){
					thisDay2 = "" + data.selectDate.THIS_DAY;
				}else if(menuType == 3){
					thisDay3 = "" + data.selectDate.THIS_DAY;
				}
					
					$('#thisDayLbl').text(data.selectDate.THIS_DAY);
					console.log("라벨에 날짜 제대로 떠?" + $('#thisDayLbl').text());
					
					$('#thisWeek').text(data.selectDate.THIS_WEEK + " " + data.selectDate.WEEK_NUM);
					$('#thisMonth').text(data.selectDate.THIS_MONTH);
				
				console.log("에이작스 결과 => " + " / menuType : " + menuType);
				console.log("변경 된 thisDay2 : " + thisDay2);
				console.log("변경 된 thisDay3 : " + thisDay3);
				console.log("changeCnt : " + changeCnt + " / changeDates : " + changeDates + " / changeMonths : " + changeMonths);
				console.log("periodType : " + periodType + " / dayPick : " + dayPick + " / monthPick : " + monthPick);		

				console.log(data);
				
				if(menuType == 2){
					selectGrMemRankListPage(grCode, thisDay2, periodType);

				}else if(menuType == 3){
					selectGrMemTimeListPage(grCode, thisDay3);
				}
			}
		});
	}
</script>

<script>
	function selectGrBoardList(grCode, loginUserCode){
		$.ajax({
			url:"selectGroupBoardList.sgd",
			data : { grCode : grCode , loginUserCode : loginUserCode},
			type : "POST",
			success:function(data) {
				console.log(data);
				$('.centerIncludeArea').empty();
				$('.centerIncludeArea').append(data);
			}
		});
	}
</script>
			
		</div>
	</div>
	</div>	
</body>

</html>

