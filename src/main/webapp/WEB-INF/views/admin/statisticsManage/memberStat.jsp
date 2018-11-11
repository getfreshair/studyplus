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
	background: #F0F0F0;
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
<!-- <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> -->
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
					<h2>회원통계</h2>
					<hr>
					<div class="first-row">
						<div class="first" id="todayJoinMemberList" style="float:left; width:33%; height: 140px; text-align:center; border-right-style: groove">
						오늘의 가입자 수<br>
						<span style="font-size:100px"><c:out value="${data.todayJoinMemberList[0].COUNT}"></c:out></span>명
						</div>
						<div class="second" style="float:left; width:33%; height: 140px; text-align:center; border-right-style: groove">
						제재회원 수<br>
						<span style="font-size:100px"><c:out value="${data.totalPenaltyMemberList[0].COUNT}"></c:out></span>명
						</div>
						<div class="third" style="float:left; width:33%; height: 140px; text-align:center;">
						총 가입자 수<br>
						<span style="font-size:100px"><c:out value="${data.totalMemberList[0].COUNT}"></c:out></span>명
						</div>
					</div>
					<hr class="bottom" style="width:1330px;float:left;">
					<!-- <div class="second-row" id="zebal" > -->
					<div class="chart" style=" float:left; height:250px; width:70%;" >
						<canvas id="zebal"style="float:left; height:250px; width:70%;margin-left: 200px;" ></canvas>
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
									            fontSize: 20
									        },
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
							});
								
								
						
						</script>
					</div>
					<div class="third-row" id="good"style="float:left; height:250px; width:70%; margin-top:50px">
					<canvas id="good222"style="float:left; height:250px; width:70%;margin-left: 200px;" ></canvas>
						<script type="text/javascript">
						$(function(){
							var ctx2 = document.getElementById("good222").getContext('2d');
						
							var dat1 = ${data.joinMemberMonth[0].JAN};
							var dat2 = ${data.joinMemberMonth[0].FEB};
							var dat3 = ${data.joinMemberMonth[0].MAR};
							var dat4 = ${data.joinMemberMonth[0].APR};
							var dat5 = ${data.joinMemberMonth[0].MAY};
							var dat6 = ${data.joinMemberMonth[0].JUNE};
							var dat7 = ${data.joinMemberMonth[0].JUL};
							var dat8 = ${data.joinMemberMonth[0].AUG};
							var dat9 = ${data.joinMemberMonth[0].SEP};
							var dat10 = ${data.joinMemberMonth[0].OCT};
							var dat11 = ${data.joinMemberMonth[0].NOV};
							var dat12 = ${data.joinMemberMonth[0].DEC};
							
							var monthlyChart2 = new Chart(ctx2, {
								type: 'bar',
								data: {
									labels: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
										datasets: [{
											//label: '# of Votes',
											data: [dat1,dat2,dat3,dat4,dat5,dat6,dat7,dat8,dat9,dat10,dat11,dat12],
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
									            text: '월별 회원가입 수',
									            fontSize: 20
									        },
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
						})
						</script>
					</div>
				<!-- 	<div class="forth-row" style="background:red;float:left; height:250px; width:70%;margin-left: 200px;">
					
					</div> -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>