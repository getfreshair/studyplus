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

<head>
<script>
	var ing = false;
	window.onbeforeunload = function(){
		if(!ing){
			alert("bye!!");
		}
	}
</script>
<link rel="stylesheet" href="/studyplus/resources/css/custom.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/style.css">
<script src="/studyplus/resources/js/Nwagon.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<!-- #### datepicker #### -->
<link rel="stylesheet" href="/studyplus/resources/css/datepicker.min.css">
<script src="/studyplus/resources/js/datepicker.min.js"></script>
<script src="/studyplus/resources/js/datepicker.ko.js"></script>

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
  color: white;
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
  width: 12%;
  opacity: 0;
  filter: alpha(opacity=0);
  border: 1px solid white;
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
  color: white;
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


	
	.mainDiv{
		
		position: absolute;
		top:0;
		left:0;
		background:url("resources/images/block/background.jpg") 50% no-repeat; 
		/* background-image :url(resources/images/block/background.jpg); */
		background-repeat:repeat;
		background-size:cover;
		background-attachment:fixed;
		width:100%;
		height:1200px;
		z-index:-20;
	}
	
	.mainDiv:after {
		content:"";
		position: absolute;
		top:0;
		left:0;
		background-size:cover;
		width:100%;
		height:1200px;
		background-color:black;
		opacity: 0.5;
		z-index:-10;
	} 
	 .contentDiv{
		height:800px;
	} 
	
	
	@font-face {
    font-family: 'BebasNeueRegular';
    src: url('BebasNeue-webfont.eot');
    src: url('BebasNeue-webfont.eot?#iefix') format('embedded-opentype'),
         url('BebasNeue-webfont.woff') format('woff'),
         url('BebasNeue-webfont.ttf') format('truetype'),
         url('BebasNeue-webfont.svg#BebasNeueRegular') format('svg');
    font-weight: normal;
    font-style: normal;
}

.container {
    width: 960px;
    margin: 0 auto;
    overflow: hidden;
}

.clock {
	margin-top:100px;
    width:500px;
    color: #fff;
    margin-left:auto;
}

#Date {
    font-family: 'BebasNeueRegular', Arial, Helvetica, sans-serif;
    font-size: 25px;
    text-align: center;
    text-shadow: 0 0 5px #00c6ff;
    display:inline-block;
}

.dateUl {
    width: 120px;
    margin: 0 auto;
    padding: 0px;
    list-style: none;
    text-align: center;
    display:inline-block;
}

.dateUl li {
    display: inline;
    font-size: 1.8em;
    text-align: center;
    font-family: 'BebasNeueRegular', Arial, Helvetica, sans-serif;
    text-shadow: 0 0 5px #00c6ff;
}

#point {
    position: relative;
    -moz-animation: mymove 1s ease infinite;
    -webkit-animation: mymove 1s ease infinite;
    padding-left: 10px;
    padding-right: 10px;
}

/* Simple Animation */
@-webkit-keyframes mymove {
    0% {opacity: 1.0;
    text-shadow: 0 0 20px #00c6ff;
}

50% {
    opacity: 0;
    text-shadow: none;
}

100% {
    opacity: 1.0;
    text-shadow: 0 0 20px #00c6ff;
}	
}

@-moz-keyframes mymove {
    0% {
        opacity: 1.0;
        text-shadow: 0 0 20px #00c6ff;
    }

    50% {
        opacity: 0;
        text-shadow: none;
    }

    100% {
        opacity: 1.0;
        text-shadow: 0 0 20px #00c6ff;
    };
}
</style>

<script type="text/javascript">
$(function(){
	
var f11 = jQuery.Event("keydown",{keyCode : 122});
$(this).trigger(f11);
})
$(document).ready(function() {
// Create two variable with the names of the months and days in an array
var monthNames = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]; 
var dayNames= ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]

