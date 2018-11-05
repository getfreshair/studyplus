<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="col-sm-9 col-xs-12 center_area">
	<div class="row">
		<!-- 일간공부량 -->
		<div class="col-sm-6 col-xs-12 analysis_box st01">
			<div class="box_tit">
				<span class="txt">일간 공부량</span>
				<input type="text" id="todayDatePicker" class="date">
			</div>
			<div class="chart">
				<canvas id="todayChart"></canvas>
			</div>
		</div>
		<!-- // 일간공부량 -->
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
		<!-- 주간공부량 -->
		<div class="col-sm-6 col-xs-12 analysis_box st03">
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
		<!-- 학습평가 -->
		<div class="col-sm-6 col-xs-12 analysis_box st04">
			<div class="box_tit">
				<span class="txt">학습 평가</span>
			</div>
			<div class="chart">
			</div>
		</div>
		<!-- // 학습평가 -->
	</div>
</div>