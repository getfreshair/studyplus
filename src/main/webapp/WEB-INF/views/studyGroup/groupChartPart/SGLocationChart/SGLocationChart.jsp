<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<style>
	.locationChartPart {
		display:inline-block;
		width:390px;
		height:277px;
	}
	.locationChartArea {
		width:1200px;
		text-align:center;
		margin:0 auto;
		margin-top:20px;
		margin-bottom:20px;
	}
	.locationChartArea h4 {
		color: #999999;
		background:#F3F3F3;
		padding-top: 10px;
    	padding-bottom: 10px;
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
	.lchartInfoUp {
		color: red;
		font-size: 14px;
	}
	.lchartInfoDown {
		color: blue;
		font-size: 14px;
	}
	.lchartInfoSame {
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
	google.setOnLoadCallback(drawCategoryChart);

	function drawCategoryChart() {
		$.ajax({
			url : 'selectSGLocationChart.sg',
			data : {
				studygroup_Code : '${code}',
				period : 'today'
			},
			success : function(data){
				for(var type in data){
					if(type == 'chartValue'){
						$locationSGP = $('<p>').append('전체 그룹 : ');
						$locationSGP.append($('<i class="cym">').append(data[type][0].SG_GAPTIME + '분'));
						
						if(data[type][0].SG_GAPTIME_PERCENT > 0){
							$locationSGP.append($('<i class="lchartInfoUp">').append('▲'));
						}else if(data[type][0].SG_GAPTIME_PERCENT < 0){
							$locationSGP.append($('<i class="lchartInfoDown">').append('▼'));
						}else{
							$locationSGP.append($('<i class="lchartInfoSame">').append('-'));
						}
						
						$locationSGP.append(data[type][0].SG_GAPTIME_PERCENT + '%');
						
						$('.locationChartTodayInfo').append($locationSGP);
						
						$locationMESGP = $('<p>').append('접속 그룹 : ');
						$locationMESGP.append($('<i class="cym">').append(data[type][0].MESG_GAPTIME + '분'));
						
						if(data[type][0].MESG_GAPTIME > 0){
							$locationMESGP.append($('<i class="lchartInfoUp">').append('▲'));
						}else if(data[type][0].MESG_GAPTIME < 0){
							$locationMESGP.append($('<i class="lchartInfoDown">').append('▼'));
						}else{
							$locationMESGP.append($('<i class="lchartInfoSame">').append('-'));
						}
						
						$locationMESGP.append(data[type][0].MESG_GAPTIME_PERCENT + '%');
						
						$('.locationChartTodayInfo').append($locationMESGP);
					}else{
						var chartData = google.visualization.arrayToDataTable([]);
						var dataRow = new Array();
						
						chartData.addColumn('string', '시간');
						chartData.addColumn('number', '그룹');
						chartData.addColumn('number', '접속');
						
						for(var key in data[type]){
							dataRow = [ data[type][key].TIMEZONE_TIMEZONE + '', Number(data[type][key].STUDYTIME_STUDYTIME), Number(data[type][key].MESTUDYTIME_STUDYTIME) ];
							
							chartData.addRow( dataRow );
						}
						
						var options = {
							height : 200,
							width : 390,
							legend: {position: 'bottom', textStyle: {fontSize: 16}, maxLines:2}
						};
			
						var chartToday = new google.visualization.LineChart(document.getElementById('locationToday_div'));
						chartToday.draw(chartData, options);
					}
				}
			}
		});
		
		$.ajax({
			url : 'selectSGLocationChart.sg',
			data : {
				studygroup_Code : '${code}',
				period : 'thisWeek'
			},
			success : function(data){
				for(var type in data){
					if(type == 'chartValue'){
						$locationSGP = $('<p>').append('전체 그룹 : ');
						$locationSGP.append($('<i class="cym">').append(data[type][0].SG_GAPTIME + '분'));
						
						if(data[type][0].SG_GAPTIME_PERCENT > 0){
							$locationSGP.append($('<i class="lchartInfoUp">').append('▲'));
						}else if(data[type][0].SG_GAPTIME_PERCENT < 0){
							$locationSGP.append($('<i class="lchartInfoDown">').append('▼'));
						}else{
							$locationSGP.append($('<i class="lchartInfoSame">').append('-'));
						}
						
						$locationSGP.append(data[type][0].SG_GAPTIME_PERCENT + '%');
						
						$('.locationChartWeekInfo').append($locationSGP);
						
						$locationMESGP = $('<p>').append('접속 그룹 : ');
						$locationMESGP.append($('<i class="cym">').append(data[type][0].MESG_GAPTIME + '분'));
						
						if(data[type][0].MESG_GAPTIME > 0){
							$locationMESGP.append($('<i class="lchartInfoUp">').append('▲'));
						}else if(data[type][0].MESG_GAPTIME < 0){
							$locationMESGP.append($('<i class="lchartInfoDown">').append('▼'));
						}else{
							$locationMESGP.append($('<i class="lchartInfoSame">').append('-'));
						}
						
						$locationMESGP.append(data[type][0].MESG_GAPTIME_PERCENT + '%');
						
						$('.locationChartWeekInfo').append($locationMESGP);
					}else{
						var chartData = google.visualization.arrayToDataTable([]);
						var dataRow = new Array();
						
						chartData.addColumn('string', '시간');
						chartData.addColumn('number', '그룹');
						chartData.addColumn('number', '접속');
						
						for(var key in data[type]){
							dataRow = [ data[type][key].TIMEZONE_TIMEZONE + '', Number(data[type][key].STUDYTIME_STUDYTIME), Number(data[type][key].MESTUDYTIME_STUDYTIME) ];
							
							chartData.addRow( dataRow );
						}
						
						var options = {
							height : 200,
							width : 390,
							legend: {position: 'bottom', textStyle: {fontSize: 16}, maxLines:2}
						};
			
						var chartToday = new google.visualization.LineChart(document.getElementById('locationWeek_div'));
						chartToday.draw(chartData, options);
					}
				}
			}
		});
		
		$.ajax({
			url : 'selectSGLocationChart.sg',
			data : {
				studygroup_Code : '${code}',
				period : 'thisMonth'
			},
			success : function(data){
				for(var type in data){
					if(type == 'chartValue'){
						$locationSGP = $('<p>').append('전체 그룹 : ');
						$locationSGP.append($('<i class="cym">').append(data[type][0].SG_GAPTIME + '분'));
						
						if(data[type][0].SG_GAPTIME_PERCENT > 0){
							$locationSGP.append($('<i class="lchartInfoUp">').append('▲'));
						}else if(data[type][0].SG_GAPTIME_PERCENT < 0){
							$locationSGP.append($('<i class="lchartInfoDown">').append('▼'));
						}else{
							$locationSGP.append($('<i class="lchartInfoSame">').append('-'));
						}
						
						$locationSGP.append(data[type][0].SG_GAPTIME_PERCENT + '%');
						
						$('.locationChartMonthInfo').append($locationSGP);
						
						$locationMESGP = $('<p>').append('접속 그룹 : ');
						$locationMESGP.append($('<i class="cym">').append(data[type][0].MESG_GAPTIME + '분'));
						
						if(data[type][0].MESG_GAPTIME > 0){
							$locationMESGP.append($('<i class="lchartInfoUp">').append('▲'));
						}else if(data[type][0].MESG_GAPTIME < 0){
							$locationMESGP.append($('<i class="lchartInfoDown">').append('▼'));
						}else{
							$locationMESGP.append($('<i class="lchartInfoSame">').append('-'));
						}
						
						$locationMESGP.append(data[type][0].MESG_GAPTIME_PERCENT + '%');
						
						$('.locationChartMonthInfo').append($locationMESGP);
					}else{
						var chartData = google.visualization.arrayToDataTable([]);
						var dataRow = new Array();
						
						chartData.addColumn('string', '시간');
						chartData.addColumn('number', '그룹');
						chartData.addColumn('number', '접속');
						
						for(var key in data[type]){
							dataRow = [ data[type][key].TIMEZONE_TIMEZONE + '', Number(data[type][key].STUDYTIME_STUDYTIME), Number(data[type][key].MESTUDYTIME_STUDYTIME) ];
							
							chartData.addRow( dataRow );
						}
						
						var options = {
							height : 200,
							width : 390,
							legend: {position: 'bottom', textStyle: {fontSize: 16}, maxLines:2}
						};
			
						var chartToday = new google.visualization.LineChart(document.getElementById('locationMonth_div'));
						chartToday.draw(chartData, options);
					}
				}
			}
		});
	}
</script>
</head>
<body>
	<div class="locationChartArea">
		<h4>지역 통계</h4>
		<div class="locationChartPart">
			<div class="locationChartInfo locationChartTodayInfo"></div>
			<div class="locationChartDiv locationToday_div" id="locationToday_div"></div>
			<div class="chartDay">오늘</div>
		</div>
		<div class="locationChartPart">
			<div class="locationChartInfo locationChartWeekInfo"></div>
			<div class="locationChartDiv locationWeek_div" id="locationWeek_div"></div>
			<div class="chartDay">이번 주</div>
		</div>
		<div class="locationChartPart">
			<div class="locationChartInfo locationChartMonthInfo"></div>
			<div class="locationChartDiv locationMonth_div" id="locationMonth_div"></div>
			<div class="chartDay">이번 달</div>
		</div>
	</div>
</body>
</html>