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
<script src="/studyplus/resources/js/studyPlannerPage.js"></script>
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
			<%-- <input type="hidden" value="${loginUser}"> --%>
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
								<div class="datepicker-here" data-language='ko'></div>
								<input type="text" id="datepicker1">
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
						<!-- 시간 단위 설정 -->
						<div class="time_form">
							<div class="col-sm-5 col-xs-12 chart_area">
								<canvas id="modal_donut" width="200" height="200"></canvas>
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

		<!-- Footer -->
		<jsp:include page="../common/footer.jsp"/>
		<!-- // Footer -->
	</div>
</body>
</html>