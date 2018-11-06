<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<style>
	.locationChartArea {
		width:1200px;
		text-align:center;
		margin:0 auto;
		margin-top:20px;
		margin-bottom:20px;
	}
	.locationChartArea h1 {
		color: white;
		background:black;
		padding-top: 10px;
    	padding-bottom: 10px;
    	margin-top: 50px;
	}
	.locationChartPart {
		display:inline-block;
	}
	.locationChartInfo {
		font-size: 18px;
	}
	.locationChartInfo p {
		display:inline-block;
		width:100%;
		margin: 0px;
		text-align:left;
		font-size: 14px;
	}
	.locationChartInfo i {
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
	.locationChartDiv {
		
	}
	.chartDay {
	    font-size: 25px;
	    font-weight: bolder;
	}
</style>
<script type="text/javascript">
	google.load("visualization", "1", {packages : [ "corechart" ]});
	google.setOnLoadCallback(drawLocationChart);

	function drawLocationChart() {
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

		var chartToday = new google.visualization.LineChart(document.getElementById('locationToday_div'));
		var chartWeek = new google.visualization.LineChart(document.getElementById('locationWeek_div'));
		var chartMonth = new google.visualization.LineChart(document.getElementById('locationMonth_div'));
		chartToday.draw(data, options);
		chartWeek.draw(data, options);
		chartMonth.draw(data, options);
	}
</script>
</head>
<body>
	<div class="locationChartArea">
		<h1>StudyGroup Location Statistic</h1>
		<div class="locationChartPart">
			<div class="locationChartInfo">
				<p><i>42분 </i><i class="chartInfoUp">▲ </i> 10%</p>
				<p><i>100분 </i><i class="chartInfoDown">▼ </i> 49%</p>
			</div>
			<div class="locationChartDiv" id="locationToday_div"></div>
			<div class="chartDay">
				Today
			</div>
		</div>
		<div class="locationChartPart">
			<div class="locationChartInfo">
				<p><i>43분 </i><i class="chartInfoUp">▲ </i> 10%</p>
				<p><i>121분 </i><i class="chartInfoDown">▼ </i> 49%</p>
			</div>
			<div class="locationChartDiv" id="locationWeek_div"></div>
			<div class="chartDay">
				This Week
			</div>
		</div>
		<div class="locationChartPart">
			<div class="locationChartInfo">
				<p><i>33분 </i><i class="chartInfoUp">▲ </i> 10%</p>
				<p><i>51분 </i><i class="chartInfoDown">▼ </i> 49%</p>
			</div>
			<div class="locationChartDiv" id="locationMonth_div"></div>
			<div class="chartDay">
				This Month
			</div>
		</div>
	</div>
</body>
</html>