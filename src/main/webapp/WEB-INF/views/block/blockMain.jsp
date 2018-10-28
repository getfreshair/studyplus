<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, always.awake.studyplus.member.model.vo.*, java.io.*,java.lang.Process" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	int groupSize = 2;
	int goalSize = 2;
%>
<%-- <%
	// 디렉토리 체크
	String path1 = "C:\\studyPlanner";
	File dir1 = new File(path1);
	
	String path2 = "C:\\studyPlanner\\timmerDatas";
	File dir2 = new File(path2);
	if(!dir1.isDirectory()){
		dir1.mkdir();
		
	}
	if(!dir2.isDirectory()){
		dir2.mkdir();
	}
	
	// 오늘 날짜로 파일 생성
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdf.format(new Date());
	File file = new File("C:\\studyPlanner\\timmerDatas\\"+today+".txt");
	
	if(!file.exists()){
		file.createNewFile();
	} else {
		BufferedReader br = new BufferedReader(new FileReader(file));
		String datas= "";
		String times ="";
		while((datas = br.readLine()) != null){
			times = datas;
		}
		System.out.println(times);
		br.close();
		String[] timesArr = times.split("/");
		int mainTimmerTime = Integer.parseInt(timesArr[0].substring(timesArr[0].indexOf(":")+1));
		int groupTimmerTime = Integer.parseInt(timesArr[1].substring(timesArr[0].indexOf(":")+1));
		int goalTimmerTime = Integer.parseInt(timesArr[2].substring(timesArr[0].indexOf(":")+1));
		
	}
	
	// DB에서 받아온 리스트 사이즈로 변경 할 것!!!!!!!!
	int groupSize = 2;
	int goalSize = 3;
