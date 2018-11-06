<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!--  <meta name="description" content="A schedule management with jQuery."> -->
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="/studyplus/resources/dist/jquery.schedule.css">
  	<link rel="stylesheet" href="/studyplus/resources/dist/jquery.schedule-demo.css"> 
	<script src="/studyplus/resources/dist/jquery.schedule.js"></script>
<style>
.jqs-grid-line:before{left:0;}
.jqs-demo{min-width:auto;}
.jqs-demo::-webkit-scrollbar {display:none;}
</style>
<div class="col-sm-9 col-xs-12 center_area">
	<div class="row">
		<!-- 시간표 -->
		<div class="col-sm-6 col-xs-12 analysis_box st01">
			<div class="box_tit">
				<span class="txt">시간표</span>
			</div>
			<div class="chart">
            <div id="schedule2" class="jqs-demo mb-3" style="height:100%; widht:100%"></div>
            <script>
            $(function(){
            	$('#schedule2').jqs({
            		  mode: 'read',
            		  data: [
            		    {
            		      day: 0,
            		      periods: [
            		        ['20:00', '00:00'],
            		        ['20:00', '22:00'],
            		        ['00:00', '02:00']
            		      ]
            		    }, {
            		      day: 3,
            		      periods: [
            		        ['00:00', '08:30'],
            		        ['09:00', '12:00']
            		      ]
            		    }
            		  ]
            		});
            });
             
            </script>

			</div>
			
		</div>
		<!-- // 시간표 -->
		<!-- 공부성향 -->
		<div class="col-sm-6 col-xs-12  analysis_box st02">
			<div class="box_tit">
				<span class="txt">공부 성향</span>
			</div>
			<div class="chart">
				<div id="studyTendencyChart"></div>
			</div>
		</div>
		<!-- // 공부성향 -->
	</div>
	<div class="row">
		<!-- 일간공부량 -->
		<div class="col-sm-6 col-xs-12 analysis_box st03">
			<div class="box_tit">
				<span class="txt">일간 공부량</span>
				<input type="text" id="todayDatePicker" class="date">
			</div>
			<div class="chart">
				<canvas id="todayChart"></canvas>
			</div>
		</div>
		<!-- // 일간공부량 -->
		<!-- 주간공부량 -->
		<div class="col-sm-6 col-xs-12 analysis_box st04">
			<div class="box_tit">
				<span class="txt">주간 · 월간 공부량</span>
				<input type='text' id="weeklyDatePicker" class="date" data-language='ko'/>
				<label for="weeklyDatePicker" class="weeklyDateCk"></label>
				<input type='text' id="monthlyDatePicker" class="date" data-language='ko' data-min-view="years" data-view="years"/>
			</div>
			<div class="chart">
				<div class="tab">
					<button type="button" class="btn btn-default" id="weeklyBtn">주간</button>
					<button type="button" class="btn btn-default" id="monthlyBtn">월간</button>
				</div>
				<canvas id="weeklyChart"></canvas>
				<canvas id="monthlyChart"></canvas>
			</div>
		</div>
		<!-- // 주간공부량 -->
	</div>
</div>