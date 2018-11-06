<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<style>
	.categoryChartArea {
		width:1200px;
		text-align:center;
		margin:0 auto;
	}
	.categoryChartPart {
		display:inline-block;
	}
	.categoryChartInfo {
	}
	.categoryChartInfo P {
		display:inline-block;
		width:100%;
		margin: 0px;
		text-align:left;
	}
	.categoryChartDiv {
		
	}
</style>
<script type="text/javascript">
	google.load("visualization", "1", {packages : [ "corechart" ]});
	google.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'hour', 'Toal', 'In' ], 
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
			title : 'SG Today Category Statistic',
			height : 200,
			width : 350
		};

		var chartToday = new google.visualization.LineChart(document.getElementById('categoryToday_div'));
		var chartWeek = new google.visualization.LineChart(document.getElementById('categoryWeek_div'));
		var chartMonth = new google.visualization.LineChart(document.getElementById('categoryMonth_div'));
		chartToday.draw(data, options);
		chartWeek.draw(data, options);
		chartMonth.draw(data, options);
	}
</script>
</head>
<body>
	<div class="categoryChartArea">
		<h2>SG Today Category Statistic</h2>
		<div class="categoryChartPart">
			<div class="categoryChartInfo">
				<p><i>1,220분</i>▼10%</p>
				<p><i>2,220분</i>▲49%</p>
			</div>
			<div class="categoryChartDiv" id="categoryToday_div"></div>
		</div>
		<div class="categoryChartPart">
			<div class="categoryChartInfo">
				<p>▼10%</p>
				<p>▲49%</p>
			</div>
			<div class="categoryChartDiv" id="categoryWeek_div"></div>
		</div>
		<div class="categoryChartPart">
			<div class="categoryChartInfo">
				<p>▼10%</p>
				<p>▲49%</p>
			</div>
			<div class="categoryChartDiv" id="categoryMonth_div"></div>
		</div>
	</div>
</body>
</html>