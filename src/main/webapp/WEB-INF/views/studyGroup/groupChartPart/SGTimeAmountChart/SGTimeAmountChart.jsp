<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<style>
	.timeAmountChartArea {
		width:1200px;
		text-align:center;
		margin:0 auto;
		margin-top:20px;
		margin-bottom:20px;
	}
	.timeAmountChartArea h4 {
		color: #999999;
		background:#F3F3F3;
		padding-top: 10px;
    	padding-bottom: 10px;
	}
	.timeAmountChartPart {
		display:inline-block;
	}
	.timeAmountChartInfo {
		font-size: 18px;
	}
	.timeAmountChartInfo p {
		display:inline-block;
		width:100%;
		margin: 0px;
		text-align:left;
		font-size: 14px;
	}
	.timeAmountChartInfo i {
		font-size:12px;
	}
	.chartInfoUp {
		color: red;
	}
	.chartInfoDown {
		color: blue;
	}
	.chartInfoSame {
	
	}
	.timeAmountChartDiv {
		
	}
	.chartDay {
	    font-size: 12px;
	    margin-top:10px;
	}
</style>
<script type="text/javascript">
	google.load("visualization", "1", {packages : [ 'corechart', 'timeline' ]});
	google.setOnLoadCallback(drawTimeAmountChart);

	function drawTimeAmountChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'hour', 'Total', 'In' ], 
				[ '0', 10, 20 ],
				[ '1', 20, 3 ], 
				[ '2', 30, 40 ],
				[ '3', 40, 59 ],
				[ '4', 10, 20 ],
				[ '5', 20, 3 ], 
				[ '6', 30, 40 ],
				[ '7', 40, 59 ],
				[ '8', 33, 32 ],
				[ '9', 40, 54 ],
				[ '10', 10, 23 ],
				[ '11', 20, 11 ],
				[ '12', 30, 1 ],
				[ '13', 40, 0 ],
				[ '14', 50, 23 ],
				[ '15', 5, 23 ],
				[ '16', 22, 45 ],
				[ '17', 33, 50 ],
				[ '18', 44, 1 ],
				[ '19', 55, 23 ],
				[ '20', 55, 24 ],
				[ '21', 44, 55 ],
				[ '22', 33, 59 ],
				[ '23', 44, 59 ],
				[ '24', 0, 0 ]
		]);

		var options = {
			height : 200,
			width : 390,
			legend: {position: 'bottom', textStyle: {fontSize: 16}, maxLines:2}
		};

		var chartToday = new google.visualization.LineChart(document.getElementById('timeAmountToday_div'));
		var chartWeek = new google.visualization.LineChart(document.getElementById('timeAmountWeek_div'));
		var chartMonth = new google.visualization.LineChart(document.getElementById('timeAmountMonth_div'));
		chartToday.draw(data, options);
		chartWeek.draw(data, options);
		chartMonth.draw(data, options);
	}
</script>
</head>
<body>
	<div class="timeAmountChartArea">
		<h4>접속 스터디 그룹 통계</h4>
		<div class="timeAmountChartPart">
			<div class="timeAmountChartInfo">
				<p><i>42분 </i><i class="chartInfoUp">▲ </i> 10%</p>
			</div>
			<div class="timeAmountChartDiv" id="timeAmountToday_div"></div>
			<div class="chartDay">
				오늘
			</div>
		</div>
		<div class="timeAmountChartPart">
			<div class="timeAmountChartInfo">
				<p><i>121분 </i><i class="chartInfoDown">▼ </i> 49%</p>
			</div>
			<div class="timeAmountChartDiv" id="timeAmountWeek_div"></div>
			<div class="chartDay">
				이번 주
			</div>
		</div>
		<div class="timeAmountChartPart">
			<div class="timeAmountChartInfo">
				<p><i>51분 </i><i class="chartInfoDown">▼ </i> 49%</p>
			</div>
			<div class="timeAmountChartDiv" id="timeAmountMonth_div"></div>
			<div class="chartDay">
				이번 달
			</div>
		</div>
	</div>
</body>
</html>