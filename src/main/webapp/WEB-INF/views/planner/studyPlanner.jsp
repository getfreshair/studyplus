<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>STUDY PLUS</title>
<!-- #### CSS FILES ### -->
<link rel="stylesheet" href="/studyplus/resources/css/bootstrap.css">
<link rel="stylesheet" href="/studyplus/resources/css/custom.css">
<link rel="stylesheet" href="/studyplus/resources/css/Nwagon.css">
<!-- <link rel="stylesheet" href="/studyplus/resources/css/datepicker.min.css"> -->
<!-- #### JAVASCRIPT FILES ### -->
<script src="/studyplus/resources/js/jquery-1.11.1.min.js"></script>
<script src="/studyplus/resources/js/bootstrap.min.js"></script>
<script src="/studyplus/resources/js/Nwagon.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<!-- <script src="/studyplus/resources/js/datepicker.min.js"></script>
<script src="/studyplus/resources/js/datepicker.ko.js"></script> -->

<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<style type="text/css">
	body{background:#f8f8f8;}
	#footer{background: #fff;}

	.datepicker-here{position:absolute; top:40px; right:5px;}
	
	/* 모달 */
	.modal-body .img_area .box{border:1px solid #ddd; width:85%;}
	.modal-body .chart_area{padding:0 20px;}
	.modal-body .ipt_area{}
</style>
</head>
<body>
	<div id="all">
		<!-- Header -->
		<jsp:include page="../common/header.jsp"/>
		<!-- // Header -->
		<!-- section -->
		<section>
			<div class="study_planner">
				<div class="row">
					<!-- 플래너 영역 -->
					<div class="col-sm-3 col-xs-12 side_area">
						<div class="user_info">
							<div class="img_area">
								<img src="/studyplus/resources/images/common/header_logo.png" alt="study plus logo">
							</div>
							<div class="right_area">
								<p>안녕하세요,</p>
								<p class="name">찡끗쭈구미님</p>
							</div>
							<p class="rank">지역랭킹 : 상위 1% &nbsp;&nbsp; 분야 랭킹 : 상위 73%</p>
							<p class="need">식물 Lv. 3</p>
						</div>
						<!-- 오늘의목표 -->
						<div class="today_goals">
							<div class="box_tit">
								<span class="txt">오늘의 목표</span>
								<span class="sub">Today's Goals</span>
							</div>
							<ul class="today_point">
								<li class="la"><span>27</span></li>
								<li class="la"><span>28</span></li>
								<li class="on"><span>29</span></li>
								<li><span>30</span></li>
								<li><span>1</span></li>
								<li><span>2</span></li>
								<li><span>3</span></li>
							</ul>
							<div class="scroll_area">
								<ul class="goals_list">
									<li>
										<div class="left_area">
											<div class="donut_area">
												<canvas id="today_donut" width="200" height="200"></canvas>
												<span class="chart_per">20%</span>
											</div>
											<script type="text/javascript">
											$(function(){
												var ctx = document.getElementById("today_donut").getContext('2d');
												var today_donut = new Chart(ctx, {
														type: 'doughnut',
														data: data = {
														datasets: [{
														data: [20,80],
														backgroundColor: ['#36a2eb']
														}],
													}
												});
											});
											</script>
										</div>
										<div class="right_area">
											<p class="tit">자바의 정석자바의 정석자바의 정석자바의 정석</p>
											<p class="per">102 / 200 페이지</p>
										</div>
									</li>
									<li>
										<div class="left_area">
										</div>
										<div class="right_area">
											<p class="tit">씨박의 정석</p>
											<p class="per">3 / 21 시간</p>
										</div>
									</li>
								</ul>
								<div class="add_btn">
									<a href="#" data-toggle="modal" data-target="#myModal"></a>
								</div>
							</div>
						</div>
						<!-- // 오늘의목표 -->

						<!-- 이번주목표 -->
						<div class="weekly_goals">
							<div class="box_tit">
								<span class="txt">주간 목표</span>
								<span class="sub">WeeklyGoals</span>
							</div>
							<div class="scroll_area">
								<ul class="goals_list">
									<li>
										<div class="left_area">
										</div>
										<div class="right_area">
											<p class="tit">자바의 정석자바의 정석자바의 정석자바의 정석</p>
											<p class="per">102 / 200 페이지</p>
										</div>
									</li>
									<li>
										<div class="left_area">
										</div>
										<div class="right_area">
											<p class="tit">씨박의 정석</p>
											<p class="per">3 / 21 시간</p>
										</div>
									</li>
									<li>
										<div class="left_area">
										</div>
										<div class="right_area">
											<p class="tit">씨박의 정석</p>
											<p class="per">3 / 21 시간</p>
										</div>
									</li>
									<li>
										<div class="left_area">
										</div>
										<div class="right_area">
											<p class="tit">씨박의 정석</p>
											<p class="per">3 / 21 시간</p>
										</div>
									</li>
								</ul>
								<div class="add_btn">
									<a href="#" data-toggle="modal" data-target="#myModal"></a>
								</div>
							</div>
						</div>
						<!-- // 이번주목표 -->
					</div>
					<!-- // 플래너 영역 -->
					<!-- <button type="button" class="btn btn-primary btn-block">차단하고 공부하기</button> -->

					<!-- 분석 영역 -->
					<div class="col-sm-9 col-xs-12 center_area">
						<div class="row">
							<!-- 일간공부량 -->
							<div class="col-sm-6 col-xs-12 analysis_box st01">
								<div class="box_tit">
									<span class="txt">일간 공부량</span>
									<a href="#" class="date">2018. 09. 10. ></a>
								</div>
								<!-- <div class="datepicker-here" data-language='ko'></div> -->
								<input type="text" id="datepicker1">
								<div class="chart">

<script type="text/javascript">
$(function() {
	  $( "#datepicker1" ).datepicker({
	    dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNames: ['일','월','화','수','목','금','토'],
	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    showMonthAfterYear: true,
	    changeMonth: true,
	    changeYear: true,
	    yearSuffix: '년'
	  });
	});
	/* $(".date").click(function(){
		$(".datepicker-here").show();
	}); */
</script>

									<canvas id="myChart"></canvas>
									
<script>
var ctx = document.getElementById("myChart").getContext('2d');
var myChart = new Chart(ctx, {
	type: 'bar',
	data: {
		labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
		datasets: [{
			label: '# of Votes',
			data: [12, 19, 3, 5, 2, 3],
			backgroundColor: [
				'rgba(255, 99, 132, 0.2)',
				'rgba(54, 162, 235, 0.2)',
				'rgba(255, 206, 86, 0.2)',
				'rgba(75, 192, 192, 0.2)',
				'rgba(153, 102, 255, 0.2)',
				'rgba(255, 159, 64, 0.2)'
			],
			borderColor: [
				'rgba(255,99,132,1)',
				'rgba(54, 162, 235, 1)',
				'rgba(255, 206, 86, 1)',
				'rgba(75, 192, 192, 1)',
				'rgba(153, 102, 255, 1)',
				'rgba(255, 159, 64, 1)'
			],
			borderWidth: 1
		}]
	},
	options: {
		scales: {
			yAxes: [{
				ticks: {
					beginAtZero:true
				}
			}]
		}
	}
});
</script>
								</div>
							</div>
							<!-- // 일간공부량 -->
							<!-- 공부성향 -->
							<div class="col-sm-6 col-xs-12  analysis_box st02">
								<div class="box_tit">
									<span class="txt">공부 성향</span>
								</div>
								<div class="chart">
									<div id="Nwagon"></div>

<script>
var options = {
	'legend':{
		names: [
			'Perceivable',
			'Information Loss',
			'Understandable',
			'Enough Time',
			'Epilepsy Prevent',
			'Operable',
			'Navigation',
			'Error Prevent'
		],
		hrefs: [
			'http://nuli.navercorp.com//sharing/a11y#k1',
			'http://nuli.navercorp.com//sharing/a11y#k2',
			'http://nuli.navercorp.com//sharing/a11y#k3',
			'http://nuli.navercorp.com//sharing/a11y#k4',
			'http://nuli.navercorp.com//sharing/a11y#k5',
			'http://nuli.navercorp.com//sharing/a11y#k6',
			'http://nuli.navercorp.com//sharing/a11y#k7',
			'http://nuli.navercorp.com//sharing/a11y#k8'
		]
	},
	'dataset': {
		title: 'Web accessibility status',
		values: [[34,53,67,23,78,45,69,98]],
		bgColor: '#f9f9f9',
		fgColor: '#30a1ce',
	},
	'chartDiv': 'Nwagon',
	'chartType': 'radar',
	'chartSize': { width: 500, height: 300 }
};
Nwagon.chart(options);
</script>
								</div>
							</div>
							<!-- // 공부성향 -->
						</div>
						<div class="row">
							<!-- 주간공부량 -->
							<div class="col-sm-6 col-xs-12 analysis_box st03">
								<div class="box_tit">
									<span class="txt">주간 공부량</span>
									<a href="#" class="date">2018. 09. 10. ></a>
								</div>
								<div class="chart">
									
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
					<!-- // 분석 영역 -->

					<!-- 메신저 기능 -->
					<div class="sns_wrap">
						<div class="click_area">
							친구 10 명 접속중 <span>(10 / 100)</span>
						</div>
						<div class="inner">
							<ul class="friend_list">
								<li>
									<span class="img_area">
										<img src="/studyplus/resources/images/common/header_logo.png" alt="study plus logo">
									</span>
									<span class="name">소나나소나나</span>
									<span class="status"></span>
								</li>
								<li>
									<span class="img_area">
										<img src="/studyplus/resources/images/common/header_logo.png" alt="study plus logo">
									</span>
									<span class="name">동그리동동</span>
									<span class="status on"></span>
								</li>
								<li>
									<span class="img_area">
										<img src="/studyplus/resources/images/common/header_logo.png" alt="study plus logo">
									</span>
									<span class="name">재이크</span>
									<span class="status"></span>
								</li>
								<li>
									<span class="img_area">
										<img src="/studyplus/resources/images/common/header_logo.png" alt="study plus logo">
									</span>
									<span class="name">팀장 기완쓰</span>
									<span class="status on"></span>
								</li>
								<li>
									<span class="img_area">
										<img src="/studyplus/resources/images/common/header_logo.png" alt="study plus logo">
									</span>
									<span class="name">크리스탈 랄라</span>
									<span class="status on"></span>
								</li>
								<li>
									<span class="img_area">
										<img src="/studyplus/resources/images/common/header_logo.png" alt="study plus logo">
									</span>
									<span class="name">쥬쥬</span>
									<span class="status on"></span>
								</li>
								<li>
									<span class="img_area">
										<img src="/studyplus/resources/images/common/header_logo.png" alt="study plus logo">
									</span>
									<span class="name">후니후니훈</span>
									<span class="status on"></span>
								</li>
								<li>
									<span class="img_area">
										<img src="/studyplus/resources/images/common/header_logo.png" alt="study plus logo">
									</span>
									<span class="name">앞머리는 떡져가지고</span>
									<span class="status on"></span>
								</li>
								<li>
									<span class="img_area">
										<img src="/studyplus/resources/images/common/header_logo.png" alt="study plus logo">
									</span>
									<span class="name">아아너무졸리다아아</span>
									<span class="status on"></span>
								</li>
							</ul>
							<div class="chating">
								<div class="">

								</div>

								<span class="chat_close">[닫기]</span>
							</div>
						</div>
					</div>
					<!-- // 메신저 기능 -->
					<script type="text/javascript">
					// 메신저 노출
					function snsScrollUp(){
						$(".click_area").click(function(){
							if($(this).hasClass("on") != true){
								$(this).addClass("on");
								$(".sns_wrap").animate({
									"height":"460px"
								}, 400);
							}else{
								$(this).removeClass("on");
								$(".sns_wrap").animate({
									"height":"43px"
								}, 400);
							}
						});
					}

					// 채팅 슬라이드
					function snsSlideChat(){
						$(".friend_list .name").click(function(){
							$(".chating").animate({
								"left": 0
							},400);
						});
						$(".chat_close").click(function(){
							$(".chating").animate({
								"left": "100%"
							},400)
						});
					}

					// 스크롤박스 하단 그림자
					function scrollShadow(){
						// 오늘 목표
						var todayH = $(".today_goals .goals_list").height();
						console.log(todayH);
						if(todayH > 220){
							$(".today_goals").append('<div class="shadow_box"></div>');
						}
						// 주간 목표
						var weekH = $(".weekly_goals .goals_list").height();
						if(weekH > 220){
							$(".weekly_goals").append('<div class="shadow_box"></div>');
						}
						// 메신저
						/*var snsH = $(".sns_wrap .inner");
						var overH = $(".sns_wrap .friend_list").height();
						if(overH > 416){
							console.log("test")
							$(snsH).append('<div class="shadow_box"></div>');
						}*/
					}

					$(function(){
						snsScrollUp();
						snsSlideChat();
						scrollShadow();
					});
					</script>

				</div>
			</div>
		</section>
		<!-- // section -->

		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">오늘의 공부 목표!</h4>
					</div>
					<div class="modal-body">
						<div class="tab">
							<button type="button" class="btn btn-default">시간 단위 설정</button>
							<button type="button" class="btn btn-default">페이지 단위 설정</button>
						</div>

						<script type="text/javascript">
						$(function(){
							// 모달
							$(".book_form").hide();
							$(".tab button:first-child").click(function(){
								var iptCk = $(".time_form input");
								for(var i = 0; i < iptCk.length; i++){
									if(iptCk.eq(i).val() !== ""){
										confirm("입력된 정보는 삭제됩니다.");
									}
								}
								
								$(".book_form").hide();
								$(".time_form").show();
							});
							$(".tab button:last-child").click(function(){
								$(".time_form").hide();
								$(".book_form").show();
							});
						});
						</script>
						<!-- 시간 단위 설정 -->
						<div class="time_form">
							<div class="col-sm-5 col-xs-12 chart_area">
								<canvas id="modal_donut" width="200" height="200"></canvas>
								<script type="text/javascript">
								$(function(){
									var ctx = document.getElementById("modal_donut").getContext('2d');
									var modal_donut = new Chart(ctx, {
											type: 'doughnut',
											data: data = {
											datasets: [{
											data: [20,80],
											// data: [10, 20, 30],
											backgroundColor: ['#36a2eb']
											// backgroundColor: ['#ff6384','#36a2eb','#cc65fe']
										}],
											labels: ['목표달성','미달성']
										}
									});
								});
								</script>

							</div>
							<div class="col-sm-7 col-xs-12 ipt_area">
								<dl>
									<dt>목표명</dt>
									<dd><input type="text" class="form-control" placeholder="목표를 입력하세요"></dd>
								</dl>
								<dl>
									<dt>목표시간</dt>
									<dd><input type="number" class="form-control" placeholder="시간을 입력하세요"></dd>
								</dl>
								<dl>
									<dt>코멘트</dt>
									<dd><input type="text" class="form-control" placeholder="코멘트를 입력하세요"></dd>
								</dl>
							</div>
							<div class="btn-center">
								<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
								<button type="submit" class="btn btn-primary">저장</button>
							</div>
						</div>
						<!-- // 시간 단위 설정 -->
						<!-- 페이지 단위 설정 -->
						<div class="book_form">
							<div class="col-sm-5 col-xs-12 img_area">
								<div class="box">
									img area
								</div>
								<p>책이름 및 정보 노출</p>
								<button type="button" class="btn btn-default">책 등록</button>
							</div>
							<div class="col-sm-7 col-xs-12 ipt_area">
								<dl>
									<dt>목표명</dt>
									<dd><input type="text" class="form-control" placeholder="목표를 입력하세요"></dd>
								</dl>
								<dl>
									<dt>목표 페이지</dt>
									<dd><input type="text" class="form-control" placeholder="시간을 입력하세요"></dd>
								</dl>
								<dl>
									<dt>코멘트</dt>
									<dd><input type="text" class="form-control" placeholder="코멘트를 입력하세요"></dd>
								</dl>
							</div>
							<div class="btn-center">
								<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
								<button type="submit" class="btn btn-primary">저장</button>
							</div>
						</div>
						<!-- // 페이지 단위 설정 -->
					 	
					</div>
				</div>
			</div>
		</div>
		<!-- // Modal -->
		<script type="text/javascript">
		$(function(){
			$('#myModal').on('shown.bs.modal', function () {
				$('#myInput').focus();
				});
			});
		</script>

		<!-- Footer -->
		<jsp:include page="../common/footer.jsp"/>
		<!-- // Footer -->
	</div>
</body>
</html>