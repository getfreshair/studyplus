<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*, always.awake.studyplus.member.model.vo.*, java.util.*,
				 java.io.*,java.lang.Process,always.awake.studyplus.studyPlanner.model.vo.*,
				 always.awake.studyplus.sgDetail.model.vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	HashMap<String,Object> dataMap = (HashMap<String,Object>)request.getAttribute("dataMap");
	ArrayList<Goal> goalList = (ArrayList<Goal>)dataMap.get("goalList");
	ArrayList<SGDetail> groupList = (ArrayList<SGDetail>)dataMap.get("groupList");
	int todayStudyTime = (Integer)dataMap.get("todayStudyTime");
	int goalSize = goalList.size();
	int groupSize = groupList.size(); 
%>
<!DOCTYPE html>
<html>
<!-- Core stylesheet -->
<link rel="stylesheet" href="modal-loading.css">
<!-- CSS3 animations -->
<link rel="stylesheet" href="modal-loading-animate.css">

<head>
<script>
	var ing = false;
	window.onbeforeunload = function(){
		if(!ing){
			alert("bye!!");
		}
	}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.hovereffect {
  width: 100%;
  height: 100%;
  float: left;
  overflow: hidden;
  position: relative;
  text-align: center;
  cursor: default;
}

.hovereffect .overlay {
  width: 100%;
  height: 100%;
  position: absolute;
  overflow: hidden;
  top: 0;
  left: 0;
}

.hovereffect img {
  display: block;
  position: relative;
}

.hovereffect h2 {
  text-transform: uppercase;
  color: black;
  text-align: center;
  font-size: 17px;
  padding: 10px;
}

.hovereffect:hover h2 {
  opacity: 0;
  filter: alpha(opacity=0);
  -webkit-transform: translate3d(-50%,-50%,0) scale3d(0.8,0.8,1);
  transform: translate3d(-50%,-50%,0) scale3d(0.8,0.8,1);
}

.hovereffect a.info {
  display: inline-block;
  text-decoration: none;
  padding: 7px 14px;
  text-transform: uppercase;
  color: black;
  border: 1px solid #fff;
  margin: 50px 0 0 0;
  background-color: transparent;
}

.hovereffect a.info:hover {
  box-shadow: 0 0 5px black;
}

.hovereffect hr {
  width: 20%;
  opacity: 0;
  filter: alpha(opacity=0);
  border: 1px solid black;
}

.hovereffect  hr:nth-child(3) {
  -webkit-transform: translate3d(-50%,-50%,0) rotate3d(0,0,1,90deg) scale3d(0,0,1);
  transform: translate3d(-50%,-50%,0) rotate3d(0,0,1,90deg) scale3d(0,0,1);
}

.hovereffect  hr:nth-child(4) {
  -webkit-transform: translate3d(-50%,-50%,0) rotate3d(0,0,1,180deg) scale3d(0,0,1);
  transform: translate3d(-50%,-50%,0) rotate3d(0,0,1, 180deg) scale3d(0,0,1);
}

.hovereffect h2, .hovereffect hr {
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transition: opacity 0.35s, -webkit-transform 0.35s;
  transition: opacity 0.35s, transform 0.35s;
  -webkit-transform: translate3d(-50%,-50%,0);
  transform: translate3d(-50%,-50%,0);
  -webkit-transform-origin: 50%;
  -ms-transform-origin: 50%;
  transform-origin: 50%;
  background-color: transparent;
  margin: 0px;
}

.set1, .set2 {
  left: 50%;
  position: absolute;
  -webkit-transition: opacity 0.35s, -webkit-transform 0.35s;
  transition: opacity 0.35s, transform 0.35s;
  -webkit-transform: translate3d(-50%,-50%,0);
  transform: translate3d(-50%,-50%,0);
  -webkit-transform-origin: 50%;
  -ms-transform-origin: 50%;
  transform-origin: 50%;
  background-color: transparent;
  margin: 0px;
  padding: 0px;
}

