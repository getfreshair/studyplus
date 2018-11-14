<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.content{
		float:left;
		width:1330px;
		height:1000px;
	}
	.row1{
		padding:10px;
		width:100%;
		height:300px;
	}
	.row2{
		padding:10px;
		width:100%;
		height:300px;
	}
	.row3{
		padding:10px;
		width:100%;
		height:600px;
	}
	.chart1{
		padding:10px;
		height:200px;
		width:651px;
		float:left;
		margin-left:50px;
	}
	.chart2{
		padding:10px;
		height:200px;
		width:651px;
		float:left;
		margin-left:80px;
	}
	.chart3{
		padding:10px;
		height:200px;
		width:651px;
		float:left;
		margin-left:50px;
	}
	.chart4{
		padding:10px;
		height:200px;
		width:651px;
		float:left;
		margin-left:80px;
	}
	.calender{
		padding:10px;
		width:1302px;
		height:590px;
		background:orange;
		float:left;
	}
</style>
</style>
</head>
<body>
	<div class="content">
		<div class="row1">
			<div class="chart1" style="height:200px; width:500px">
				<canvas id="zebal"style="float:left;" ></canvas>
						<script type="text/javascript">
							$(function(){
								var ctx = document.getElementById("zebal").getContext('2d');
								var data1 = ${data.categoryMemberList[0].COUNT};
								var data2 = ${data.categoryMemberList[1].COUNT};
								var data3 = ${data.categoryMemberList[2].COUNT};
								var data4 = ${data.categoryMemberList[3].COUNT};
								var data5 = ${data.categoryMemberList[4].COUNT};
								var data6 = ${data.categoryMemberList[5].COUNT};
								var data7 = ${data.categoryMemberList[6].COUNT};
								var data8 = ${data.categoryMemberList[7].COUNT};
								var monthlyChart = new Chart(ctx, {
								type: 'bar',
								data: {
									labels: ['대입','기타','공시','취준','고입','외국어','자격증','기타'],
										datasets: [{
											//label: '# of Votes',
											data: [data1,data2,data3,data4,data5,data6,data7,data8],
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
													]
											}]
									},
									options: {
									   title: {
									            display: true,
									            text: '카테고리별 회원 수',
									            fontSize: 17
									        },
										legend: {display: false},
								
										scales: {
											yAxes: [{
												ticks: {
													beginAtZero:true
												}
											}]
										}
									}
								});
							});
						</script>
			</div>
			<div class="chart2" style="height:200px; width:500px">
					 	<canvas id="maleAndFemale"></canvas>
							<script type="text/javascript">
							$(function(){
								var ctx3 = document.getElementById("maleAndFemale").getContext('2d');
								var da1 = ${data.femaleGroupList[0].GROUP_FEMALE};
								var da2 = ${data.femaleGroupList[1].GROUP_FEMALE};
								var da3 = ${data.maleGroupLIst[0].GROUP_MALE};
								var da4 = ${data.maleGroupLIst[1].GROUP_MALE};
								
								var stackChart = new Chart(ctx3, {
								type: 'bar',
								data: {
									labels: ['여성','남성'],
									datasets: [
											{
												data: [da2-da1,da4-da3],
												backgroundColor: 
													['rgba(255, 99, 132, 0.2)',
													'rgba(54, 162, 235, 0.2)']
											},
											{
												data: [da1,da3],
												backgroundColor: 
													['rgba(255,99,132,1)',
													'rgba(255, 159, 64, 0.2)']
											}]
									},
									options: {
									   title: {
									            display: true,
									            text: '남여별 그룹스터디 이용',
									            fontSize: 17
									        },
									    legend: {display: false,},
										scales: {
									            xAxes: [{
									                stacked: true
									            }],
									            yAxes: [{
									                stacked: true
									            }]
									    }
									}
								})
							});
						</script>
			</div>
		</div>
		<div class="row2">
			<div class="chart3"style="height:200px; width:500px">
				<canvas id="chart3" ></canvas>
						<script type="text/javascript">
							$(function(){
								var ctx1 = document.getElementById("chart3").getContext('2d');
								var data1 = ${data.contactByDay[0].MON};
								var data2 = ${data.contactByDay[0].TUE};
								var data3 = ${data.contactByDay[0].WED};
								var data4 = ${data.contactByDay[0].THUR};
								var data5 = ${data.contactByDay[0].FRI};
								var data6 = ${data.contactByDay[0].SAT};
								var data7 = ${data.contactByDay[0].SUN};
								var monthlyChart = new Chart(ctx1, {
								type: 'horizontalBar',
								data: {
									labels: ['월','화','수','목','금','토','일'],
										datasets: [{
											//label: '# of Votes',
											data: [data1,data2,data3,data4,data5,data6,data7],
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
													]
											}]
									},
									options: {
									   title: {
									            display: true,
									            text: '요일별 접속자 수',
									            fontSize: 17
									        },
										legend: {display: false,},
										scales: {
											yAxes: [{
												ticks: {
													beginAtZero:true
												}
											}]
										}
									}
								})
							});
						</script>
			</div>
			<div class="chart4"style="height:200px; width:500px">
				<canvas id="CPPCPC" ></canvas>
						<script type="text/javascript">
							$(function(){
								var ctx4 = document.getElementById("CPPCPC").getContext('2d');
								
								var dat1 = ${data.CPCandCPPprofit[0].JAN};
								var dat2 = ${data.CPCandCPPprofit[0].FEB};
								var dat3 = ${data.CPCandCPPprofit[0].MAR};
								var dat4 = ${data.CPCandCPPprofit[0].APR};
								var dat5 = ${data.CPCandCPPprofit[0].MAY};
								var dat6 = ${data.CPCandCPPprofit[0].JUNE};
								var dat7 = ${data.CPCandCPPprofit[0].JUL};
								var dat8 = ${data.CPCandCPPprofit[0].AUG};
								var dat9 = ${data.CPCandCPPprofit[0].SEP};
								var dat10 = ${data.CPCandCPPprofit[0].OCT};
								var dat11 = ${data.CPCandCPPprofit[0].NOV};
								var dat12 = ${data.CPCandCPPprofit[0].DEC};
								
								var dat21 = ${data.CPCandCPPprofit[1].JAN};
								var dat22 = ${data.CPCandCPPprofit[1].FEB};
								var dat23 = ${data.CPCandCPPprofit[1].MAR};
								var dat24 = ${data.CPCandCPPprofit[1].APR};
								var dat25 = ${data.CPCandCPPprofit[1].MAY};
								var dat26 = ${data.CPCandCPPprofit[1].JUNE};
								var dat27 = ${data.CPCandCPPprofit[1].JUL};
								var dat28 = ${data.CPCandCPPprofit[1].AUG};
								var dat29 = ${data.CPCandCPPprofit[1].SEP};
								var dat30 = ${data.CPCandCPPprofit[1].OCT};
								var dat31 = ${data.CPCandCPPprofit[1].NOV};
								var dat32 = ${data.CPCandCPPprofit[1].DEC};
								
								var lineChart = new Chart(ctx4, {
								type: 'line',
								data: {
									labels: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
									datasets: [
										{
											label: 'CPC',
											data: [dat21,dat22,dat23,dat24,dat25,dat26,dat27,dat28,dat29,dat30,dat31,dat32],
											fill: false,
											borderColor: 'rgba(255, 102, 255, 0.6)',
											lineTension: 0
										},{
											label: 'CPP',
											data: [dat1,dat2,dat3,dat4,dat5,dat6,dat7,dat8,dat9,dat10,dat11,dat12],
											fill: false,
											borderColor:'rgba(0, 255, 86, 0.6)',
											lineTension:0
										
										}
											]
								},
									options: {
									   title: {
									            display: true,
									            text: 'CPP/CPC 광고수익비교',
									            fontSize: 17
									        }
									}
								})
							});
						</script>
			</div>
		</div>
		<div class="row3">
			<iframe src="https://calendar.google.com/calendar/embed?src=9deovuh0f0najb8lp02am6rta8%40group.calendar.google.com&ctz=Australia%2FPerth" style="border: 0" width="1302" height="600" frameborder="0" scrolling="no"></iframe>
		</div>
	</div>
	
</body>
</html>