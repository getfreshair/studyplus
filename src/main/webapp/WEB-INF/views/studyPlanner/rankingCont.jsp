<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>

	$(function(){
	
		$('#weeklyRankDatePicker').datepicker({
		    language: 'ko',
		    dateFormat: "yyyy-mm-dd",
		    autoClose: true
		});
		
		todayRankdateWeekly();
		weeklyRankChartChangeDate();
	
	});
	
		
	$(document).ready(function(){
	    $('.progress-value > span').each(function(){
	        $(this).prop('Counter',0).animate({
	            Counter: $(this).text()
	        },{
	            duration: 1500,
	            easing: 'swing',
	            step: function (now){
	                $(this).text(Math.ceil(now));
	            }
	        });
	    });
	});
	
	function todayRankdateWeekly(){
		var now = new Date();
		var week = now.getDay();
		
		//오늘 달력에 선택된 날짜
		var todayArea = $(".datepicker:nth-child(2) .-current-");
		
		//페이지 진입시 오늘날짜 추출해서 input에 value노출 시키기 (노가다의 끝판왕1)
		switch(week){
			case 0 : //일요일
				var firstDate = 
					$(todayArea).attr("data-year") + "-" +
					(($(todayArea).attr("data-month")*1)+1) + "-" +
					$(todayArea).attr("data-date");
				var lastDate =
					$(todayArea).next().next().next().next().next().next().attr("data-year") + "-" +
					(($(todayArea).next().next().next().next().next().next().attr("data-month")*1)+1) + "-" +
					$(todayArea).next().next().next().next().next().next().attr("data-date");
				
				$("#weeklyRankDatePicker").attr(firstDate+' ~ '+lastDate);
				$(".weeklyRankDateCk").text(firstDate+' ~ '+lastDate);
				break;
			case 1 : //월요일
				var firstDate = 
					$(todayArea).prev().attr("data-year") + "-" +
					(($(todayArea).prev().attr("data-month")*1)+1) + "-" +
					$(todayArea).prev().attr("data-date");
				var lastDate =
					$(todayArea).next().next().next().next().next().attr("data-year") + "-" +
					(($(todayArea).next().next().next().next().next().attr("data-month")*1)+1) + "-" +
					$(todayArea).next().next().next().next().next().attr("data-date");
				
				$("#weeklyRankDatePicker").attr(firstDate+' ~ '+lastDate);
				$(".weeklyRankDateCk").text(firstDate+' ~ '+lastDate);
				break;
			case 2 : //화요일
				var firstDate = 
					$(todayArea).prev().prev().attr("data-year") + "-" +
					(($(todayArea).prev().prev().attr("data-month")*1)+1) + "-" +
					$(todayArea).prev().prev().attr("data-date");
				var lastDate =
					$(todayArea).next().next().next().next().attr("data-year") + "-" +
					(($(todayArea).next().next().next().next().attr("data-month")*1)+1) + "-" +
					$(todayArea).next().next().next().next().attr("data-date");
				
				$("#weeklyRankDatePicker").attr(firstDate+' ~ '+lastDate);
				$(".weeklyRankDateCk").text(firstDate+' ~ '+lastDate);
				break;
			case 3 : //수요일
				var firstDate = 
					$(todayArea).prev().prev().prev().attr("data-year") + "-" +
					(($(todayArea).prev().prev().prev().attr("data-month")*1)+1) + "-" +
					$(todayArea).prev().prev().prev().attr("data-date");
				var lastDate =
					$(todayArea).next().next().next().attr("data-year") + "-" +
					(($(todayArea).next().next().next().attr("data-month")*1)+1) + "-" +
					$(todayArea).next().next().next().attr("data-date");
				
				$("#weeklyRankDatePicker").attr(firstDate+' ~ '+lastDate);
				$(".weeklyRankDateCk").text(firstDate+' ~ '+lastDate);
				break;
			case 4 : //목요일
				var firstDate = 
					$(todayArea).prev().prev().prev().prev().attr("data-year") + "-" +
					(($(todayArea).prev().prev().prev().prev().attr("data-month")*1)+1) + "-" +
					$(todayArea).prev().prev().prev().prev().attr("data-date");
				var lastDate =
					$(todayArea).next().next().attr("data-year") + "-" +
					(($(todayArea).next().next().attr("data-month")*1)+1) + "-" +
					$(todayArea).next().next().attr("data-date");
				
				$("#weeklyRankDatePicker").attr(firstDate+' ~ '+lastDate);
				$(".weeklyRankDateCk").text(firstDate+' ~ '+lastDate);
				break;
			case 5 : //금요일
				var firstDate = 
					$(todayArea).prev().prev().prev().prev().prev().attr("data-year") + "-" +
					(($(todayArea).prev().prev().prev().prev().prev().attr("data-month")*1)+1) + "-" +
					$(todayArea).prev().prev().prev().prev().prev().attr("data-date");
				var lastDate =
					$(todayArea).next().attr("data-year") + "-" +
					(($(todayArea).next().attr("data-month")*1)+1) + "-" +
					$(todayArea).next().attr("data-date");
				
				$("#weeklyRankDatePicker").attr(firstDate+' ~ '+lastDate);
				$(".weeklyRankDateCk").text(firstDate+' ~ '+lastDate);
				break;
			case 6 : //토요일
				var firstDate = 
					$(todayArea).prev().prev().prev().prev().prev().prev().attr("data-year") + "-" +
					(($(todayArea).prev().prev().prev().prev().prev().prev().attr("data-month")*1)+1) + "-" +
					$(todayArea).prev().prev().prev().prev().prev().prev().attr("data-date");
				var lastDate =
					$(todayArea).attr("data-year") + "-" +
					(($(todayArea).attr("data-month")*1)+1) + "-" +
					$(todayArea).attr("data-date");
				
				$("#weeklyRankDatePicker").attr(firstDate+' ~ '+lastDate);
				$(".weeklyRankDateCk").text(firstDate+' ~ '+lastDate);
				break;
		}
		var dateVal = $(".weeklyRankDateCk").text(); //컨트롤러에 보낼 날짜
		weeklyRankChart(dateVal); //주간 공부량 차트
	}
	
	function weeklyRankChartChangeDate(){
		
		$("#weeklyRankDatePicker").click(function(){
			//over된 곳의 날짜를 뽑아와서 / 요일을 추출해서 / bg컬러입히기
			
			$(".datepicker:nth-child(4) .datepicker--cell").mouseover(function(){
				
				//mouseover시 해당 셀의 날짜 추출
				var overDate = $(this).attr("data-year") + "-" + 
								(($(this).attr("data-month") * 1) + 1)  + "-" + 
								$(this).attr("data-date");
				var overWeek = new Date(overDate).getDay(); //over한 날짜의 요일 추출
				var overBg = {"background":"#efefef"}; //over시 적용할 bg
				
				$(".-selected-").css("color","#4a4a4a");
				//mouseover시 요일추출해서 bg컬러입힘(노가다의 끝판왕2)
				switch(overWeek){
					case 0 : //일요일
						$(this).siblings().css({"background":"white"});
						$(this).css({"background":"#5cc4ef"});
						$(this).next().next().next().next().next().next().css(overBg); 
						$(this).next().next().next().next().next().css(overBg); 
						$(this).next().next().next().next().css(overBg); 
						$(this).next().next().next().css(overBg); 
						$(this).next().next().css(overBg); 
						$(this).next().css(overBg); 
						break;
						
					case 1 : //월요일
						$(this).siblings().css({"background":"white"});
						$(this).css({"background":"#5cc4ef"});
						$(this).prev().css(overBg); 
						$(this).next().next().next().next().next().css(overBg); 
						$(this).next().next().next().next().css(overBg); 
						$(this).next().next().next().css(overBg); 
						$(this).next().next().css(overBg); 
						$(this).next().css(overBg); 
						break;
						
					case 2 : //화요일
						$(this).siblings().css({"background":"white"});
						$(this).css({"background":"#5cc4ef"});
						$(this).prev().css(overBg); 
						$(this).prev().prev().css(overBg); 
						$(this).next().next().next().next().css(overBg); 
						$(this).next().next().next().css(overBg); 
						$(this).next().next().css(overBg); 
						$(this).next().css(overBg); 
						break;
						
					case 3 : //수요일
						$(this).siblings().css({"background":"white"});
						$(this).css({"background":"#5cc4ef"});
						$(this).prev().css(overBg); 
						$(this).prev().prev().css(overBg); 
						$(this).prev().prev().prev().css(overBg); 
						$(this).next().next().next().css(overBg); 
						$(this).next().next().css(overBg); 
						$(this).next().css(overBg); 
						break;
						
					case 4 : //목요일
						$(this).siblings().css({"background":"white"});
						$(this).css({"background":"#5cc4ef"});
						$(this).prev().css(overBg); 
						$(this).prev().prev().css(overBg); 
						$(this).prev().prev().prev().css(overBg); 
						$(this).prev().prev().prev().prev().css(overBg); 
						$(this).next().next().css(overBg); 
						$(this).next().css(overBg); 
						break;
						
					case 5 : //금요일
						$(this).siblings().css({"background":"white"});
						$(this).css({"background":"#5cc4ef"});
						$(this).prev().css(overBg); 
						$(this).prev().prev().css(overBg); 
						$(this).prev().prev().prev().css(overBg); 
						$(this).prev().prev().prev().prev().css(overBg); 
						$(this).prev().prev().prev().prev().prev().css(overBg); 
						$(this).next().css(overBg); 
						break;
						
					case 6 : //토요일
						$(this).siblings().css({"background":"white"});
						$(this).css({"background":"#5cc4ef"});
						$(this).prev().css(overBg); 
						$(this).prev().prev().css(overBg); 
						$(this).prev().prev().prev().css(overBg); 
						$(this).prev().prev().prev().prev().css(overBg); 
						$(this).prev().prev().prev().prev().prev().css(overBg); 
						$(this).prev().prev().prev().prev().prev().prev().css(overBg); 
						break;
				}
				
			}).click(function(){		
			
				//클릭시 해달 셀의 날자 추출
				var overDate = $(this).attr("data-year") + "-" + 
								(($(this).attr("data-month") * 1) + 1)  + "-" + 
								$(this).attr("data-date");
				var overWeek = new Date(overDate).getDay(); //click한 날짜의 요일 추출
				
				//클릭시 해당 주의 날짜를 출력함(노가다의 끝판왕3)
				switch(overWeek){
					case 0 : //일요일
						var firstYear = $(this).attr("data-year");
						var firstMon = $(this).attr("data-month");
						var firstDate = $(this).attr("data-date");
						
						var lastYear = $(this).next().next().next().next().next().next().attr("data-year");
						var lastMon = $(this).next().next().next().next().next().next().attr("data-month");
						var lastDate = $(this).next().next().next().next().next().next().attr("data-date");
						
						var resultDate = firstYear + "-" + ((firstMon * 1) +1)  + "-" + firstDate;
						var lastDate = lastYear + "-" + ((lastMon * 1) +1)  + "-" + lastDate;
						var result = resultDate + ' ~ ' + lastDate;
					
						$("#weeklyRankDatePicker").attr("value", result);
						$(".weeklyRankDateCk").text(result);
						break;
						
					case 1 : //월요일
						var firstYear = $(this).prev().attr("data-year");
						var firstMon = $(this).prev().attr("data-month");
						var firstDate = $(this).prev().attr("data-date");
						
						var lastYear = $(this).next().next().next().next().next().attr("data-year");
						var lastMon = $(this).next().next().next().next().next().attr("data-month");
						var lastDate = $(this).next().next().next().next().next().attr("data-date");
						
						var resultDate = firstYear + "-" + ((firstMon * 1) +1)  + "-" + firstDate;
						var lastDate = lastYear + "-" + ((lastMon * 1) +1)  + "-" + lastDate;
						var result = resultDate + ' ~ ' + lastDate;
					
						$("#weeklyRankDatePicker").attr("value", result);
						$(".weeklyRankDateCk").text(result);
						break;
						
					case 2 : //화요일
						var firstYear = $(this).prev().prev().attr("data-year");
						var firstMon = $(this).prev().prev().attr("data-month");
						var firstDate = $(this).prev().prev().attr("data-date");
						
						var lastYear = $(this).next().next().next().next().attr("data-year");
						var lastMon = $(this).next().next().next().next().attr("data-month");
						var lastDate = $(this).next().next().next().next().attr("data-date");
						
						var resultDate = firstYear + "-" + ((firstMon * 1) +1)  + "-" + firstDate;
						var lastDate = lastYear + "-" + ((lastMon * 1) +1)  + "-" + lastDate;
						var result = resultDate + ' ~ ' + lastDate;
					
						$("#weeklyRankDatePicker").attr("value", result);
						$(".weeklyRankDateCk").text(result);
						break;
						
					case 3 : //수요일
						var firstYear = $(this).prev().prev().prev().attr("data-year");
						var firstMon = $(this).prev().prev().prev().attr("data-month");
						var firstDate = $(this).prev().prev().prev().attr("data-date");
						
						var lastYear = $(this).next().next().next().attr("data-year");
						var lastMon = $(this).next().next().next().attr("data-month");
						var lastDate = $(this).next().next().next().attr("data-date");
						
						var resultDate = firstYear + "-" + ((firstMon * 1) +1)  + "-" + firstDate;
						var lastDate = lastYear + "-" + ((lastMon * 1) +1)  + "-" + lastDate;
						var result = resultDate + ' ~ ' + lastDate;
					
						$("#weeklyRankDatePicker").attr("value", result);
						$(".weeklyRankDateCk").text(result);
						break;
						
					case 4 : //목요일
						var firstYear = $(this).prev().prev().prev().prev().attr("data-year");
						var firstMon = $(this).prev().prev().prev().prev().attr("data-month");
						var firstDate = $(this).prev().prev().prev().prev().attr("data-date");
						
						var lastYear = $(this).next().next().attr("data-year");
						var lastMon = $(this).next().next().attr("data-month");
						var lastDate = $(this).next().next().attr("data-date");
						
						var resultDate = firstYear + "-" + ((firstMon * 1) +1)  + "-" + firstDate;
						var lastDate = lastYear + "-" + ((lastMon * 1) +1)  + "-" + lastDate;
						var result = resultDate + ' ~ ' + lastDate;
					
						$("#weeklyRankDatePicker").attr("value", result);
						$(".weeklyRankDateCk").text(result);
						break;
						
					case 5 : //금요일
						var firstYear = $(this).prev().prev().prev().prev().prev().attr("data-year");
						var firstMon = $(this).prev().prev().prev().prev().prev().attr("data-month");
						var firstDate = $(this).prev().prev().prev().prev().prev().attr("data-date");
						
						var lastYear = $(this).next().attr("data-year");
						var lastMon = $(this).next().attr("data-month");
						var lastDate = $(this).next().attr("data-date");
						
						var resultDate = firstYear + "-" + ((firstMon * 1) +1)  + "-" + firstDate;
						var lastDate = lastYear + "-" + ((lastMon * 1) +1)  + "-" + lastDate;
						var result = resultDate + ' ~ ' + lastDate;
						
						$("#weeklyRankDatePicker").attr("value", result);
						$(".weeklyRankDateCk").text(result);
						break;
						
					case 6 : //토요일
						var firstYear = $(this).prev().prev().prev().prev().prev().prev().attr("data-year");
						var firstMon = $(this).prev().prev().prev().prev().prev().prev().attr("data-month");
						var firstDate = $(this).prev().prev().prev().prev().prev().prev().attr("data-date");
						
						var resultDate = firstYear + "-" + ((firstMon * 1) +1)  + "-" + firstDate;
						var lastDate = overDate;
						var result = resultDate + ' ~ ' + lastDate;
						
						$("#weeklyRankDatePicker").attr("value", result);
						$(".weeklyRankDateCk").text(result);
						break;
				}
					
				var dateVal = $(".weeklyRankDateCk").text(); //컨트롤러에 보낼 날짜
				weeklyRankChart(dateVal); //주간 공부량 차트
			});
		});
	}
	
	function weeklyRankChart(dateVal){
		
		$.ajax({
			url : "studyPlannerWeeklyRankChart.sp",
			data : {dateVal : dateVal},
			type : "post",
			success : function(data) {
				
				$('#weeklyRankChart').empty();
				var options = {
						'legend':{
							names: ['일', '월', '화', '수', '목', '금', '토'],
							hrefs: []
						},
						'dataset':{
							title:'Playing time per day',
							values: [[61, 66], [76, 66], [49, 45], [58, 76],
									[48, 76], [56, 83], [56, 83]],
							colorset: ['#30a1ce', '#FF8C00'],
							fields:['지역', '분야']
						},
						'chartDiv' : 'weeklyRankChart',
						'chartType' : 'line',
						'chartSize' : {width:680, height:450},
						'minValue' : 40,
						'maxValue' : 100,
						'increment' : 10,
						'isGuideLineNeeded' : true  //default set to false
					};
					Nwagon.chart(options);
			}
		});	
	}