// Create a newDate() object
var newDate = new Date();
// Extract the current date from Date object
newDate.setDate(newDate.getDate());
// Output the day, date, month and year   
$('#Date').html(dayNames[newDate.getDay()] + " " + newDate.getDate() + ' ' + monthNames[newDate.getMonth()] + ' ' + newDate.getFullYear());

setInterval( function() {
	// Create a newDate() object and extract the seconds of the current time on the visitor's
	var seconds = new Date().getSeconds();
	// Add a leading zero to seconds value
	$("#sec").html(( seconds < 10 ? "0" : "" ) + seconds);
	},1000);
	
setInterval( function() {
	// Create a newDate() object and extract the minutes of the current time on the visitor's
	var minutes = new Date().getMinutes();
	// Add a leading zero to the minutes value
	$("#min").html(( minutes < 10 ? "0" : "" ) + minutes);
    },1000);
	
setInterval( function() {
	// Create a newDate() object and extract the hours of the current time on the visitor's
	var hours = new Date().getHours();
	// Add a leading zero to the hours value
	$("#hours").html(( hours < 10 ? "0" : "" ) + hours);
    }, 1000);	
});
</script>
</head>
<!-- <script>
//일간 공부량 날짜 변경시
function todayChartChangeDate(){
	/*$("#todayDatePicker").change(function(){
		console.log("체인지가 안먹힌다?")
		var dateVal = $("#todayDatePicker").val(); //컨트롤러에 보낼 날짜
		console.log("선택한날짜 : " + dateVal);
		todayChart(dateVal);
	});*/
	
	$("#todayDatePicker").click(function(){
		$(".datepicker:nth-child(1) .datepicker--cell-day").click(function(){
			var dateVal = $(this).attr("data-year") + "-" + (($(this).attr("data-month")*1) +1) + "-" + $(this).attr("data-date");
			//console.log("선택한날짜 : " + dateVal);
			$('#todayDatePicker').attr("value",dateVal);
			todayChart(dateVal);
		});
	});
}

