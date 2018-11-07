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
	.categoryChartDiv {
		
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
			beforeSend : function(){
				$img = $('<img>').attr('src', '/studyplus/resources/images/studyGroup/groupListLoading.gif');
				$img.css({
					'width': '50px',
					'height': '50px',
					'display': 'inline-block',
				});
				$('.todayChartLodingImg').append($img);
			},
			success : function(data){
				console.log(data);
				/* 
				for(var key in data){
					$categorySGP = $('<p>').append('전체 그룹 - ');
					$categorySGP.append($('<i class="cym">').append(data[key].SG_GAPTIME + '분'));
					
					if(data[key].SG_GAPTIME_PERCENT > 0){
						$categorySGP.append($('<i class="cchartInfoUp">').append('▲'));
					}else if(data[key].SG_GAPTIME_PERCENT < 0){
						$categorySGP.append($('<i class="cchartInfoDown">').append('▼'));
					}else{
						$categorySGP.append($('<i class="cchartInfoSame">').append('-'));
					}
					
					$categorySGP.append(data[key].SG_GAPTIME_PERCENT + '%');
					
					$('.categoryChartTodayInfo').append($categorySGP);
					
					$categoryMESGP = $('<p>').append('접속 그룹 - ');
					$categoryMESGP.append($('<i class="cym">').append(data[key].MESG_GAPTIME + '분'));
					
					if(data[key].MESG_GAPTIME > 0){
						$categoryMESGP.append($('<i class="cchartInfoUp">').append('▲'));
					}else if(data[key].MESG_GAPTIME < 0){
						$categoryMESGP.append($('<i class="cchartInfoDown">').append('▼'));
					}else{
						$categoryMESGP.append($('<i class="cchartInfoSame">').append('-'));
					}
					
					$categoryMESGP.append(data[key].MESG_GAPTIME_PERCENT + '%');
					
					$('.categoryChartTodayInfo').append($categoryMESGP);
				}
				
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
						[ '19', 234, 23 ],
						[ '20', 55, 24 ],
						[ '21', 44, 55 ],
						[ '22', 0, 0 ],
						[ '23', 0, 0 ],
						[ '24', 0, 0 ]
				]);
	
				var options = {
					height : 200,
					width : 390,
					legend: {position: 'bottom', textStyle: {fontSize: 16}, maxLines:2}
				};
	
				var chartToday = new google.visualization.LineChart(document.getElementById('categoryToday_div'));
				chartToday.draw(data, options); */
			}
		});
		
		$.ajax({
			url : 'selectSGCategoryChart.sg',
			data : {
				studygroup_Code : '${code}',
				period : 'thisWeek'
			},
			beforeSend : function(){
				
			},
			success : function(data){
				for(var key in data){
					$categorySGP = $('<p>').append('전체 그룹 - ');
					$categorySGP.append($('<i class="cym">').append(data[key].SG_GAPTIME + '분'));
					
					if(data[key].SG_GAPTIME_PERCENT > 0){
						$categorySGP.append($('<i class="cchartInfoUp">').append('▲'));
					}else if(data[key].SG_GAPTIME_PERCENT < 0){
						$categorySGP.append($('<i class="cchartInfoDown">').append('▼'));
					}else{
						$categorySGP.append($('<i class="cchartInfoSame">').append('-'));
					}
					
					$categorySGP.append(data[key].SG_GAPTIME_PERCENT + '%');
					
					$('.categoryChartWeekInfo').append($categorySGP);
					
					$categoryMESGP = $('<p>').append('접속 그룹 - ');
					$categoryMESGP.append($('<i class="cym">').append(data[key].MESG_GAPTIME + '분'));
					
					if(data[key].MESG_GAPTIME > 0){
						$categoryMESGP.append($('<i class="cchartInfoUp">').append('▲'));
					}else if(data[key].MESG_GAPTIME < 0){
						$categoryMESGP.append($('<i class="cchartInfoDown">').append('▼'));
					}else{
						$categoryMESGP.append($('<i class="cchartInfoSame">').append('-'));
					}
					
					$categoryMESGP.append(data[key].MESG_GAPTIME_PERCENT + '%');
					
					$('.categoryChartWeekInfo').append($categoryMESGP);
				}
				
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
						[ '19', 234, 23 ],
						[ '20', 55, 24 ],
						[ '21', 44, 55 ],
						[ '22', 0, 0 ],
						[ '23', 0, 0 ],
						[ '24', 0, 0 ]
				]);
	
				var options = {
					height : 200,
					width : 390,
					legend: {position: 'bottom', textStyle: {fontSize: 16}, maxLines:2}
				};
	
				var chartWeek = new google.visualization.LineChart(document.getElementById('categoryWeek_div'));
				chartWeek.draw(data, options);
			}
		});
		
		$.ajax({
			url : 'selectSGCategoryChart.sg',
			data : {
				studygroup_Code : '${code}',
				period : 'thisMonth'
			},
			beforeSend : function(){
				
			},
			success : function(data){
				for(var key in data){
					$categorySGP = $('<p>').append('전체 그룹 - ');
					$categorySGP.append($('<i class="cym">').append(data[key].SG_GAPTIME + '분'));
					
					if(data[key].SG_GAPTIME_PERCENT > 0){
						$categorySGP.append($('<i class="cchartInfoUp">').append('▲'));
					}else if(data[key].SG_GAPTIME_PERCENT < 0){
						$categorySGP.append($('<i class="cchartInfoDown">').append('▼'));
					}else{
						$categorySGP.append($('<i class="cchartInfoSame">').append('-'));
					}
					
					$categorySGP.append(data[key].SG_GAPTIME_PERCENT + '%');
					
					$('.categoryChartMonthInfo').append($categorySGP);
					
					$categoryMESGP = $('<p>').append('접속 그룹 - ');
					$categoryMESGP.append($('<i class="cym">').append(data[key].MESG_GAPTIME + '분'));
					
					if(data[key].MESG_GAPTIME > 0){
						$categoryMESGP.append($('<i class="cchartInfoUp">').append('▲'));
					}else if(data[key].MESG_GAPTIME < 0){
						$categoryMESGP.append($('<i class="cchartInfoDown">').append('▼'));
					}else{
						$categoryMESGP.append($('<i class="cchartInfoSame">').append('-'));
					}
					
					$categoryMESGP.append(data[key].MESG_GAPTIME_PERCENT + '%');
					
					$('.categoryChartMonthInfo').append($categoryMESGP);
				}
				
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
						[ '19', 234, 23 ],
						[ '20', 55, 24 ],
						[ '21', 44, 55 ],
						[ '22', 0, 0 ],
						[ '23', 0, 0 ],
						[ '24', 0, 0 ]
				]);
	
				var options = {
					height : 200,
					width : 390,
					legend: {position: 'bottom', textStyle: {fontSize: 16}, maxLines:2}
				};
				
				var chartMonth = new google.visualization.LineChart(document.getElementById('categoryMonth_div'));
				chartMonth.draw(data, options);
			}
		});
	}
</script>
</head>
<body>
	<div class="categoryChartArea">
		<h4>주제 통계</h4>
		<div class="categoryChartPart todayChartLodingImg">
			<div class="categoryChartInfo categoryChartTodayInfo"></div>
			<div class="categoryChartDiv" id="categoryToday_div"></div>
			<div class="chartDay">오늘</div>
		</div>
		<div class="categoryChartPart">
			<div class="categoryChartInfo categoryChartWeekInfo"></div>
			<div class="categoryChartDiv" id="categoryWeek_div"></div>
			<div class="chartDay">이번 주</div>
		</div>
		<div class="categoryChartPart">
			<div class="categoryChartInfo categoryChartMonthInfo"></div>
			<div class="categoryChartDiv" id="categoryMonth_div"></div>
			<div class="chartDay">이번 달</div>
		</div>
	</div>
</body>
</html>