</script>
<style>
.rankDiv {
	height: 945px;
}

.needDiv {
	height: 945px;
}

.rankInDiv {
	background: white;
	border: solid #e1e1e1;
	border-width: 0 1px 1px 1px;
	height: 100%;
	margin-right: 10px;
}

.rankSubTitle{
	
	margin-left : 30px;
	margin-top : 30px;
	margin-botton : 30px;
	display : inline-block;
}
.needInDiv {
	background: white;
	border: solid #e1e1e1;
	border-width: 0 1px 1px 1px;
	height: 100%;
}

.rankTitle {
	background: #65cdd8;
	height: 5%;
	padding: 14px;
}

.needTitle {
	background: #5eafe4;
	height: 5%;
	padding: 14px;
}

.titleTxt {
	font-size: 14px;
	font-weight: bold;
}

.titleImg {
	height: 26px;
	width: 26px;
	margin-right: 15px;
	background-size: 100%;
	margin-top: -3px;
}

.rank_chart {
	height: 500px;
	width: 100%;
	margin-bottom : 30px;
}

#weeklyRankChart{
	
	width : 95% !important;
	margin-left : auto;
	margin-right : auto;
}
.rank_graph {
	width: 98%;
    height: 300px;
    padding-left: 20px;
    padding-right: 10px;
}