//일간 공부량 차트
function todayChart(dateVal){
	var ctx = document.getElementById("todayChart").getContext('2d');
	//console.log("input의 값은 들어오나?" + dateVal)
	$.ajax({
		url : "studyPlannerTodayChart.sp",
		data : {dateVal : dateVal},
		type : "post",
		success : function(data) {
			//console.log("일간공부량 데이터" + data);
			var arr;
			arr = data.split(",");
			
			for(var i = 0; i < arr.length; i++){
				arr[i] = arr[i]/60;
			}
			
			var todayChart = new Chart(ctx, {
				type: 'bar',
				data: {
					labels: ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", 
						"13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"],
						datasets: [{
							//label: '# of Votes',
							data: [arr[0], arr[1], arr[2], arr[3], arr[4], arr[5], arr[6], arr[7], arr[8], arr[9], arr[10], arr[11], arr[12],
								arr[13], arr[14], arr[15], arr[16], arr[17], arr[18], arr[19], arr[20], arr[21], arr[22], arr[23]],
								backgroundColor: [
									'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(255, 159, 64, 0.2)',
									'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(255, 159, 64, 0.2)',
									'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									]
						}]
				},
				options: {
					legend: {display: false,},
					events: [false],
					scales: {
						yAxes: [{
							ticks: {
								beginAtZero:true
							}
						}]
					}
				}
			});

		},
		error : function() {
			console.log("에러발생!");
		}
	});

}
</script> -->
<body>	
	<div class="mainDiv">
	<!-- <div id="clock" class="dark" style="background-color:transparent !important">
		<div class="display">
			<div class="weekdays"></div>
			<div class="ampm"></div>
			<div class="alarm"></div>
			<div class="digits"></div>
		</div>
	</div> -->
		
	
		<div class="contentDiv col-xs-12 col-md-9" style="height:800px">
		
			<!-- <div class="profileDiv" style="width:90%; height:150px; margin-top:50px ; margin-left:50px ">
				<img src="resources/images/block/profile.jpg" style="border-radius:70px">
				<span style="font-size:2em; font-weight: bold; margin:20px; color:orangered ">오늘의 적은 어제의 나 </span> -->
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
								//document.getElementById("startPause").innerHTML ="일시정지";
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
								/* document.getElementById(executeGroupTimmerName).innerHTML ="공부시작"; */
								$(executeGroupTimmerName).attr("src","resources/block/pause.png");
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
								/* document.getElementById(groupTimmerButtonName).innerHTML ="일시정지";  */
								document.getElementById(groupTimmerButtonName).src ="resources/block/pause.png";
							} else {
								groupTimmerStatus[num] = 0;
								/* document.getElementById(groupTimmerButtonName).innerHTML ="공부시작"; */
								document.getElementById(groupTimmerButtonName).src ="resources/block/play.png";
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
						 								 		
						 		document.getElementById('output').innerHTML =  mainHour + " : " + mainMins + " : " + mainSecs;
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
						 		document.getElementById(groupOutputName).innerHTML =  groupHour + " : " + groupMins + " : " + groupSecs ;
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
						 		document.getElementById(goalOutputName).innerHTML =  goalHour + " : " + goalMins + " : " + goalSecs ;
						 		startGoalTimmer(num);
						 		}, 100);
						 	}
					}
				</script>
				<!-- </div> -->
				
						 		
				<div>
					<div class="clock" style="margin-right:200px">
				  	<ul class="dateUl">
					      <li id="hours"></li>
					      <li id="point">:</li>
					      <li id="min"></li>
				  	</ul>
					<div id="Date"></div>
					</div>
				<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
				<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.0.0/moment.min.js"></script>
				<script src="resources/js/script.js"></script>		
				<div style="margin-left:auto; margin-right:200px" class="stopWatchArea" align="right">
					<span id="output" style="margin-left:auto; width:100px; height:50px; font-size:7em;text-shadow: 0 0 5px #00c6ff; color:white">
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
							0<%=mSec%>
					<%    		
						} else {
					%>
						   <%=mSec%>
					<%    		
						}
					%>
					 </span>
					</div>
				
					 
					<!-- <div id="controls" style="margin-left:30px ;">
					
  						<button id="startPause" class="btn btn-primary" onclick="startPause('main')">공부시작</button>
  						<form action="saveStudyTime.bl" method="post" id="frm">
  							<button type="button" id="exitStopWatch" class="btn btn-danger" onclick="doSubmit()">종료</button>
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
  					</div> -->
  				</div>
  				<br>
  				<div style="position:relative;margin-top:120px" >
  				<div class="gameArea" style="margin-left:70px;border:2px solid black;background:black; height:400px; width:400px; position:relative ;overflow: hidden; border-radius:300px; display:inline-block; border:5px solid">
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
  				<img alt="" src="resources/images/block/ship.gif" style="z-index:10000;position:absolute;width:50%;margin-top:310px;margin-left:100px;">
  				</div>
  				<c:choose>
						<c:when test="${sessionScope.loginUser.member_Job eq '01' }">
							<c:set var="jobName" value="무직"></c:set>
						</c:when>
						<c:when test="${sessionScope.loginUser.member_Job eq '02' }">
							<c:set var="jobName" value="학생"></c:set>
						</c:when>
						<c:when test="${sessionScope.loginUser.member_Job eq '03' }">
							<c:set var="jobName" value="언론"></c:set>
						</c:when>
						<c:when test="${sessionScope.loginUser.member_Job eq '04' }">
							<c:set var="jobName" value="공무원"></c:set>
						</c:when>
						<c:when test="${sessionScope.loginUser.member_Job eq '05' }">
							<c:set var="jobName" value="군인"></c:set>
						</c:when>
						<c:when test="${sessionScope.loginUser.member_Job eq '06' }">
							<c:set var="jobName" value="서비스업"></c:set>
						</c:when>
						<c:when test="${sessionScope.loginUser.member_Job eq '07' }">
							<c:set var="jobName" value="교육"></c:set>
						</c:when>
						<c:when test="${sessionScope.loginUser.member_Job eq '08' }">
							<c:set var="jobName" value="금융/증권/보험업"></c:set>
						</c:when>
						<c:when test="${sessionScope.loginUser.member_Job eq '09' }">
							<c:set var="jobName" value="유통업"></c:set>
						</c:when>
						<c:when test="${sessionScope.loginUser.member_Job eq '10' }">
							<c:set var="jobName" value="예술"></c:set>
						</c:when>
						<c:when test="${sessionScope.loginUser.member_Job eq '11' }">
							<c:set var="jobName" value="의료"></c:set>
						</c:when>
						<c:when test="${sessionScope.loginUser.member_Job eq '12' }">
							<c:set var="jobName" value="법률"></c:set>
						</c:when>
						<c:when test="${sessionScope.loginUser.member_Job eq '13' }">
							<c:set var="jobName" value="건설업"></c:set>
						</c:when>
						<c:when test="${sessionScope.loginUser.member_Job eq '14' }">
							<c:set var="jobName" value="제조업"></c:set>
						</c:when>
						<c:when test="${sessionScope.loginUser.member_Job eq '15' }">
							<c:set var="jobName" value="부동산업"></c:set>
						</c:when>
						<c:when test="${sessionScope.loginUser.member_Job eq '16' }">
							<c:set var="jobName" value="운송업"></c:set>
						</c:when>
						<c:when test="${sessionScope.loginUser.member_Job eq '17' }">
							<c:set var="jobName" value="농/수/임/광산업"></c:set>
						</c:when>
						<c:when test="${sessionScope.loginUser.member_Job eq '18' }">
							<c:set var="jobName" value="가사"></c:set>
						</c:when>
						<c:otherwise>
							<c:set var="jobName" value="기타"></c:set>
						</c:otherwise>
					</c:choose>
						<span style="color:white;position:absolute;top:30px; left:430px;" >현재 ${jobName} 공부 유저  :  <span style="color:#f27553 ; font-size:1.5em">00 </span>명</span><br>
						<span style="color:white;position:absolute; top:80px; left:480px;">현재 ${sessionScope.loginUser.location_Name }지역 공부 유저  :  <span style="color:#f27553; font-size:1.5em">00 </span>명</span>
						<div class="hovereffect" style="display:inline-block;height:200px;  position:absolute;left:200px; top:150px">
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
			</div>
			</div>
		<div class="contentDiv col-xs-12 col-md-3 side_area">
		<div class="user_info" style="margin-top:20px">
							<div class="img_area">
								<img src="/studyplus/resources/upload/member/thumbnail/${ loginUser.member_Files.files_Name }" alt="study plus logo" style="width:100%;">
							</div>
							<div class="right_area">
								<p>안녕하세요,</p>
								<p class="name">${ loginUser.member_Nickname }님 환영합니다.</p>
							</div>
							<span class="rank_link" onclick="rankLink()" title="나의 랭킹보기">
								<p class="rank">지역랭킹 : 상위 1% &nbsp;&nbsp; 분야 랭킹 : 상위 73%</p>
								<p class="need">식물 Lv. </p>
							</span>
						</div>
						<!-- 오늘의목표 -->
						<div class="today_goals" style="height:42%">
							<div class="box_tit">
								<span class="txt">오늘의 목표</span>
								<span class="sub">Today's Goals</span>
							</div>
							<div class="scroll_wrap">
								<div class="scroll_area">
							
										<ul class="goals_list" style="width:100%">
				<c:forEach var="goal" items="<%=goalList %>" varStatus="index">
	  				<li ><p style="	margin-bottom: 5px;
    								font-weight: bold;
    								width: 90%;
								    display: inline-block;
								    color:black;
								    white-space: nowrap;
								    overflow: hidden;
								    text-overflow: ellipsis;">${goal.goalContent }</p>
	  				<br>
	  					<span id="outputGoal${index.index }" style="width:100px; height:50px; margin-top:50px; font-size: 13px;
    color: #6d6d6d;
    font-weight: bold;">
	  					
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
	  									0<c:out value="${gSec}"/> 
	  								</c:if>
	  								<c:if test="${gSec ge 10}">
	  									<c:out value="${gSec }"/> 
	  								</c:if>
	  							
	  								</span>
						<div id="controls" style="display:inline-block; margin-left:30px ;">
	  						<button id="goalStartPause${index.index }" style="border:none; background:white ; position:absolute; top:20%; right:2%" onclick="startPause('goal',${index.index })"><img src="resources/images/block/play.png" style="width:40px; height:40px"></button>
	  					</div>
	  				</li>
	  			</c:forEach>
	  		</ul>
									</ul>