%> --%>
<!DOCTYPE html>
<html>
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
		background :url("resources/images/test.jpg") 50% no-repeat;
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
				<img src="resources/images/profile.jpg" style="border-radius:70px">
				<span style="font-size:2em; font-weight: bold; margin:20px; color:orangered ">오늘의 적은 어제의 나 </span>
				<script>
					// 메인타이머 초기화
					var mainTimmerTime = 0;  				// 메인컨트롤 타이머용 시간
					var mainTimmerStatus = 0;				// 메인컨트롤 타이머 상태 
					
					// 그룹용 타이머 초기화
					var groupTimmerTimes = new Array();		// 그룹 타이머의 시간
					var groupTimmerStatus = new Array(); 	// 그룹 타이머의 상태
					var executeGroupTimmerName = '';		// 실행중인 그룹타이머 이름
					var originGroupTimmerIndex = 0;			// 실행중인 그룹타이머 인덱스
					// 그룹용 타이머 배열 초기화
					for (var i = 0 ; i < <%=groupSize%> ; i ++) {
						groupTimmerTimes[i] = 0;
						groupTimmerStatus[i] = 0;
					}
					
					// 목표용 타이머 초기화
					var goalTimmerTimes = new Array();		// 목표 타이머의 시간
					var goalTimmerStatus = new Array(); 	// 목표 타이머의 상태
					var executeGoalTimmerName = '';		// 실행중인  목표타이머 이름
					var originGoalTimmerIndex = 0;			// 실행중인 그룹타이머 인덱스
					
					// 목표용 타이머 배열 초기화
					for (var i = 0 ; i < <%=goalSize%> ; i ++) {
						goalTimmerTimes[i] = 0;
						goalTimmerStatus[i] = 0;
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
								for (var i = 0 ; i < <%=groupSize%> ; i ++) {
									groupTimmerStatus[i] = 0;
								}
								
								for (var i = 0 ; i < <%=goalSize%> ; i ++) {
									goalTimmerStatus[i] = 0;
								}
								document.getElementById("startPause").innerHTML ="공부시작";
							}
						} else if ( division =='group'){
							var groupTimmerButtonName = "groupStartPause"+num
							// 기존의 실행중인 타이머인지 구분 아닐 경우 기존 실행 타이머 상태 변경
							if(executeGroupTimmerName != '' && groupTimmerButtonName != executeGroupTimmerName){
								document.getElementById(executeGroupTimmerName).innerHTML ="공부시작";
								groupTimmerStatus[originGroupTimmerIndex] = 0;
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

							// 그룹 타이머 컨틀로 
							if(groupTimmerStatus[num] == 0 ){
								groupTimmerStatus[num] = 1;
								startGroupTimmer(num);
								document.getElementById(groupTimmerButtonName).innerHTML ="일시정지";
							} else {
								groupTimmerStatus[num] = 0;
								document.getElementById(groupTimmerButtonName).innerHTML ="공부시작";
							}
						}else if ( division =='goal'){
							var goalTimmerButtonName = "goalStartPause"+num
							// 기존의 실행중인 타이머인지 구분 아닐 경우 기존 실행 타이머 상태 변경
							if(executeGoalTimmerName != '' && goalTimmerButtonName != executeGoalTimmerName){
								document.getElementById(executeGoalTimmerName).innerHTML ="공부시작";
								goalTimmerStatus[originGoalTimmerIndex] = 0;
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

							// 그룹 타이머 컨틀로 
							if(goalTimmerStatus[num] == 0 ){
								goalTimmerStatus[num] = 1;
								startGoalTimmer(num);
								document.getElementById(goalTimmerButtonName).innerHTML ="일시정지";
							} else {
								goalTimmerStatus[num] = 0;
								document.getElementById(goalTimmerButtonName).innerHTML ="공부시작";
							}
						}
						
						
					}
					
					// 메인 타이머용 타이머 함수
					function startMainTimmer(){
						 if(mainTimmerStatus == 1){
							 setTimeout(function(){
								 mainTimmerTime++;
						 		var mainHour =  Math.floor(((mainTimmerTime/10)/60)/60)
						 		var mainMins = Math.floor((mainTimmerTime/10)/60);
						 		var mainSecs = Math.floor(mainTimmerTime/10);
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
						 		var groupHour =  Math.floor(((groupTimmerTimes[num]/10)/60)/60)
						 		var groupMins = Math.floor((groupTimmerTimes[num]/10)/60);
						 		var groupSecs = Math.floor(groupTimmerTimes[num]/10);
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
						 		var goalHour =  Math.floor(((goalTimmerTimes[num]/10)/60)/60)
						 		var goalMins = Math.floor((goalTimmerTimes[num]/10)/60);
						 		var goalSecs = Math.floor(goalTimmerTimes[num]/10);
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
					<span id="output" style="width:100px; height:50px; margin-top:50px; font-size:3em;">00 : 00 : 00 : 00</span>
					<div id="controls" style="display:inline-block; margin-left:30px ;">
  						<button id="startPause" class="btn btn-primary" onclick="startPause('main')">공부시작</button>
  						<button id="exitStopWatch" class="btn btn-danger">종료</button>
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
							<img src="resources/images/star2.jpg" style="top:49%; left:49%; position:absolute; width:<%=size%>px;height:<%=size%> px">
						<% 
							} else {
						%>
  							<img src="resources/images/star.jpg" style="top:<%=x%>%; left:<%=y%>%; position:absolute; width:<%=size%>px;height:<%=size%> px">
						<%	}
						}
  					%>
  				
  				</div>
			</div>
		</div>
		<div class="contentDiv col-xs-12 col-md-4" style="margin-top : 50px;">
		<div style="height:250px; widht:100%">
			그룹 리스트
			<ul>
				<li>서울대가 목표! <br>
				<span id="outputGroup0" style="width:100px; height:50px; margin-top:50px; font-size:2em;">00 : 00 : 00 : 00</span>
				<div id="controls" style="display:inline-block; margin-left:30px ;">
  						<button id="groupStartPause0" class="btn btn-primary" onclick="startPause('group',0)">공부시작</button>
  					</div></li>
				<li>책책책 책을 읽읍시다 <br>
					<span id="outputGroup1" style="width:100px; height:50px; margin-top:50px; font-size:2em;">00 : 00 : 00 : 00</span>
					<div id="controls" style="display:inline-block; margin-left:30px ;">
  						<button id="groupStartPause1" class="btn btn-primary" onclick="startPause('group',1)">공부시작</button>
  					</div></li>
			</ul>
		</div>

			<div class="hovereffect" style="height:200px; widht:100%">
	            <div class="overlay">
	                <h2 >Block Settings</h2>
	                <p class="set1">
	                    <a href="#">
	                        <i class="fa fa-desktop" style="margin-right:10px"></i>
	                    </a>
	                    <a href="#">
	                        <i class="fa fa-tasks" style="margin-left:10px"></i>
	                    </a>
	                </p>
	                <hr>
	                <hr>
	                <p class="set2">
	                    <a href="#">
	                        <i class="fa fa-calendar" style="margin-right:10px"></i>
	                    </a>
	                    <a href="#">
	                        <i class="fa fa-road" style="margin-left:10px"></i>
	                    </a>
	                </p>
	            </div>
	    	</div>
	    	
	    	<div style="height:200px; widht:100%">
	    		<a>
	    			<img src="resources/images/Advertising.jpg" style="height:100%; width:100%">
	    		</a>
	    	</div>
	    </div>
		<div class="contentDiv col-xs-12 col-md-4" " >
			<div align="right">
			<img src="resources/images/goal.png" style="width:80% ; height:750px" >
			</div>
			일정 리스트
			<ul>
				<li>영단어 1천자 ( 1시간 ) <br>
				<span id="outputGoal0" style="width:100px; height:50px; margin-top:50px; font-size:2em;">00 : 00 : 00 : 00</span>
				<div id="controls" style="display:inline-block; margin-left:30px ;">
  						<button id="goalStartPause0" class="btn btn-primary" onclick="startPause('goal',0)">공부시작</button>
  					</div></li>
				<li>건축학개론 ( 2시간 ) <br>
					<span id="outputGoal1" style="width:100px; height:50px; margin-top:50px; font-size:2em;">00 : 00 : 00 : 00</span>
					<div id="controls" style="display:inline-block; margin-left:30px ;">
  						<button id="goalStartPause1" class="btn btn-primary" onclick="startPause('goal',1)">공부시작</button>
  					</div></li>
			</ul>
		</div>
	</div>
</body>
</html>