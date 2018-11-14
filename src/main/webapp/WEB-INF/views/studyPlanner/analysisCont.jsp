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
            	var data = "";
            	if('${scheduleData}' == 'emptyData'){
            		data = [];
            	} else {
            		data = ${scheduleData} ;
            	}

            	$('#schedule2').jqs({
            		  mode: 'read',
            		  data: data
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
				<script>
					$(function(){
						//공부성향 불러옴
						$("#studyTendencyChart").empty();
						$.ajax({
							url : "studyStyleChart.sp",
							type : "post",
							success : function(data) {
								
								if(data.length != 0){
									//console.log("데이터 값이 있을떄")
									var date = data[0].STUDYSTYLE_ENROLLDATE;
									var type1 = data[0].STUDYSTYLE_ACTIVITY;	//활동형
									var type2 = data[0].STUDYSTYLE_DELIBERATE;	//숙고형
									var type3 = data[0].STUDYSTYLE_SENSIBILITY;	//감각형
									var type4 = data[0].STUDYSTYLE_INTUITIVE;	//직관형
									var type5 = data[0].STUDYSTYLE_PERSPECTIVE;	//시각형
									var type6 = data[0].STUDYSTYLE_LANGUAGE;	//언어형
									var type7 = data[0].STUDYSTYLE_SEQUENTIAL;	//순차형
									var type8 = data[0].STUDYSTYLE_WHOLE;		//총체형
									
									for(var i = 1; i < 9; i++){
										//result1 = Math.floor((type1 / 11) * 100);
										eval('var result' + i + '= Math.floor((type' + i +'/ 11) * 100)');
										//console.log(eval('result' + i))
									}
	
								}else{
									//console.log("데이터가 값이 없을떄")
									for(var i = 1; i < 9; i++){
										eval('var result' + i + '= 0');
									}
								}
								
								//공부성향 차트
								var options = {
										'legend':{
											names: ['언어형', '직관형',	'숙고형', '순차형',
													'시각형',	'감각형',	'활동형',	'총체형']
										},
										'dataset': {
											title: '학습스타일 결과',
											values: [[result6, result4, result2, result7,
													result5, result3, result1, result8]],
											bgColor: '#f9f9f9',
											fgColor: '#30a1ce',
										},
										'chartDiv': 'studyTendencyChart',
										'chartType': 'radar',
										'chartSize': { width: 100, height: 320 }
								};
								Nwagon.chart(options);
								
								
							},
							error : function() {
								console.log("에러발생!");
							}
						});
						
						
						
					});
				</script>
				<!-- <button type="button" class="btn btn-primary btn-block">공부성향 분석하기</button> -->
				<a href="studyStyleView.sp" class="btn btn-primary btn-block">공부성향 분석하기</a>
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