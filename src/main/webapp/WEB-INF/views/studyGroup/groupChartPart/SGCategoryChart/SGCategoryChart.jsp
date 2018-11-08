<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<style>
	.categoryChartPart {
		display:inline-block;
		width:390px;
		height:277px;
	}
	.categoryChartArea {
		width:1200px;
		text-align:center;
		margin:0 auto;
		margin-top:20px;
		margin-bottom:20px;
	}
	.categoryChartArea h4 {
		color: #999999;
		background:#F3F3F3;
		padding-top: 10px;
    	padding-bottom: 10px;
	}
	.categoryChartInfo {
		font-size: 18px;
	}
	.categoryChartInfo p {
		display:inline-block;
		width:100%;
		margin: 0px;
		text-align:left;
		font-size: 14px;
	}
	.categoryChartInfo i {
		font-size:12px;
	}
	.cchartInfoUp {
		color: red;
		font-size: 14px;
	}
	.cchartInfoDown {
		color: blue;
		font-size: 14px;
	}
	.cchartInfoSame {
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
			url : 'selectSGCategoryChart.sg',
			data : {
				studygroup_Code : '${code}',
				period : 'today'
			},
			success : function(data){
				for(var type in data){
					if(type == 'chartValue'){
						$categorySGP = $('<p>').append('전체 그룹 : ');
						$categorySGP.append($('<i class="cym">').append(data[type][0].SG_GAPTIME + '분'));
						
						if(data[type][0].SG_GAPTIME_PERCENT > 0){
							$categorySGP.append($('<i class="cchartInfoUp">').append('▲'));
						}else if(data[type][0].SG_GAPTIME_PERCENT < 0){
							$categorySGP.append($('<i class="cchartInfoDown">').append('▼'));
						}else{
							$categorySGP.append($('<i class="cchartInfoSame">').append('-'));
						}
						
						$categorySGP.append(data[type][0].SG_GAPTIME_PERCENT + '%');
						
						$('.categoryChartTodayInfo').append($categorySGP);
						
						$categoryMESGP = $('<p>').append('접속 그룹 : ');
						$categoryMESGP.append($('<i class="cym">').append(data[type][0].MESG_GAPTIME + '분'));
						
						if(data[type][0].MESG_GAPTIME > 0){
							$categoryMESGP.append($('<i class="cchartInfoUp">').append('▲'));
						}else if(data[type][0].MESG_GAPTIME < 0){
							$categoryMESGP.append($('<i class="cchartInfoDown">').append('▼'));
						}else{
							$categoryMESGP.append($('<i class="cchartInfoSame">').append('-'));
						}
						
						$categoryMESGP.append(data[type][0].MESG_GAPTIME_PERCENT + '%');
						
						$('.categoryChartTodayInfo').append($categoryMESGP);
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
			
						var chartToday = new google.visualization.LineChart(document.getElementById('categoryToday_div'));
						chartToday.draw(chartData, options);
					}
				}
			}
		});
		
		$.ajax({
			url : 'selectSGCategoryChart.sg',
			data : {
				studygroup_Code : '${code}',
				period : 'thisWeek'
			},
			success : function(data){
				for(var type in data){
					if(type == 'chartValue'){
						$categorySGP = $('<p>').append('전체 그룹 : ');
						$categorySGP.append($('<i class="cym">').append(data[type][0].SG_GAPTIME + '분'));
						
						if(data[type][0].SG_GAPTIME_PERCENT > 0){
							$categorySGP.append($('<i class="cchartInfoUp">').append('▲'));
						}else if(data[type][0].SG_GAPTIME_PERCENT < 0){
							$categorySGP.append($('<i class="cchartInfoDown">').append('▼'));
						}else{
							$categorySGP.append($('<i class="cchartInfoSame">').append('-'));
						}
						
						$categorySGP.append(data[type][0].SG_GAPTIME_PERCENT + '%');
						
						$('.categoryChartWeekInfo').append($categorySGP);
						
						$categoryMESGP = $('<p>').append('접속 그룹 : ');
						$categoryMESGP.append($('<i class="cym">').append(data[type][0].MESG_GAPTIME + '분'));
						
						if(data[type][0].MESG_GAPTIME > 0){
							$categoryMESGP.append($('<i class="cchartInfoUp">').append('▲'));
						}else if(data[type][0].MESG_GAPTIME < 0){
							$categoryMESGP.append($('<i class="cchartInfoDown">').append('▼'));
						}else{
							$categoryMESGP.append($('<i class="cchartInfoSame">').append('-'));
						}
						
						$categoryMESGP.append(data[type][0].MESG_GAPTIME_PERCENT + '%');
						
						$('.categoryChartWeekInfo').append($categoryMESGP);
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
		
						var chartWeek = new google.visualization.LineChart(document.getElementById('categoryWeek_div'));
						chartWeek.draw(chartData, options);
					}
				}
			}
		});
		
		$.ajax({
			url : 'selectSGCategoryChart.sg',
			data : {
				studygroup_Code : '${code}',
				period : 'thisMonth'
			},
			success : function(data){
				for(var type in data){
					if(type == 'chartValue'){
						$categorySGP = $('<p>').append('전체 그룹 : ');
						$categorySGP.append($('<i class="cym">').append(data[type][0].SG_GAPTIME + '분'));
						
						if(data[type][0].SG_GAPTIME_PERCENT > 0){
							$categorySGP.append($('<i class="cchartInfoUp">').append('▲'));
						}else if(data[type][0].SG_GAPTIME_PERCENT < 0){
							$categorySGP.append($('<i class="cchartInfoDown">').append('▼'));
						}else{
							$categorySGP.append($('<i class="cchartInfoSame">').append('-'));
						}
						
						$categorySGP.append(data[type][0].SG_GAPTIME_PERCENT + '%');
						
						$('.categoryChartMonthInfo').append($categorySGP);
						
						$categoryMESGP = $('<p>').append('접속 그룹 : ');
						$categoryMESGP.append($('<i class="cym">').append(data[type][0].MESG_GAPTIME + '분'));
						
						if(data[type][0].MESG_GAPTIME > 0){
							$categoryMESGP.append($('<i class="cchartInfoUp">').append('▲'));
						}else if(data[type][0].MESG_GAPTIME < 0){
							$categoryMESGP.append($('<i class="cchartInfoDown">').append('▼'));
						}else{
							$categoryMESGP.append($('<i class="cchartInfoSame">').append('-'));
						}
						
						$categoryMESGP.append(data[type][0].MESG_GAPTIME_PERCENT + '%');
						
						$('.categoryChartMonthInfo').append($categoryMESGP);
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
			
						var chartMonth = new google.visualization.LineChart(document.getElementById('categoryMonth_div'));
						chartMonth.draw(chartData, options);
					}
				}
			}
		});
	}
</script>
</head>
<body>
	<div class="categoryChartArea">
		<h4>주제 통계</h4>
		<div class="categoryChartPart">
			<div class="categoryChartInfo categoryChartTodayInfo"></div>
			<div class="categoryChartDiv categoryToday_div" id="categoryToday_div"></div>
			<div class="chartDay">오늘</div>
		</div>
		<div class="categoryChartPart">
			<div class="categoryChartInfo categoryChartWeekInfo"></div>
			<div class="categoryChartDiv categoryWeek_div" id="categoryWeek_div"></div>
			<div class="chartDay">이번 주</div>
		</div>
		<div class="categoryChartPart">
			<div class="categoryChartInfo categoryChartMonthInfo"></div>
			<div class="categoryChartDiv categoryMonth_div" id="categoryMonth_div"></div>
			<div class="chartDay">이번 달</div>
		</div>
	</div>
</body>
</html>