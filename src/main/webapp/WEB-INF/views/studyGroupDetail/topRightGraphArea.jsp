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

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

<style>

</style>
</head>

<body>
	<div class="graphAreaWrap">
		<div class="graphArea">
			<canvas id="weelyStudyTimeAvg" width="280px" height="210px"></canvas>
		</div>
	</div>	
</body>

<script type="text/javascript">
	$(function(){
		var groupAvg = document.getElementById("weelyStudyTimeAvg").getContext('2d');
		
		var grSun = 30;
		var grMon = 20;
		var grTue = 100;
		var grWed = 60;
		var grThu = 24;
		var grFri = 72.555555;
		var grSat = 96.3;
		
		var mySun = 75;
		var myMon = 44.333;
		var myTue = 255;
		var myWed = 80;
		var myThu = 90.00;
		var myFri = 6;
		var mySat = 3;
		
/* 		var grSun = ${data.CPCandCPPprofit[0].JAN};
		var grMon = ${data.CPCandCPPprofit[0].FEB};
		var grTue = ${data.CPCandCPPprofit[0].MAR};
		var grWed = ${data.CPCandCPPprofit[0].APR};
		var grThu = ${data.CPCandCPPprofit[0].MAY};
		var grFri = ${data.CPCandCPPprofit[0].JUNE};
		var grSat = ${data.CPCandCPPprofit[0].JUL};
		
		var mySun = ${data.CPCandCPPprofit[0].AUG};
		var myMon = ${data.CPCandCPPprofit[0].SEP};
		var myTue = ${data.CPCandCPPprofit[0].OCT};
		var myWed = ${data.CPCandCPPprofit[0].NOV};
		var myThu = ${data.CPCandCPPprofit[0].DEC};
		var myFri = ${data.CPCandCPPprofit[1].JAN};
		var mySat = ${data.CPCandCPPprofit[1].FEB}; */
		
		var lineChart = new Chart(groupAvg, {
		type: 'line',
		data: {
			labels: [ 'SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT' ],
			datasets: [ { 
							label: '그룹원 평균',
							data: [ grSun, grMon, grTue, grWed, grThu, grFri, grSat ],
							fill: false,
							borderColor : 'rgba(0, 160, 233, 1)',
							borderWidth : 1,
							lineTension : 0,
							fontSize : 11,
							fontStyle : 'bold',
							fontColor : 'rgb(0, 0, 0)',
							radius : 1.5
						},
						{ 
							label: '내 공부량',
							data: [ mySun, myMon, myTue, myWed, myThu, myFri, mySat ],
							fill: false,
							borderColor : 'rgba(68, 61, 59, 1)',
							borderWidth : 1,
							lineTension : 0,
							fontSize : 11,
							fontStyle : 'bold',
							fontColor : 'rgba(0, 0, 0, 1)',
							radius : 1.5
						
						} ]
		},
			options: {
						title: {
								display : true,
								text : '그룹 주간 공부량 평균',
								fontSize : 15,
								fontStyle : 'bold',
								fontColor : 'rgba(0, 0, 0, 1)'
						}							      
			}
		})
	});
</script>

</html>

