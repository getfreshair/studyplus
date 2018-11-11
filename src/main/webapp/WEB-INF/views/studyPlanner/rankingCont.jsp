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
			
				var rank = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
				
				$.ajax({
					url : "studyPlannerWeeklyRankChart2.sp",
					data : {dateVal : dateVal},
					type : "post",
					success : function(data1) {
						
						var max = 1000;
						
						for(var i=0; i<14; i++){
						
							if(i < 7){
								
								if(data[i] != null && max >= data[i].rank){
									
									max = data[i].rank;
								}
							}else{
								
								if(data1[i-7] != null && max >= data1[i-7].rank){
									
									max = data1[i-7].rank;
								}
							}
						}
						
						for(var i=0; i<14; i++){
							
							if(i < 7){
								
								if(data[i] == null){
									
									rank[i] = 1000;
								}else{
									
									rank[i] = data[i].rank;
								}
							}else{
								
								if(data1[i-7] == null){
									
									rank[i] = 1000;
								}else{
									
									rank[i] = data1[i-7].rank;
								}
							}
						}
						console.log(rank);
						
						$('#weeklyRankChart').empty();
						var options = {
								'legend':{
									names: ['일', '월', '화', '수', '목', '금', '토'],
									hrefs: []
								},
								'dataset':{
									title:'Playing time per day',
									values: [[rank[0], rank[7]], [rank[1], rank[8]], [rank[2], rank[9]], [rank[3], rank[10]],
											[rank[4], rank[11]], [rank[5], rank[12]], [rank[6], rank[13]]],
									colorset: ['#30a1ce', '#FF8C00'],
									fields:['지역', '분야']
								},
								'chartDiv' : 'weeklyRankChart',
								'chartType' : 'line',
								'chartSize' : {width:680, height:450},
								'minValue' : 1000, //max + 100,
								'maxValue' :  100, // ((max - 100 >=0 ), max - 100, 0),
								'increment' : -100,
								'isGuideLineNeeded' : false  //default set to false
							};
							Nwagon.chart(options);
					}
				});
			}
		});	
	}
	
	
	function giveWater(){
		
		// 물 지급 처리
		$('#LvUpBack').fadeIn('slow');
		setTimeout(function() {
			$('#LvUpBack').fadeOut('slow');
			$('#need4').fadeOut( "slow", function() {
				$('#need5').fadeIn('slow');
			  });
			}, 2000);
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

	border: solid #e1e1e1;
	border-width: 0 1px 1px 1px;
	height: 100%;
	overflow: hidden;
    position: relative;
}

.rankTitle {
	background: #65cdd8;
	height: 5%;
	padding: 14px;
}

