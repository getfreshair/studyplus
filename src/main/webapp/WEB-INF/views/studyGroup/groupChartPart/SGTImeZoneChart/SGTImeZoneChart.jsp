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
		
		
		$.ajax({
			url : 'selectSGtimeZoneChart.sg',
			data : {
				studygroup_Code : '${code}',
			},
			success : function(data){
				var container = document.getElementById('timeZoneChartDiv');
				var chart = new google.visualization.Timeline(container);
				var dataTable = new google.visualization.DataTable([]);
				
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
				
				var dataRow = new Array();
				
				for(var key in data){
					var STUDYTIME_STARTHH = data[key].STUDYTIME_STARTHH;
					var STUDYTIME_STARTMI = data[key].STUDYTIME_STARTMI;
					var STUDYTIME_STARTSS = data[key].STUDYTIME_STARTSS;
					var STUDYTIME_ENDHH = data[key].STUDYTIME_ENDHH;
					var STUDYTIME_ENDMI = data[key].STUDYTIME_ENDMI;
					var STUDYTIME_ENDSS = data[key].STUDYTIME_ENDSS;
					
					dataRow = ['Study Time', data[key].MEMBER_NICKNAME, new Date(0, 0, 0, STUDYTIME_STARTHH, STUDYTIME_STARTMI, STUDYTIME_STARTSS), new Date(0, 0, 0, STUDYTIME_ENDHH, STUDYTIME_ENDMI, STUDYTIME_ENDSS)];
					
					dataTable.addRows([dataRow]);					
				}

				var options = {
					timeline : {
						showRowLabels : false
					},
					avoidOverlappingGridLines : false
				};

				chart.draw(dataTable, options);
			}
		});
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