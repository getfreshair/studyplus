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
					<h2>스터디그룹통계</h2>
					<hr>
					<div class="first-row">
						<div class="first" style="float:left; width:33%; height: 140px; text-align:center; border-right-style: groove">
						오늘 만들어진 그룹<br>
						<span style="font-size:100px"><c:out value="${data.todayCreateGroupList[0].COUNT}"></c:out></span>그룹
						</div>
						<div class="second" style="float:left; width:33%; height: 140px; text-align:center; border-right-style: groove">
						오늘 없어진 그룹<br>
						<span style="font-size:100px"><c:out value="${data.todayCloseGroupList[0].COUNT}"></c:out></span>그룹
						</div>
						<div class="third" style="float:left; width:33%; height: 140px; text-align:center;">
						전체 그룹 수<br>
						<span style="font-size:100px"><c:out value="${data.totalGroupList[0].COUNT}"></c:out></span>그룹
						</div>
					</div>
					<hr class="bottom" style="width:1330px;float:left;">
					<div class="second-row">
						<div class="second-first" style="width:500px; height:300px; margin-left:100px; float:left;">
						<canvas id="category">
						</canvas>
						</div>
							<script type="text/javascript">
							$(function(){
								var ctx = document.getElementById("category").getContext('2d');
								var data1 = ${data.categoryGroupList[0].DAEIP};
								var data2 = ${data.categoryGroupList[0].GOSI};
								var data3 = ${data.categoryGroupList[0].GONGSI};
								var data4 = ${data.categoryGroupList[0].CHIJUN};
								var data5 = ${data.categoryGroupList[0].GOIP};
								var data6 = ${data.categoryGroupList[0].FOREIGN};
								var data7 = ${data.categoryGroupList[0].JAGUK};
								var data8 = ${data.categoryGroupList[0].GUITAR};
								var monthlyChart = new Chart(ctx, {
								type: 'bar',
								data: {
									labels: ['대입','고시','공시','취준','고입','외국어','자격증','기타'],
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
									            text: '카테고리별 그룹 수',
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
						<div class="second-second"style="width:500px; height:300px;margin-left:100px; float:left;">
							<canvas id="maleAndFemale">
							</canvas>
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
													'rgba(54, 162, 235, 1)']
											}]
									},
									options: {
									   title: {
									            display: true,
									            text: '남여별 그룹스터디 이용',
									            fontSize: 20
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
					<div class="third-row" style="width:1330px;float:left;">
						<div class="third-first" style="width:400px; height:400px; margin-left:450px;float:left;">
					<%-- 	<span>${data.weekGroupBoardList[0].BOARD}</span>
						<span>${data.weekGroupBoardList[1].BOARD}</span> --%>
						<canvas id="board">
						</canvas>
						</div>
							<script type="text/javascript">
							$(function(){
								var ctx2 = document.getElementById("board").getContext('2d');
								var dat1 = ${data.weekGroupBoardList[0].BOARD};
								var dat2 = ${data.weekGroupBoardList[1].BOARD};
								
								var doughnutChart = new Chart(ctx2, {
								type: 'doughnut',
								data: {
									labels: ['댓글','게시물'],
									datasets: [{
											//label: '# of Votes',
											data: [dat1,dat2],
												backgroundColor: [
													'rgba(255, 99, 132, 0.2)',
													'rgba(54, 162, 235, 0.2)',
													]
											}]
									},
									options: {
									   title: {
									            display: true,
									            text: '일주일간 댓글/게시물 수',
									            fontSize: 20
									        },
										legend: {display: true,}
									}
								})
							});
						</script>
						</div>
						<!-- <div class="third-second"style="width:500px; height:300px; background:green;margin-left:100px; margin-top:50px; float:left;"></div> -->
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>