.needTitle {
	background: beige;
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

.blue span {
	background-color: #34c2e3;   
}

.green span {
	  background-color: #a5df41;
	  background-image: -webkit-gradient(linear, left top, left bottom, from(#a5df41), to(#4ca916));
	  background-image: -webkit-linear-gradient(top, #a5df41, #4ca916);
	  background-image: -moz-linear-gradient(top, #a5df41, #4ca916);
	  background-image: -ms-linear-gradient(top, #a5df41, #4ca916);
	  background-image: -o-linear-gradient(top, #a5df41, #4ca916);
	  background-image: linear-gradient(top, #a5df41, #4ca916);  
}

.progress-bar1 {
	background-color: white;
	height: 25px;
	padding: 5px;
	width: 98%;
	margin-left : auto;
	margin-right : auto;	
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border-radius: 5px;
	-moz-box-shadow: 0 1px 5px #000 inset, 0 1px 0 #444;
	-webkit-box-shadow: 0 1px 5px #000 inset, 0 1px 0 #444;
	box-shadow: 0 1px 5px #5eafe4 inset, 0 1px 0 #59d3a5;	          
}

.progress-bar1 span {
	display: inline-block;
	height: 100%;	
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	border-radius: 3px;
	-moz-box-shadow: 0 1px 0 rgba(255, 255, 255, .5) inset;
	-webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, .5) inset;
	box-shadow: 0 1px 0 rgba(255, 255, 255, .5) inset;
        -webkit-transition: width .4s ease-in-out;
        -moz-transition: width .4s ease-in-out;
        -ms-transition: width .4s ease-in-out;
        -o-transition: width .4s ease-in-out;
        transition: width .4s ease-in-out;    
}

.stripes span {
	-webkit-background-size: 30px 30px;
	-moz-background-size: 30px 30px;
	background-size: 30px 30px;			
	background-image: -webkit-gradient(linear, left top, right bottom,
						color-stop(.25, rgba(255, 255, 255, .15)), color-stop(.25, transparent),
						color-stop(.5, transparent), color-stop(.5, rgba(255, 255, 255, .15)),
						color-stop(.75, rgba(255, 255, 255, .15)), color-stop(.75, transparent),
						to(transparent));
	background-image: -webkit-linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%,
						transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%,
						transparent 75%, transparent);
	background-image: -moz-linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%,
						transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%,
						transparent 75%, transparent);
	background-image: -ms-linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%,
						transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%,
						transparent 75%, transparent);
	background-image: -o-linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%,
						transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%,
						transparent 75%, transparent);
	background-image: linear-gradient(135deg, rgba(255, 255, 255, .15) 25%, transparent 25%,
						transparent 50%, rgba(255, 255, 255, .15) 50%, rgba(255, 255, 255, .15) 75%,
						transparent 75%, transparent);            
	
	-webkit-animation: animate-stripes 3s linear infinite;
	-moz-animation: animate-stripes 3s linear infinite;       		
}

@-webkit-keyframes animate-stripes { 
	0% {background-position: 0 0;} 100% {background-position: 60px 0;}
}

@-moz-keyframes animate-stripes {
	0% {background-position: 0 0;} 100% {background-position: 60px 0;}
}

.glow span {
	-moz-box-shadow: 0 5px 5px rgba(255, 255, 255, .7) inset, 0 -5px 5px rgba(255, 255, 255, .7) inset;
	-webkit-box-shadow: 0 5px 5px rgba(255, 255, 255, .7) inset, 0 -5px 5px rgba(255, 255, 255, .7) inset;
	box-shadow: 0 5px 5px rgba(255, 255, 255, .7) inset, 0 -5px 5px rgba(255, 255, 255, .7) inset;
	
	-webkit-animation: animate-glow 1s ease-out infinite;
	-moz-animation: animate-glow 1s ease-out infinite; 			
}

@-webkit-keyframes animate-glow {
 0% { -webkit-box-shadow: 0 5px 5px rgba(255, 255, 255, .7) inset, 0 -5px 5px rgba(255, 255, 255, .7) inset;} 
 50% { -webkit-box-shadow: 0 5px 5px rgba(255, 255, 255, .3) inset, 0 -5px 5px rgba(255, 255, 255, .3) inset;} 
 100% { -webkit-box-shadow: 0 5px 5px rgba(255, 255, 255, .7) inset, 0 -5px 5px rgba(255, 255, 255, .7) inset;}
 }

@-moz-keyframes animate-glow {
 0% { -moz-box-shadow: 0 5px 5px rgba(255, 255, 255, .7) inset, 0 -5px 5px rgba(255, 255, 255, .7) inset;} 
 50% { -moz-box-shadow: 0 5px 5px rgba(255, 255, 255, .3) inset, 0 -5px 5px rgba(255, 255, 255, .3) inset;} 
 100% { -moz-box-shadow: 0 5px 5px rgba(255, 255, 255, .7) inset, 0 -5px 5px rgba(255, 255, 255, .7) inset;}
 }
 
 #giveWater:hover {
 	cursor : pointer;
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
				<div id="LvUpBack" style="position:absolute; background : black; width : 100%; height : 480px; z-index : 800; display : none; overflow:hidden;">			
					<img src="/studyplus/resources/images/need/effect.gif" style = "width : 600px; height : 800px; z-index : 999; margin-left : 0%; margin-top: -26%;">
				</div>
				<div style="background-image : url('/studyplus/resources/images/planner/needBackSky.gif'); background-size : cover; width: 901px; height: 36%;"> 
				</div>
				<div style="background-image : url('/studyplus/resources/images/planner/needBackground.png'); background-size: 100% 500px; width: 100%; height: 48%; position: absolute; top: 75px; background-repeat: no-repeat; text-align : center;">
					<img id="need1" src="/studyplus/resources/images/need/lv1.png" style = "width : 50px; height : 90px; margin-top : 364px; position : relative;  z-index : 900;  display : none;">
					<img id="need1" src="/studyplus/resources/images/need/lv2.png" style = "width : 14%;  margin-top : 326px; position : relative;  z-index : 900;  display : none;">
					<img id="need2" src="/studyplus/resources/images/need/lv3.png" style = "width : 14%;  margin-top : 125px; position : relative;  z-index : 900;  display : none;">
					<img id="need3" src="/studyplus/resources/images/need/lv4.png" style = "width : 30%;  margin-top : 15px; position : relative;  z-index : 900;  display : '';">
					<img id="need4" src="/studyplus/resources/images/need/lv5.png" style = "width : 67%;  margin-top : -18px; position : relative;  z-index : 900;  display : none;">
				</div>
				<div style="width : 100%; height : 50%; margin-top : 145px;">	
					<div class="rankSubTitle">
						<img src="/studyplus/resources/images/studyGroup/point.png" style="width:20px; height:20px;">
						<h4 style="display: inline-block; vertical-align: middle; margin-bottom: 10px;"> 경험치 ( 500 / 500 ) :: 물 주기를 통해 경험치를 올려보세요.</h4>
					</div>			
					<div class="progress-bar1 green stripes">
					    <span style="width: 100%"></span>
					</div>
					<div class="rankSubTitle">
						<img src="/studyplus/resources/images/studyGroup/point.png" style="width:20px; height:20px;">
						<h4 style="display: inline-block; vertical-align: middle; margin-bottom: 10px;"> 물 ( 40 / 100 ) :: 주간 공부 시간에 비례합니다. </h4>
					</div>
					<div class="progress-bar1 blue stripes">
					    <span style="width: 40%"></span>
					</div>
					<div style="width: 100%; height: 40%; background-image : url('/studyplus/resources/images/need/needInforBack.png'); background-size: contain; background-repeat: no-repeat; margin-top: 36px; position : relative;">
						<div id="giveWater" title="클릭하고 새싹에게 물을 주세요!" onclick="giveWater();" style="width : 70px; height : 70px; margin-top : 49px; margin-left : 60px; position : absolute;"></div>
					</div>
				</div>
			</div>
		</div>
		<!-- // 새싹키우기 -->
	</div>
</div>