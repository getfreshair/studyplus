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
</style>
<script type="text/javascript">
	google.charts.load("current", {packages : [ "timeline" ]});
	google.charts.setOnLoadCallback(drawTimeZoneChart);
	
	function drawTimeZoneChart() {
		var container = document.getElementById('example7.1');
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
				[ 'Magnolia Room', 'Google Charts', new Date(0, 0, 0, 0, 4, 0), new Date(0, 0, 0, 8, 23, 5) ],
				[ 'Magnolia Room', 'App Engine', new Date(0, 0, 0, 2, 30, 0), new Date(0, 0, 0, 7, 20, 0) ] 
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
		<div id="example7.1" style="height: 200px;"></div>
	</div>
</body>
</html>