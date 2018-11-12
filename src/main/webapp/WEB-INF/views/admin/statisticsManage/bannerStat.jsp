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
					<h2>광고통계</h2>
					<hr>
					<div class="first-row">
						<div class="first" style="float:left; width:33%; height: 140px; text-align:center; border-right-style: groove">
						이번달 광고매출액<br>
						<span style="font-size:50px;margin-top:50px"><c:out value="${data.thisMonthBanner[0].THISMONTH}"></c:out></span>원
						</div>
						<div class="second" style="float:left; width:33%; height: 140px; text-align:center; border-right-style: groove">
						등록된 광고 수<br>
						<span style="font-size:100px;"><c:out value="${data.postBanner[0].COUNT}"></c:out></span>건
						</div>
						<div class="third" style="float:left; width:33%; height: 140px; text-align:center;">
						총 누적 매출액<br>
						<span style="font-size:50px;margin-top:50px"><c:out value="${data.totalProfit[0].TOTAL}"></c:out></span>원
						</div>
					</div>
					<hr class="bottom" style="width:1330px;float:left;">
					<div class="second-row" style="width:1330px;float:left;">
						<div class="second-first" style="width:400px; height:400px; margin-left:100px; float:left;">
						<canvas id="category">
						</canvas>
						<script type="text/javascript">
							$(function(){
								var ctx = document.getElementById("category").getContext('2d');
								var dat1 = ${data.categoryProfit[0].GONGSI};
								var dat2 = ${data.categoryProfit[0].CHIJUN};
								var dat3 = ${data.categoryProfit[0].GUITAR};
								var dat4 = ${data.categoryProfit[0].DAEIP};
								var dat5 = ${data.categoryProfit[0].FOREIGN};
								var dat6 = ${data.categoryProfit[0].JAGUK};
								var dat7 = ${data.categoryProfit[0].GOIP};
								var dat8 = ${data.categoryProfit[0].GOSI};
								
								var doughnutChart = new Chart(ctx, {
								type: 'pie',
								data: {
									labels: ['공시','취준','기타','대입','외국어','자격증','고입','고시'],
									datasets: [{
											//label: '# of Votes',
											data: [dat1,dat2,dat3,dat4,dat5,dat6,dat7,dat8],
												backgroundColor: [
													'rgba(255, 99, 132, 0.2)',
													'rgba(54, 162, 235, 0.2)',
													'rgba(255, 99, 132, 0.2)',
													'rgba(54, 162, 235, 0.2)',
													'rgba(255, 206, 86, 0.2)',
													'rgba(75, 192, 192, 0.2)',
													'rgba(153, 102, 255, 0.2)',
													'rgba(255, 99, 132, 0.2)'
													]
											}]
									},
									options: {
									   title: {
									            display: true,
									            text: '카테고리별 광고수익',
									            fontSize: 20
									        },
										legend: {display: true,}
									}
								})
							});
						</script>
						</div>
						<div class="second-second"style="width:500px; height:500px; margin-left:100px; margin-top:100px; float:left;">
							<canvas id="CPPCPC">
							</canvas>
						<script type="text/javascript">
							$(function(){
								var ctx1 = document.getElementById("CPPCPC").getContext('2d');
								
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
								
								var lineChart = new Chart(ctx1, {
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
									            fontSize: 20
									        }
									}
								})
							});
						</script>
						</div>
					</div>
				<!-- 	<div class="third-row" style="width:1330px;float:left;">
						<div class="third-first"style="width:1100px; height:300px; background:green;margin-left:100px; margin-top:50px; float:left;"></div>
					</div> -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>