.set1 {
  top: 38%;
}

.set2 {
  top: 62%;
}

.hovereffect p {
  width: 30%;
  text-transform: none;
  font-size: 15px;
  line-height: 2;
}

.hovereffect p a {
  color: black;
}

.hovereffect p a:hover,
.hovereffect p a:focus {
  opacity: 0.6;
  filter: alpha(opacity=60);
}

.hovereffect  a i {
  opacity: 0;
  filter: alpha(opacity=0);
  -webkit-transition: opacity 0.35s, -webkit-transform 0.35s;
  transition: opacity 0.35s, transform 0.35s;
  padding: 10px;
  font-size: 20px;
}

.set1 a:first-child i {
  -webkit-transform: translate3d(-60px,-60px,0);
  transform: translate3d(-60px,-60px,0);
}

.set1 a:nth-child(2) i {
  -webkit-transform: translate3d(60px,-60px,0);
  transform: translate3d(60px,-60px,0);
}

.set2 a:first-child i {
  -webkit-transform: translate3d(-60px,60px,0);
  transform: translate3d(-60px,60px,0);
}

.set2 a:nth-child(2) i {
  -webkit-transform: translate3d(60px,60px,0);
  transform: translate3d(60px,60px,0);
}

.hovereffect:hover hr:nth-child(3) {
  opacity: 1;
  filter: alpha(opacity=100);
  -webkit-transform: translate3d(-50%,-50%,0) rotate3d(0,0,1,-90deg) scale3d(1,1,1);
  transform: translate3d(-50%,-50%,0) rotate3d(0,0,1,-90deg) scale3d(1,1,1);
}

.hovereffect:hover hr:nth-child(4) {
  opacity: 1;
  filter: alpha(opacity=100);
  -webkit-transform: translate3d(-50%,-50%,0) rotate3d(0,0,1,-180deg) scale3d(1,1,1);
  transform: translate3d(-50%,-50%,0) rotate3d(0,0,1,-180deg) scale3d(1,1,1);
}

.hovereffect:hover .set1 i:empty, .hovereffect:hover .set2 i:empty {
  -webkit-transform: translate3d(0,0,0);
  transform: translate3d(0,0,0);
  opacity: 1;
  filter: alpha(opacity=100);
}


	.mainDiv {
		
	}
	
	.mainDiv:after {
		content:"";
		position: absolute;
		top:0;
		left:0;
		background :url("resources/images/block/test.jpg") 50% no-repeat;
		width:100%;
		height:750px;
		opacity: 0.2;
		z-index: -1;
	}
	
	 .contentDiv{
		height:800px;
	} 
	
