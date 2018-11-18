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
.tendency_go{display:none; height:100%; background:url("/studyplus/resources/images/planner/bg_tendency.png") no-repeat; background-size:100%;}
.tendency_go .txt1{color:#4b4b4b; padding:49% 15px 15px 15px; font-size:14px; font-weight:bold;}
.tendency_go .txt1 span{color:#59a6f4; font-size:18px;}
.tendency_go a{position:absolute; top:18%; right:6%; width:36%; height:50px;}
#typelist{overflow-y:scroll; height:400px;}
#typelist::-webkit-scrollbar {display:none;}
#typelist dl{display:none; text-align:left;}
#typelist dd{font-size:11px;}
.tendency_result{display:none;}
.tendency_result > div{padding:10px;}
</style>
<script>
$(function(){
	//공부성향 불러옴
	$("#studyTendencyChart").empty();
	
	$.ajax({
		url : "studyStyleChart.sp",
		type : "post",
		success : function(data) {
			
			if(data.length != 0){
				
				$(".tendency_go").hide();
				$(".tendency_result").show();
				
				//console.log("데이터 값이 있을때")
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
				
				
				//점수에 따른 결과
				if(type1 > type2){
					console.log("활동형");
					$(".type1_1").show();
				}else{
					console.log("숙고형");
					$(".type1_2").show();
				}
				
				if(type3 > type4){
					console.log("감각형");
					$(".type2_1").show();
				}else{
					console.log("직관형");
					$(".type2_2").show();
				}

				if(type5 > type6){
					console.log("사각형");
					$(".type3_1").show();
				}else{
					console.log("언어형");
					$(".type3_2").show();
				}

				if(type7 > type8){
					console.log("순차형");
					$(".type4_1").show();
				}else{
					console.log("총체형");
					$(".type4_2").show();
				}

			}else{
				//console.log("데이터가 값이 없을떄")
				$(".tendency_go").show();
				$(".tendency_result").hide();
				for(var i = 1; i < 9; i++){
					eval('var result' + i + '= 0');
				}
			}
			
		},
		error : function() {
			console.log("에러발생!");
		}
	});
	
});
</script>
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
			<div class="chart" style="padding:0;">
				<div class="tendency_go">
					<a href="studyStyleView.sp"></a>
					<p class="txt1"><span>‘학습스타일’</span>은 학습하는 방식과 성향으로, 학습자 개개인에 따라 다르게 나타납니다. <br>학습자 개인의 인지적·정의적 강점을 파악하여 자기 자신에게 맞는 학습스타일을 학습에 최대한 활용한다면 좋은 성과를 거둘 수 있습니다.<br>Study Plus는 미국의 North Carolina State University의 공과대학 교수가 개발한 진단지를 사용합니다.</p>
				</div>
				<div class="tendency_result">
					<div class="col-sm-6 col-xs-12">
						<div id="studyTendencyChart"></div>
						<!-- <p>마지막 진단일 : </p> -->
					</div>
					<div class="col-sm-6 col-xs-12">
						<div id ="typelist">
							<p class="tit">학습스타일에 따른 학습전략</p>
							<dl class="type1_1">
								<dt>활동형</dt>
								<dd>토론이나 발표의 기회가 거의 없는 수업을 듣고 있는 활동형 학습자라면, 친구들을 모아
								서 스터디 그룹을 만들어라. 조원들끼리 돌아가면서 자신이 공부한 것을 서로에게 설명해
								주거나 토론하는 것이다. 친구들과 시험문제를 예측해 보고 모범답안을 준비해 보는 것도
								좋다. 이런 방식으로 수업시간에 하지 못하는 그룹활동을 한다면 학습효과를 볼 수 있다.
								</dd>
							</dl>
							<dl class="type1_2">
								<dt>숙고형</dt>
								<dd>새로 배운 내용에 대해 천천히 생각해 볼 여유가 없는 수업을 듣고 있는 숙고형 학습자라
								면, 스스로 생각하는 시간을 마련해야 한다. 교재의 내용을 단순히 읽고 외우지 말고, 지금
								까지 읽은 것을 정리하거나 또는 적용할 만한 점을 찾기 위해 따로 시간을 내도록 하자. 수
								업시간 외에 따로 갖는 시간을 통해 교재내용을 간략히 정리하는 것도 매우 유익하다.
								</dd>
							</dl>
							
							<dl class="type2_1">
								<dt>감각형</dt>
								<dd>감각형 학습자들은 실제 생활과 관련된 정보를 가장 잘 이해한다. 따라서 수업자료가 추
								상적이거나 이론적인 내용만 다루고 있을 경우, 감각형 학습자들은 어려움을 겪는다. 이때
								개념을 명확히 할 수 있는 구체적인 사례를 찾아라. 혹은 같은 수업을 듣는 친구들과 함께 
								브레인스토밍(brain strorming)을 하거나, 스스로 참고자료를 찾아보는 것도 좋다.
								</dd>
							</dl>
							<dl class="type2_2">
								<dt>직관형</dt>
								<dd> 많은 대학강의들은 직관형 학습자에게 맞추어져 있으나, 종종 암기에 의존하거나 공식을
								적용해야 하는 수업이 있다. 이런 경우 교수님께 내용에 관련한 이론이나 개념을 설명해 달
								라고 요청하자. 또한 직관형 학습자들은 세부내용을 묻는 시험문제나, 다 푼 문제를 검토하는 등의 과제
								에 싫증을 느껴 부주의한 실수를 하기 쉽다. 시간을 갖고 문제를 완전히 이해한 후에 문제
								를 풀도록 하라. 또한 과제물 및 답안을 검토하는 것 역시 소홀해서는 안 된다.
								</dd>
							</dl>
							
							<dl class="type3_1">
								<dt>시각형</dt>
								<dd>당신이 시각형 학습자라면, 교재에서 도표, 그림, 사진과 같은 시각자료를 우선 찾아보라. 교수님께 관련된 시각자료가 있는지 여쭈어 보거나 참고문헌을 통해 관련사진이나 영상자료
								가 있는지 찾아보자. 혹은 원이나 사각형 안에 중요한 내용을 묶어 화살표로 개념과 개념사
								이의 관계 또는 연관성을 나타내는 도해조직자를 만들어 보자. 노트에서 동일한 주제에 연
								관된 개념들을 서로 같은 색으로 칠해서 구별하는 방법도 좋다.
								</dd>
							</dl>
							<dl class="type3_2">
								<dt>언어형</dt>
								<dd>언어형 학습자는 자신의 말로 다시 한 법 수업내용을 요약해 보자. 언어형 학습자에게는
									토론과 논의를 하는 그룹활동이 특히 효과적이다. 다른 사람들의 설명을 직접 들어봄으로써
									수업내용을 이해할 수 있고, 혼자 공부할 때보다 더 많은 것을 배울 수 있다. 혹은 수업시간
									에 배운 중심내용을 공책에 적는 학습노트를 만들어 배운 내용을 정리해 보자. 
								</dd>
							</dl>
							
							<dl class="type4_1">
								<dt>순차적</dt>
								<dd> 강의가 이 주제에서 저 주제로 중간과정을 생략하며 진행될 때 순차적 학습자는 어려움을
								느낀다. 순차적 학습자는 구체적인 사실은 잘 알고 있지만 그것을 다른 영역의 내용과 연관
								짓기 힘들어 한다. 따라서 새로 배운 내용을 이미 알고 있는 지식체계에 연관시켜 봄으로써
								스스로의 논리적인 체계를 세워가면서 공부하도록 하자. 그리고 교수님께 수업시간에 다루
								지 않고 넘어간 부분에 대한 정리를 요청해 보자.
								</dd>
							</dl>
							<dl class="type4_2">
								<dt>총체적</dt>
								<dd>총체적 학습자는 스스로가 능력이 부족해 학습속도가 느린 것이 아님을 알아야 한다. 총
								체적 학습자는 공부하기 전에 전체를 훑어 총제적인 개념지도를 머릿속에 그리자. 이런 방
								법은 처음에는 시간을 빼앗기는 것처럼 느껴질 수 있지만, 공부진도를 나아갈수록 도움이
								이 된다.
								 교수님께 개념들 간의 연관관계에 대해 질문하거나, 스스로 참고문헌을 찾아보면서 자신
								의 배경지식과 새로운 내용 간의 연결고리를 만들어 이해하도록 하자. 주제와 개념을 연결
								하는 방법을 익히고 나면, 다른 학습자들은 상상도 하지 못할 만한 방식으로 지식을 응용하
								게 될 것이다. 
								</dd>
							</dl>
						</div>	
					</div>
				</div>
				
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