<!-- 									<div class="add_btn">
										<a href="#" data-toggle="modal" data-target="#insertTodayModal"></a>
									</div> -->
								</div>
							</div>
						</div>
						<!-- // 오늘의목표 -->
						<!-- 이번주목표 -->
						<div class="weekly_goals"  style="height:42%; margin-top:5px">
							<div class="box_tit">
								<span class="txt">그룹 목표</span>
								<span class="sub">GroupGoals</span>
							</div>
							<div class="scroll_area">
					
			<c:if test="${groupSize ne 0}">
				
				<ul class="goals_list">
	  					<c:forEach var="group" items="<%=groupList %>" varStatus="index">
	  						<li><p style="	margin-bottom: 5px;
    								font-weight: bold;
    								width: 90%;
								    display: inline-block;
								    color:black;
								    white-space: nowrap;
								    overflow: hidden;
								    text-overflow: ellipsis;">${group.studyGroup_Name }</p>
	  						<br>
	  							<span id="outputGroup${index.index }" style="width:100px; height:50px; margin-top:50px; font-size: 13px;
    color: #6d6d6d;
    font-weight: bold;">
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
	  									0<c:out value="${gSec}"/> 
	  								</c:if>
	  								<c:if test="${gSec ge 10}">
	  									<c:out value="${gSec }"/> 
	  								</c:if>
	  								
	  							</span>
								<div id="controls" style="display:inline-block; margin-left:30px;">
	  								<button id="groupStartPause${index.index }" style="border:none; background:white ; position:absolute; top:20%; right:2%" onclick="startPause('group',${index.index })"><img src="resources/images/block/play.png" style="width:40px; height:40px"></button>
	  							</div>
	  						</li>
	  					</c:forEach>
				</ul>
			</c:if>
									
								</ul>
<!-- 								<div class="add_btn">
									<a href="#" data-toggle="modal" data-target="#insertWeeklyModal"></a>
								</div> -->
							</div>
						</div>
						<!-- // 이번주목표 -->
	<%-- 	<div style="height:250px; widht:100%">
			<c:if test="${groupSize eq 0}">
										가입된 그룹이 없습니다.
									</c:if>
			
			<c:if test="${groupSize ne 0}">
				
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

			
	    	
	    	<div style="height:200px; widht:100%">
	    		<a>
	    			<img src="resources/images/block/Advertising.jpg" style="height:100%; width:100%">
	    		</a>
	    	</div>
	   
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
	  		</ul> --%>
		</div>
		
		<div class="col-xs-12 col-md-12" style="height:80px; ">
			<form action="saveStudyTime.bl" method="post" style="position:relative;"id="frm" >
  				<button type="button" id="exitStopWatch" style="position:absolute;left:50%;margin-left:-250px;height:40px;margin-top:25px;border:1px solid #f1bc3c;border-radius:40px 40px 0 0;background:#f1bc3c;width:500px; color:white"class="btn btn-danger" onclick="doSubmit()">차단을 해제하고, 공부 휴식 취하기</button>
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
  		</div></div>
</body>
</html>