</style>
</head>
<body>	
	<div class="mainDiv">
		<div align="center" class="topDiv col-xs-12 col-md-12" style="background:black; color:white; height:100px; font-size:3em">
			top view
		</div>
		<div class="contentDiv col-xs-12 col-md-4">
			<div class="profileDiv" style="width:90%; height:150px; margin-top:50px ; margin-left:50px ">
				<img src="resources/images/block/profile.jpg" style="border-radius:70px">
				<span style="font-size:2em; font-weight: bold; margin:20px; color:orangered ">오늘의 적은 어제의 나 </span>
				<script>
					// 메인타이머 초기화
					var mainTimmerTime = <%=todayStudyTime%>*10;  				// 메인컨트롤 타이머용 시간
					var mainTimmerStatus = 0;				// 메인컨트롤 타이머 상태 
					var originTodayStudyTime = <%=todayStudyTime%>;
					
					// 그룹용 타이머 초기화
					var groupTimmerTimes = new Array();		// 그룹 타이머의 시간
					var groupTimmerStatus = new Array(); 	// 그룹 타이머의 상태
					var groupTimmerCode = new Array();		// 그룹 타이머의 그룹 코드
					var groupTimmerOriginTime = new Array();// 그룹 타이머의 기존 공부시간
					var executeGroupTimmerName = '';		// 실행중인 그룹타이머 이름
					var originGroupTimmerIndex = 0;			// 실행중인 그룹타이머 인덱스
					// 그룹용 타이머 배열 초기화
					<% 
						for(int i = 0; i < groupList.size() ; i ++){
					%>
						groupTimmerTimes[<%=i%>] = <%=groupList.get(i).getGroupTotalStudyTime()%> * 10 ;
						groupTimmerCode[<%=i%>] = <%=groupList.get(i).getStudyGroup_Code()%> ;
						groupTimmerOriginTime[<%=i%>] = <%=groupList.get(i).getGroupTotalStudyTime()%> ;
						groupTimmerStatus[<%=i%>] = 0;
					<%
						}
					%>
					// 목표용 타이머 초기화
					var goalTimmerTimes = new Array();		// 목표 타이머의 시간
					var goalTimmerStatus = new Array(); 	// 목표 타이머의 상태
					var goalTimmerCode = new Array();		// 목표 타이머의 그룹 코드
					var goalTimmerOriginTime = new Array();	// 목표 타이머의 기존 공부시간
					var executeGoalTimmerName = '';			// 실행중인  목표타이머 이름
					var originGoalTimmerIndex = 0;			// 실행중인 그룹타이머 인덱스
					
					// 목표용 타이머 배열 초기화
					<% 
						for( int i = 0; i < goalList.size(); i ++) {
					%>
							goalTimmerTimes[<%=i%>] = <%=goalList.get(i).getGoalAchieveAmount()%>* 10;
							goalTimmerCode[<%=i%>] = <%=goalList.get(i).getGoalCode()%>;
							goalTimmerOriginTime[<%=i%>] = <%=goalList.get(i).getGoalAchieveAmount()%>;
							goalTimmerStatus[<%=i%>] = 0;
					<%
						}
					%>					
					function TempSaveTimeDates(check1, check2){
						// 개인 공부시간
						var todayStudyTime = mainTimmerTime/10;
						
					
						// 그룹 공부시간
						var groupTimmerInfo = "";
						if(check1 != -99){
							groupTimmerInfo = "groupCode:" + groupTimmerCode[check1] + 
						     				  ",groupStudyTime:" + ((groupTimmerTimes[check1]/10) - groupTimmerOriginTime[check1]);
							console.log(groupTimmerInfo);
						}
						
						// 목표 공부시간
						var goalTimmerInfo = "";
						if(check2 != -99){
							goalTimmerInfo = "goalCode:" + goalTimmerCode[check2] + 
						     				  ",goalStudyTime:" + ((goalTimmerTimes[check2]/10) - goalTimmerOriginTime[check2]);
							console.log(goalTimmerInfo);
						}
				
						$.ajax({
			                  url:"blockTimesTempSave.bl",
			                  type:"post",
			                  data:{todayStudyTime:todayStudyTime-originTodayStudyTime,
			                	    groupTimmerInfo:groupTimmerInfo,
			                	    goalTimmerInfo:goalTimmerInfo
			                  },
			                  success:function(data){
			                	  console.log(data);
			                	  originTodayStudyTime = todayStudyTime; 
			                	  goalTimmerOriginTime[check2] = (goalTimmerTimes[check2]/10);
			                	  groupTimmerOriginTime[check1] = (groupTimmerTimes[check1]/10);
			                	  
			                  },
			                  error:function(){
			                     console.log("에러 발생!");
			                  }
			               })
			               return false; 
					}
					
					// 타이머 상태/버튼 컨트롤용 함수
					function startPause(division,num){
						if(division =='main'){
							if(mainTimmerStatus == 0) {
								mainTimmerStatus = 1;
								startMainTimmer();
								document.getElementById("startPause").innerHTML ="일시정지";
							} else {
								mainTimmerStatus = 0;
								var check1 = -99;
								var check2 = -99;
								for (var i = 0 ; i < <%=groupSize%> ; i ++) {
									if(groupTimmerStatus[i] == 1){
										check1 = i;
									}
									groupTimmerStatus[i] = 0;
								}
								
								for (var i = 0 ; i < <%=goalSize%> ; i ++) {
									if(goalTimmerStatus[i] == 1){
										check2 = i;
									}
									goalTimmerStatus[i] = 0;
								}
								document.getElementById("startPause").innerHTML ="공부시작";
								TempSaveTimeDates(check1, check2);
							}
						} else if ( division =='group'){
							var groupTimmerButtonName = "groupStartPause"+num
							// 기존의 실행중인 타이머인지 구분 아닐 경우 기존 실행 타이머 상태 변경
							if(executeGroupTimmerName != '' && groupTimmerButtonName != executeGroupTimmerName){
								document.getElementById(executeGroupTimmerName).innerHTML ="공부시작";
								groupTimmerStatus[originGroupTimmerIndex] = 0;
								TempSaveTimeDates(originGroupTimmerIndex, -99);
							}
							
							// 실행중인 타이머 저장
							executeGroupTimmerName = groupTimmerButtonName
							originGroupTimmerIndex = num;
							
							// 메인타이머가 컨트롤
							if(mainTimmerStatus == 0) {
								mainTimmerStatus = 1;
								startMainTimmer();
								document.getElementById("startPause").innerHTML ="일시정지";
							}

							// 그룹 타이머 컨트롤
							if(groupTimmerStatus[num] == 0 ){
								groupTimmerStatus[num] = 1;
								startGroupTimmer(num);
								document.getElementById(groupTimmerButtonName).innerHTML ="일시정지";
							} else {
								groupTimmerStatus[num] = 0;
								document.getElementById(groupTimmerButtonName).innerHTML ="공부시작";
								TempSaveTimeDates(num, -99);
							}
						}else if ( division =='goal'){
							var goalTimmerButtonName = "goalStartPause"+num
							// 기존의 실행중인 타이머인지 구분 아닐 경우 기존 실행 타이머 상태 변경
							if(executeGoalTimmerName != '' && goalTimmerButtonName != executeGoalTimmerName){
								document.getElementById(executeGoalTimmerName).innerHTML ="공부시작";
								goalTimmerStatus[originGoalTimmerIndex] = 0;
								TempSaveTimeDates(-99, originGoalTimmerIndex);
							}
							
							// 실행중인 타이머 저장
							executeGoalTimmerName = goalTimmerButtonName
							originGoalTimmerIndex = num;
							
							// 메인타이머가 컨트롤
							if(mainTimmerStatus == 0) {
								mainTimmerStatus = 1;
								startMainTimmer();
								document.getElementById("startPause").innerHTML ="일시정지";
							}

							// 목표 타이머 컨트롤
							if(goalTimmerStatus[num] == 0 ){
								goalTimmerStatus[num] = 1;
								startGoalTimmer(num);
								document.getElementById(goalTimmerButtonName).innerHTML ="일시정지";
							} else {
								goalTimmerStatus[num] = 0;
								document.getElementById(goalTimmerButtonName).innerHTML ="공부시작";
								TempSaveTimeDates(-99, num);
							}
						}
						
						
					}
					
					// 메인 타이머용 타이머 함수
					function startMainTimmer(){
						 if(mainTimmerStatus == 1){
							 setTimeout(function(){
								 mainTimmerTime++;
						 		var mainHour =  Math.floor((((mainTimmerTime/10)/60)/60)%24)
						 		var mainMins = Math.floor(((mainTimmerTime/10)/60)%60);
						 		var mainSecs = Math.floor((mainTimmerTime/10)%60);
						 		var mainTenths = mainTimmerTime % 10;
						 
						 		if(mainHour < 10) {
						 			mainHour = "0" + mainHour;
						 		}
							 	if(mainMins < 10){
							 		mainMins = "0" + mainMins;
						 		}
						 		if(mainSecs < 10){
						 			mainSecs = "0" + mainSecs;
						 		}
						 								 		
						 		document.getElementById('output').innerHTML =  mainHour + " : " + mainMins + " : " + mainSecs + " : " + "0" + mainTenths;
						 		startMainTimmer();
						 		}, 100);
						 	}
						}
					
					// 그룹 타이머용 함수
					function startGroupTimmer(num) {
						if(groupTimmerStatus[num] == 1){
							 setTimeout(function(){
								groupTimmerTimes[num]++;
						 		var groupHour =  Math.floor((((groupTimmerTimes[num]/10)/60)/60)%24)
						 		var groupMins = Math.floor(((groupTimmerTimes[num]/10)/60)%60);
						 		var groupSecs = Math.floor((groupTimmerTimes[num]/10)%60);
						 		var groupTenths = groupTimmerTimes[num] % 10;
						 
						 		if(groupHour < 10) {
						 			groupHour = "0" + groupHour;
						 		}
							 	if(groupMins < 10){
							 		groupMins = "0" + groupMins;
						 		}
						 		if(groupSecs < 10){
						 			groupSecs = "0" + groupSecs;
						 		}
						 		var groupOutputName = 'outputGroup' + num;	
						 		document.getElementById(groupOutputName).innerHTML =  groupHour + " : " + groupMins + " : " + groupSecs + " : " + "0" + groupTenths;
						 		startGroupTimmer(num);
						 		}, 100);
						 	}
					}
					
					// 목표 타이머용 타이머 함수
					function startGoalTimmer(num) {
						if(goalTimmerStatus[num] == 1){
							 setTimeout(function(){
								goalTimmerTimes[num]++;
						 		var goalHour =  Math.floor((((goalTimmerTimes[num]/10)/60)/60)%24)
						 		var goalMins = Math.floor(((goalTimmerTimes[num]/10)/60)%60);
						 		var goalSecs = Math.floor((goalTimmerTimes[num]/10)%60);
						 		var goalTenths = goalTimmerTimes[num] % 10;
						 		
						 		if(goalHour < 10) {
						 			goalHour = "0" + goalHour;
						 		}
							 	if(goalMins < 10){
							 		goalMins = "0" + goalMins;
						 		}
						 		if(goalSecs < 10){
						 			goalSecs = "0" + goalSecs;
						 		}
						 		var goalOutputName = 'outputGoal' + num;	
						 		document.getElementById(goalOutputName).innerHTML =  goalHour + " : " + goalMins + " : " + goalSecs + " : " + "0" + goalTenths;
						 		startGoalTimmer(num);
						 		}, 100);
						 	}
					}
				</script>
				</div>
				
						 		
						 		
						 		
				<div class="stopWatchArea" align="center">

					<span id="output" style="width:100px; height:50px; margin-top:50px; font-size:3em;">
					<% 
						int mHour = (int)Math.floor((((todayStudyTime)/60)/60)%24);
					   	int mMin = (int)Math.floor((todayStudyTime/60)%60);
					   	int mSec = (int)Math.floor(todayStudyTime%60);
					   	
					   	if(mHour < 10){ 
					%>
						0<%=mHour%> : 
					<%    		
					   	} else {
					%>
					   	<%=mHour%> : 
					<%    		
					   	}
					%>
					
					<% 
				   		if(mMin < 10){ 
					%>
							0<%=mMin%> : 
					<%    		
						} else {
					%>
						   <%=mMin%> : 
					<%    		
						}
					%>
					
					<% 
				   		if(mSec < 10){ 
					%>
							0<%=mSec%> : 
					<%    		
						} else {
					%>
						   <%=mSec%> : 
					<%    		
						}
					%>
					 00</span>
					 
					 	<div class="container">
						  <div class="modal fade" id="myModal" role="dialog">
						    	<div class="modal-dialog modal-sm">
						      		<div class="modal-content">
						        		<div class="modal-header">
						          			<button type="button" class="close" data-dismiss="modal">&times;</button>
						          			<h4 class="modal-title">Modal Header</h4>
						        		</div>
							        	<div class="modal-body">
							          		<p>This is a small modal.</p>
							        	</div>
							        	<div class="modal-footer">
							          		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							        	</div>
						      		</div>
						    	</div>
						 	</div>
						</div>
					 
					 
					<div id="controls" style="display:inline-block; margin-left:30px ;">
  						<button id="startPause" class="btn btn-primary" onclick="startPause('main')">공부시작</button>
  						<form action="saveStudyTime.bl" method="post" id="frm">
  							<button type="button" id="exitStopWatch" class="btn btn-danger" data-toggle="modal" data-target="#myModal" onclick="doSubmit()">종료</button>
  						</form>
  						<script type="text/javascript">
  							function doSubmit() {
  								startPause('main');
  								/* var t = 5;
  								alert("Data를 저장중입니다.. " + t);
  								setTimeout(function(){
  									t = t -1 ;
  									alert("Data를 저장중입니다.. " + t);
  								},1000) */
  								setTimeout(function(){
  									document.getElementById("frm").submit();
  								},3000);
  							}
  							
  						</script>
  					</div>
  				</div>
  				<br>
  				<br>
  				<div class="gameArea" style="border:2px solid black;background:black; height:400px; width:100%; position:relative ;overflow: hidden; border-radius:10px">
  					<% Random random = new Random();
  						ArrayList<Member> mlist = new ArrayList<Member>();
						for(int i = 0 ; i < 100 ; i ++ ){
							Member tempMember = new Member();
							tempMember.setMember_Id("user"+i);
							tempMember.setMember_Age(random.nextInt(100));
							mlist.add(tempMember);
						}
						int[] rank = new int[mlist.size()];
						// 등수 구하기
						for(int i = 0 ; i < mlist.size(); i ++){
							rank[i] = 1; 
							for(int j = 0 ; j < mlist.size(); j ++){
								if(mlist.get(i).getMember_Age()< mlist.get(j).getMember_Age()){
									rank[i] ++ ;
								}
							}
							
							
						}
						
						for( int i =0 ; i < mlist.size(); i++){
							int size = (int)(20*((100 -(((double)rank[i]/(double)mlist.size())*100))*0.01));
							int x = random.nextInt(100);
							int y = random.nextInt(100);
							
							if(mlist.get(i).getMember_Id().equals("user1")){
						%>
							<img src="resources/images/block/star2.jpg" style="top:49%; left:49%; position:absolute; width:<%=size%>px;height:<%=size%> px">
						<% 
							} else {
						%>
  							<img src="resources/images/block/star.jpg" style="top:<%=x%>%; left:<%=y%>%; position:absolute; width:<%=size%>px;height:<%=size%> px">
						<%	}
						}
  					%>
  				
  				</div>
			</div>
		</div>
		<div class="contentDiv col-xs-12 col-md-4" style="margin-top : 50px;">
		<div style="height:250px; widht:100%">
			
			<c:if test="${groupSize eq 0}">
				가입된 그룹이 없습니다.
			</c:if>
			<c:if test="${groupSize ne 0}">
				그룹 리스트
				<ul>
	  					<c:forEach var="group" items="<%=groupList %>" varStatus="index">
	  						<li>${group.studyGroup_Name }
	  						<br>
	  							<span id="outputGroup${index.index }" style="width:100px; height:50px; margin-top:50px; font-size:2em;">
	  								<fmt:parseNumber var="gHour" integerOnly="true" value="${Math.floor(((group.groupTotalStudyTime/60)/60)%24)}"/>
	  								<fmt:parseNumber var="gMin" integerOnly="true" value="${Math.floor((group.groupTotalStudyTime/60)%60)}"/>
	  								<fmt:parseNumber var="gSec" integerOnly="true" value="${Math.floor(group.groupTotalStudyTime%60)}"/>
	  								
	  								<c:if test="${gHour lt 10}">
	  									0<c:out value="${gHour }"/> :
	  								</c:if>
	  								<c:if test="${gHour ge 10}">
	  									<c:out value="${gHour }"/> :
	  								</c:if>
	  								
	  								<c:if test="${gMin lt 10}">
	  									0<c:out value="${gMin }"/> :
	  								</c:if>
	  								<c:if test="${gMin ge 10}">
	  									 <c:out value="${gMin }"/> :
	  								</c:if>
	  								
	  								<c:if test="${gSec lt 10}">
	  									0<c:out value="${gSec}"/> :
	  								</c:if>
	  								<c:if test="${gSec ge 10}">
	  									<c:out value="${gSec }"/> :
	  								</c:if>
	  								00
	  								   
	  								
	  							</span>
								<div id="controls" style="display:inline-block; margin-left:30px;">
	  								<button id="groupStartPause${index.index }" class="btn btn-primary" onclick="startPause('group',${index.index })">공부시작</button>
	  							</div>
	  						</li>
	  					</c:forEach>
				</ul>
			</c:if>
		</div>

			<div class="hovereffect" style="height:200px; widht:100%">
	            <div class="overlay">
	                <h2 >Block Settings</h2>
	                <p class="set1">
	                    <a href="showProgram.bl">
	                        <i class="fa fa-desktop" style="margin-right:10px"></i>
	                    </a>
	                    <a href="showWeb.bl">
	                        <i class="fa fa-tasks" style="margin-left:10px"></i>
	                    </a>
	                </p>
	                <hr>
	                <hr>
	                <p class="set2">
	                    <a href="showSchedule.bl">
	                        <i class="fa fa-calendar" style="margin-right:10px"></i>
	                    </a>
	                    <a href="showLocation.bl">
	                        <i class="fa fa-road" style="margin-left:10px"></i>
	                    </a>
	                </p>
	            </div>
	    	</div>
	    	
	    	<div style="height:200px; widht:100%">
	    		<a>
	    			<img src="resources/images/block/Advertising.jpg" style="height:100%; width:100%">
	    		</a>
	    	</div>
	    </div>
		<div class="contentDiv col-xs-12 col-md-4" " >
			<div align="right">
			<img src="resources/images/block/goal.png" style="width:80% ; height:750px" >
			</div>
			일정 리스트
			<ul>
				<c:forEach var="goal" items="<%=goalList %>" varStatus="index">
	  				<li>${goal.goalContent }
	  				<br>
	  					<span id="outputGoal${index.index }" style="width:100px; height:50px; margin-top:50px; font-size:2em;">
	  					
	  								<fmt:parseNumber var="gHour" integerOnly="true" value="${Math.floor(((goal.goalAchieveAmount/60)/60)%24)}"/>
	  								<fmt:parseNumber var="gMin" integerOnly="true" value="${Math.floor((goal.goalAchieveAmount/60)%60)}"/>
	  								<fmt:parseNumber var="gSec" integerOnly="true" value="${Math.floor(goal.goalAchieveAmount%60)}"/>
	  								
	  								<c:if test="${gHour lt 10}">
	  									0<c:out value="${gHour }"/> :
	  								</c:if>
	  								<c:if test="${gHour ge 10}">
	  									<c:out value="${gHour }"/> :
	  								</c:if>
	  								
	  								<c:if test="${gMin lt 10}">
	  									0<c:out value="${gMin }"/> :
	  								</c:if>
	  								<c:if test="${gMin ge 10}">
	  									 <c:out value="${gMin }"/> :
	  								</c:if>
	  								
	  								<c:if test="${gSec lt 10}">
	  									0<c:out value="${gSec}"/> :
	  								</c:if>
	  								<c:if test="${gSec ge 10}">
	  									<c:out value="${gSec }"/> :
	  								</c:if>
	  								00
	  								</span>
						<div id="controls" style="display:inline-block; margin-left:30px ;">
	  						<button id="goalStartPause${index.index }" class="btn btn-primary" onclick="startPause('goal',${index.index })">공부시작</button>
	  					</div>
	  				</li>
	  			</c:forEach>
	  		</ul>
		</div>
	</div>
</body>
</html>