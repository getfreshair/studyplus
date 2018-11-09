<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<style>
	.timeAmountChartPart {
		display:inline-block;
		width:390px;
		height:277px;
	}
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
	.timeAmountInfoUp {
		color: red;
		font-size: 14px;
	}
	.timeAmountInfoDown {
		color: blue;
		font-size: 14px;
	}
	.timeAmountInfoSame {
		color: black;
		font-size: 14px;
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
		$.ajax({
			url : 'selectSGTimeAmountChart.sg',
			data : {
				studygroup_Code : '${code}',
				period : 'today'
			},
			success : function(data){
				
				for(var type in data){
					if(type == 'chartValue'){
						$timeAmountSGP = $('<p>').append('접속 그룹 : ');
						$timeAmountSGP.append($('<i class="cym">').append(data[type][0].MESG_GAPTIME + '분'));
						
						if(data[type][0].MESG_GAPTIME_PERCENT > 0){
							$timeAmountSGP.append($('<i class="timeAmountInfoUp">').append('▲'));
						}else if(data[type][0].MESG_GAPTIME_PERCENT < 0){
							$timeAmountSGP.append($('<i class="timeAmountInfoDown">').append('▼'));
						}else{
							$timeAmountSGP.append($('<i class="timeAmountInfoSame">').append('-'));
						}
						
						$timeAmountSGP.append(data[type][0].MESG_GAPTIME_PERCENT + '%');
						
						$('.timeAmountChartTodayInfo').append($timeAmountSGP);
					}else{
						var chartData = google.visualization.arrayToDataTable([]);
						var dataRow = new Array();
						
						chartData.addColumn('string', '시간');
						chartData.addColumn('number', '접속');
						
						for(var key in data[type]){
							dataRow = [ data[type][key].TIMEZONE_TIMEZONE + '', Number(data[type][key].MESTUDYTIME_STUDYTIME) ];
							
							chartData.addRow( dataRow );
						}
						
						var options = {
							height : 200,
							width : 390,
							legend: {position: 'bottom', textStyle: {fontSize: 16}, maxLines:2}
						};
			
						var chartToday = new google.visualization.LineChart(document.getElementById('timeAmountToday_div'));
						chartToday.draw(chartData, options);
					}
				}
			}
		});
		
		$.ajax({
			url : 'selectSGTimeAmountChart.sg',
			data : {
				studygroup_Code : '${code}',
				period : 'thisWeek'
			},
			success : function(data){
				
				for(var type in data){
					if(type == 'chartValue'){
						$timeAmountSGP = $('<p>').append('접속 그룹 : ');
						$timeAmountSGP.append($('<i class="cym">').append(data[type][0].MESG_GAPTIME + '분'));
						
						if(data[type][0].MESG_GAPTIME_PERCENT > 0){
							$timeAmountSGP.append($('<i class="timeAmountInfoUp">').append('▲'));
						}else if(data[type][0].MESG_GAPTIME_PERCENT < 0){
							$timeAmountSGP.append($('<i class="timeAmountInfoDown">').append('▼'));
						}else{
							$timeAmountSGP.append($('<i class="timeAmountInfoSame">').append('-'));
						}
						
						$timeAmountSGP.append(data[type][0].MESG_GAPTIME_PERCENT + '%');
						
						$('.timeAmountChartWeekInfo').append($timeAmountSGP);
					}else{
						var chartData = google.visualization.arrayToDataTable([]);
						var dataRow = new Array();
						
						chartData.addColumn('string', '시간');
						chartData.addColumn('number', '접속');
						
						for(var key in data[type]){
							dataRow = [ data[type][key].TIMEZONE_TIMEZONE + '', Number(data[type][key].MESTUDYTIME_STUDYTIME) ];
							
							chartData.addRow( dataRow );
						}
						
						var options = {
							height : 200,
							width : 390,
							legend: {position: 'bottom', textStyle: {fontSize: 16}, maxLines:2}
						};
			
						var chartToday = new google.visualization.LineChart(document.getElementById('timeAmountWeek_div'));
						chartToday.draw(chartData, options);
					}
				}
			}
		});
		
		$.ajax({
			url : 'selectSGTimeAmountChart.sg',
			data : {
				studygroup_Code : '${code}',
				period : 'thisMonth'
			},
			success : function(data){
				
				for(var type in data){
					if(type == 'chartValue'){
						$timeAmountSGP = $('<p>').append('접속 그룹 : ');
						$timeAmountSGP.append($('<i class="cym">').append(data[type][0].MESG_GAPTIME + '분'));
						
						if(data[type][0].MESG_GAPTIME_PERCENT > 0){
							$timeAmountSGP.append($('<i class="timeAmountInfoUp">').append('▲'));
						}else if(data[type][0].MESG_GAPTIME_PERCENT < 0){
							$timeAmountSGP.append($('<i class="timeAmountInfoDown">').append('▼'));
						}else{
							$timeAmountSGP.append($('<i class="timeAmountInfoSame">').append('-'));
						}
						
						$timeAmountSGP.append(data[type][0].MESG_GAPTIME_PERCENT + '%');
						
						$('.timeAmountChartMonthInfo').append($timeAmountSGP);
					}else{
						var chartData = google.visualization.arrayToDataTable([]);
						var dataRow = new Array();
						
						chartData.addColumn('string', '시간');
						chartData.addColumn('number', '접속');
						
						for(var key in data[type]){
							dataRow = [ data[type][key].TIMEZONE_TIMEZONE + '', Number(data[type][key].MESTUDYTIME_STUDYTIME) ];
							
							chartData.addRow( dataRow );
						}
						
						var options = {
							height : 200,
							width : 390,
							legend: {position: 'bottom', textStyle: {fontSize: 16}, maxLines:2}
						};
			
						var chartToday = new google.visualization.LineChart(document.getElementById('timeAmountMonth_div'));
						chartToday.draw(chartData, options);
					}
				}
			}
		});
	}
</script>
</head>
<body>
	<div class="timeAmountChartArea">
		<h4>접속 스터디 그룹 통계</h4>
		<div class="timeAmountChartPart">
			<div class="timeAmountChartInfo categoryChartTodayInfo"></div>
			<div class="timeAmountChartDiv timeAmountToday_div" id="timeAmountToday_div"></div>
			<div class="chartDay">오늘</div>
		</div>
		<div class="timeAmountChartPart">
			<div class="timeAmountChartInfo categoryChartWeekInfo"></div>
			<div class="timeAmountChartDiv timeAmountWeek_div" id="timeAmountWeek_div"></div>
			<div class="chartDay">이번 주</div>
		</div>
		<div class="timeAmountChartPart">
			<div class="timeAmountChartInfo categoryChartMonthInfo"></div>
			<div class="timeAmountChartDiv timeAmountMonth_div" id="timeAmountMonth_div"></div>
			<div class="chartDay">이번 달</div>
		</div>
	</div>
</body>
</html>