<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.adminContentArea {
	width: 1584px;
	float: left;
}

.leftSideArea {
	width: 250px;
}
.adminBody {
	width: 1334px;
	float: left;
	background: white;
}
.content{
		float:left;
		width:1330px;
		height:1000px;
		padding-left:20px;
		padding-top:20px;
}
hr{
	border-top: 1px solid gray !important;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
</head>
<body>
	<div class="adminArea">
		<div class="headerArea">
			<jsp:include page="../header.jsp"></jsp:include>
		</div>
		<div class="adminContentArea">
			<div class="leftSideArea">
				<jsp:include page="../sidemenu.jsp"></jsp:include>
			</div>
			<div class="adminBody">
				<div class="content">
					<h2>접속자통계</h2>
					<hr>
					<div class="first-row">
						<div class="first" style="float:left; width:33%; height: 140px; text-align:center; border-right-style: groove">
						어제의 접속자 수<br>
						<span style="font-size:100px"><c:out value="${data.yesterdayContact[0].COUNT}"></c:out></span>명
						</div>
						<div class="second" style="float:left; width:33%; height: 140px; text-align:center; border-right-style: groove">
						오늘의 접속자 수<br>
						<span style="font-size:100px"><c:out value="${data.todayContact[0].COUNT}"></c:out></span>명
						</div>
						<div class="third" style="float:left; width:33%; height: 140px; text-align:center;">
						누적 접속자 수<br>
						<span style="font-size:100px"><c:out value="${data.totalContact[0].COUNT}"></c:out></span>명
						</div>
					</div>
					<hr class="bottom" style="width:1330px;float:left;">
					<div class="second-row" style="float:left; margin-top:100px">
						<div class="second-first" style="width:500px; height:400px; margin-left:100px; float:left;">
							<canvas id="times">
						</canvas>
						<script type="text/javascript">
							$(function(){
								var ctx = document.getElementById("times").getContext('2d');
								var dat1 = ${data.contactByTime[0].ONE};
								var dat2 = ${data.contactByTime[0].TWO};
								var dat3 = ${data.contactByTime[0].THREE};
								var dat4 = ${data.contactByTime[0].FOUR};
								var dat5 = ${data.contactByTime[0].FIVE};
								var dat6 = ${data.contactByTime[0].SIX};
								var dat7 = ${data.contactByTime[0].SEVEN};
								var dat8 = ${data.contactByTime[0].EIGHT};
								var dat9 = ${data.contactByTime[0].NINE};
								var dat10 = ${data.contactByTime[0].TEN};
								var dat11 = ${data.contactByTime[0].ELEVEN};
								var dat12 = ${data.contactByTime[0].TWELVE};
								var dat13 = ${data.contactByTime[0].THIRTEEN};
								var dat14 = ${data.contactByTime[0].FOURTEEN};
								var dat15 = ${data.contactByTime[0].FIFTEEN};
								var dat16 = ${data.contactByTime[0].SIXTEEN};
								var dat17 = ${data.contactByTime[0].SEVENTEEN};
								var dat18 = ${data.contactByTime[0].EIGHTEEN};
								var dat19 = ${data.contactByTime[0].NINETEEN};
								var dat20 = ${data.contactByTime[0].TWENTY};
								var dat21 = ${data.contactByTime[0].TWENTYONE};
								var dat22 = ${data.contactByTime[0].TWENTYTWO};
								var dat23 = ${data.contactByTime[0].TWENTYTHREE};
								var dat24 = ${data.contactByTime[0].TWENTYFOUR};
								var pieChart = new Chart(ctx, {
								type: 'pie',
								data: {
									labels: ['1시','2시','3시','4시','5시','6시','7시',
											'8시','9시','10시','11시','12시','13시','14시',
											'15시','16시','17시','18시','19시','20시','21시',
											'22시','23시','00시'],
									datasets: [{
											//label: '# of Votes',
											data: [dat1,dat2,dat3,dat4,dat5,dat6,dat7,dat8,
												dat9,dat10,dat11,dat12,dat13,dat14,dat15,dat16,
												dat17,dat18,dat19,dat20,dat21,dat22,dat23,dat24],
												backgroundColor: [
													'rgba(255, 99, 132, 0.2)',
													'rgba(54, 162, 235, 0.2)',
													'rgba(255, 99, 132, 0.2)',
													'rgba(54, 162, 235, 0.2)',
													'rgba(255, 206, 86, 0.2)',
													'rgba(75, 192, 192, 0.3)',
													'rgba(153, 102, 255, 0.3)',
													'rgba(255, 99, 132, 0.3)',
													'rgba(255, 50, 132, 0.3)',
													'rgba(54, 15, 235, 0.7)',
													'rgba(155, 99, 132, 0.7)',
													'rgba(54, 162, 235, 0.7)',
													'rgba(255, 206, 86, 0.7)',
													'rgba(75, 192, 192, 0.5)',
													'rgba(153, 102, 255, 0.5)',
													'rgba(255, 99, 132, 0.5)',
													'rgba(125, 99, 132, 0.5)',
													'rgba(54, 162, 235, 0.5)',
													'rgba(255, 99, 132, 0.5)',
													'rgba(54, 162, 235, 0.4)',
													'rgba(255, 206, 86, 0.4)',
													'rgba(75, 192, 192, 0.4)',
													'rgba(153, 102, 255, 0.4)',
													'rgba(255, 29, 132, 0.4)'
													]
											}]
									},
									options: {
									   title: {
									            display: true,
									            text: '시간대별 접속자 수',
									            fontSize: 20
									        },
										legend: {display: true,}
									}
								})
							});
						</script>
						</div>
						<div class="second-second"style="width:500px; height:400px; margin-left:50px; float:left;">
						<canvas id="zebal" height="300px"></canvas>
						<script type="text/javascript">
							$(function(){
								var ctx1 = document.getElementById("zebal").getContext('2d');
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
									            fontSize: 20
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
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>