.progress-title{
    font-size: 18px;
    font-weight: 700;
    color: #000;
    margin: 0 0 30px;
}
.progress{
    height: 17px;
    background: rgba(0,0,0,0.1);
    border-radius: 15px;
    margin-bottom: 30px;
    overflow: visible;
    position: relative;
}
.progress .progress-bar{
    border-radius: 15px;
    box-shadow: none;
    position: relative;
    animation: animate-positive 2s;
}
.progress .progress-icon,
.progress .progress-value{
    width: 50px;
    height: 50px;
    border-radius: 50%;
    line-height: 40px;
    background: #fff;
    border: 7px solid #1f75c4;
    font-size:15px;
    font-weight: 600;
    color: #1f75c4;
    position: absolute;
    top: -17px;
    right: -5px;
}
.progress .progress-icon{
    right: auto;
    left: -5px;
}
.progress.orange .progress-icon,
.progress.orange .progress-value{
    border: 7px solid #f7810e;
    color: #f7810e;
}
.progress.pink .progress-icon,
.progress.pink .progress-value{
    border: 7px solid #f2438f;
    color: #f2438f;
}
.progress.green .progress-icon,
.progress.green .progress-value{
    border: 7px solid #08a061;
    color: #08a061;
}
@-webkit-keyframes animate-positive{
    0%{ width: 0; }
}
@keyframes animate-positive{
    0%{ width: 0; }
}
</style>
<div class="col-sm-9 col-xs-12 center_area" style="height: 972px;">
	<div class="row">
		<!-- 랭킹 -->
		<div class="col-sm-6 col-xs-12 rankDiv">
			<div class="rankInDiv">
				<div class="rankTitle">
					<img src="/studyplus/resources/images/planner/icon_rank.png" class="titleImg">
					<span class="titleTxt"> 개인 주간 학습 랭킹 </span>
				</div>
				<label for="weeklyRankDatePicker" class="weeklyRankDateCk" style="position: absolute; right: 35px; top: 13px; color: white;"></label>
				<input type='text' id="weeklyRankDatePicker" class="date" data-language='ko'style="position: absolute; top: 13px; right: 35px; opacity: 0;"/>
				<div class="rank_chart">
					<div class="rankSubTitle">
						<img src="/studyplus/resources/images/studyGroup/point.png" style="width:30px; height:30px;">
						<h2 style="display: inline-block; vertical-align: middle; margin-bottom: 20px;"> 개인 주간 일별 랭킹 </h2>
					</div>
					<div id="weeklyRankChart"></div>
				</div>
				<div class="rankSubTitle">
					<img src="/studyplus/resources/images/studyGroup/point.png" style="width:30px; height:30px;">
					<h2 style="display: inline-block; vertical-align: middle; margin-bottom: 20px;"> 개인 주간 종합 랭킹 </h2>
				</div>
				<div class="rank_graph">
					<h3 class="progress-title">지역</h3>
		            <div class="progress">
		                <div class="progress-bar" style="width:99%; background:#1f75c4;">
		                    <span class="progress-icon fa fa-globe"></span>
		                    <div class="progress-value"><span>1</span>%</div>
		                </div>
		            </div>
		            <h3 class="progress-title">분야</h3>
		            <div class="progress orange">
		                <div class="progress-bar" style="width:90%; background:#f7810e;">
		                    <span class="progress-icon fa fa-rocket"></span>
		                    <div class="progress-value"><span>10</span>%</div>
		                </div>
		            </div>
				</div>
			</div>
		</div>
		<!-- 새싹키우기 -->
		<div class="col-sm-6 col-xs-12 needDiv">
			<div class="needInDiv">
				<div class="needTitle">
					<img src="/studyplus/resources/images/planner/ico_need.png"
						class="titleImg"> <span class="titleTxt"> 새싹 키우기 </span>
				</div>
			</div>
		</div>
		<!-- // 새싹키우기 -->
	</div>
</div>