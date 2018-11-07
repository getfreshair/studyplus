<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style>
	.timeZoneChartArea {
		width:1200px;
		text-align:center;
		margin:0 auto;
		margin-top:20px;
		margin-bottom:20px;
	}
	.timeZoneChartArea h4{
		color: #999999;
		background:#F3F3F3;
		padding-top: 10px;
    	padding-bottom: 10px;
    	margin-top: 50px;
	}
</style>
<script type="text/javascript">
	google.charts.load("current", {packages : [ 'corechart', 'timeline' ]});
	google.charts.setOnLoadCallback(drawTimeZoneChart);
	
	function drawTimeZoneChart() {
		var container = document.getElementById('timeZoneChartDiv');
		var chart = new google.visualization.Timeline(container);
		var dataTable = new google.visualization.DataTable();
		
		dataTable.addColumn({
			type : 'string',
			id : 'Room'
		});
		dataTable.addColumn({
			type : 'string',
			id : 'Name'
		});
		dataTable.addColumn({
			type : 'date',
			id : 'Start'
		});
		dataTable.addColumn({
			type : 'date',
			id : 'End'
		});
		dataTable.addRows([
				[ 'Study Time', 'user01', new Date(0, 0, 0, 00, 00, 00), new Date(0, 0, 0, 1, 00, 00) ],
				[ 'Study Time', 'user02', new Date(0, 0, 0, 02, 30, 0), new Date(0, 0, 0, 7, 20, 0) ],
				[ 'Study Time', 'user03', new Date(0, 0, 0, 12, 10, 0), new Date(0, 0, 0, 16, 23, 5) ],
				[ 'Study Time', 'user04', new Date(0, 0, 0, 12, 4, 0), new Date(0, 0, 0, 13, 1, 50) ],
				[ 'Study Time', 'user04', new Date(0, 0, 0, 13, 1, 50), new Date(0, 0, 0, 14, 20, 50) ],
				[ 'Study Time', 'user05', new Date(0, 0, 0, 13, 30, 0), new Date(0, 0, 0, 18, 23, 50) ],
				[ 'Study Time', 'user06', new Date(0, 0, 0, 18, 2, 0), new Date(0, 0, 0, 24, 0, 0) ]
		]);

		var options = {
			timeline : {
				showRowLabels : false
			},
			avoidOverlappingGridLines : false
		};

		chart.draw(dataTable, options);
	}
</script>
</head>
<body>
	<div class="timeZoneChartArea">
		<h4>접속 스터디 그룹 공부 시간대</h4>
		<div id="timeZoneChartDiv"></div>
	</div>
</body>
</html>