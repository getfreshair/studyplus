<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>STUDY PLUS</title>
<!-- 소켓 접속 -->
<!-- #### CSS FILES #### -->
<link rel="stylesheet" href="/studyplus/resources/css/bootstrap.css">
<link rel="stylesheet" href="/studyplus/resources/css/custom.css">
<link rel="stylesheet" href="/studyplus/resources/css/Nwagon.css">
<!-- #### JAVASCRIPT FILES #### -->
<script src="/studyplus/resources/js/jquery-1.11.1.min.js"></script>
<script src="/studyplus/resources/js/bootstrap.min.js"></script>
<script src="/studyplus/resources/js/Nwagon.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="/studyplus/resources/js/studyPlannerPage.js"></script>
<!-- #### datepicker #### -->
<link rel="stylesheet" href="/studyplus/resources/css/datepicker.min.css">
<script src="/studyplus/resources/js/datepicker.min.js"></script>
<script src="/studyplus/resources/js/datepicker.ko.js"></script>

<style type="text/css">
	body{background:#f8f8f8;}
	#footer{background: #fff;}
	.weeklyDateCk{width:175px; height:25px; position:absolute; right:35px; top:13px; color:#fff; background:#65cdd8;}
    .analysis_box.st03 .tab{margin-bottom:10px;}
	.analysis_box .chart{padding:15px;}
	.analysis_box.st01 .chart{padding-top:25px;}
	
	#studyTendencyChart svg{width:100%;}
	
	.rank_link, .rank_link:hover, .rank_link:focus{cursor:pointer; color:#fff;}
	/* .today_goals .scroll_area{display:none;}
	.today_goals .scroll_area.on{display:block;} */
	.today_point li.on2 span:before{position:absolute; top:0; left:0; content:''; display:inline-block; width:100%; height:100%; border:2px solid #5eafe4; border-radius:50%;}
	
	/* 모달 */
	.modal-body .tab{text-align:center;}
	/* .modal-body .img_area .box{border:1px solid #ddd; width:85%;} */
	.modal-body .chart_area{padding:0 20px;}

	.modal-body .time_form, .modal-body .book_form{padding-top:30px;}
	.modal-body .ipt_area dt{margin-bottom:5px;}
	.modal-body .btn-center{clear:both; padding-top:20px;}
	.modal-body .ipt_wrap input{width:140px; display:inline-block; margin-right:5px;}
	.modal-body .book_img{border:1px solid #ddd; width:80%; height:180px; text-align:center; margin: 0 auto;}
	.modal-body .book_info{text-align:center; width:80%; margin:10px auto 0 auto;}
</style>
</head>
<body>

	<script>
		var loginFriends = 0;
		var unreadMsg = 0;
		
		$(document).ready(function() {
			  // Handler for .ready() called.
				$.ajax({
					url : "${contextPath}/web/chat.socket",
					type : "GET",
					success : function(data){
			
						$(".chating").empty();
						$(".chating").append(data);
						snsSlideChat();
					}
				});
				
				$.ajax({
					url : "selectUnreadMessage.ms",
					type : "POST",
					data : {
						
						member_Code :  '${ loginUser.member_Code }'
					},
					success : function(data){
				
						unreadMsg = data;
						$('.undreadMsg').text(unreadMsg);
					}
				});
			});
	</script>
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
								<img src="/studyplus/resources/upload/member/thumbnail/${ loginUser.member_Files.files_Name }" alt="study plus logo" style="width:100%;">
							</div>
							<div class="right_area">
								<p>안녕하세요,</p>
								<p class="name">${ loginUser.member_Nickname }님 환영합니다.</p>
							</div>
							<span class="rank_link" onclick="rankLink()" title="나의 랭킹보기">
								<p class="rank">지역랭킹 : 상위 1% &nbsp;&nbsp; 분야 랭킹 : 상위 73%</p>
								<p class="need">식물 Lv. 3</p>
							</span>
						</div>
						<!-- 오늘의목표 -->
						<div class="today_goals">
							<div class="box_tit">
								<span class="txt">오늘의 목표</span>
								<span class="sub">Today's Goals</span>
							</div>
							<ul class="today_point">
								<li><span></span></li>
								<li><span></span></li>
								<li><span></span></li>
								<li><span></span></li>
								<li><span></span></li>
								<li><span></span></li>
								<li><span></span></li>
							</ul>
							<div class="scroll_wrap">
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
										
									</ul>
									<div class="add_btn">
										<a href="#" data-toggle="modal" data-target="#myModal"></a>
									</div>
								</div>
								<!-- <div class="scroll_area">111</div>
								<div class="scroll_area">222</div>
								<div class="scroll_area">333</div>
								<div class="scroll_area">444</div>
								<div class="scroll_area">555</div>
								<div class="scroll_area">666</div> -->
							</div>
						</div>
						<!-- // 오늘의목표 -->
						<script>
						$(function(){
							/* var pointList = $(".today_point li");
							var scrollList = $(".today_goals .scroll_wrap .scroll_area");

							pointList.eq(0).addClass('on');
							scrollList.eq(0).addClass('on');
							
							pointList.click(function(){  //일주일 중 날짜 선택시 
								for(var i = 0; i < pointList.length; i++){
									
									if($(this).index() == i){ //클릭한 날짜가 i 와 같을때
										pointList.removeClass('on'); //날짜 전체에 on을 제거해 주고
										$(this).addClass('on'); //클릭한 날짜에 on을 붙여준다
										
										if($(this).index(i) == scrollList.index(i)){ //클릭한 날짜의 i인덱스와 스크롤리스트의 i인덱스가 같을때
											scrollList.removeClass('on'); //스크롤리스트 전체에 on을 제거해주고
											scrollList.eq(i).addClass('on'); //스크롤리스트에 on을 붙여준다
											
										}
									}
								}
							}); */
							
						});
						</script>

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

					<!-- 컨텐츠 영역 -->
					<div id="analysisCont">
						<jsp:include page="analysisCont.jsp"/> <!-- 분석 -->
					</div>
					<div id="rankingCont" style="display:none">
						<jsp:include page="rankingCont.jsp"/> <!-- 랭킹 -->
					</div>
					<script>
						function rankLink(){
							$("#analysisCont").hide();
							$("#rankingCont").show();
						}
					</script>
					<!-- // 컨텐츠 영역 -->

					<!-- 메신저 기능 -->
					<div class="sns_wrap">
						<div class="click_area">
							친구 <span class="loginFriends"> </span>명 접속중 <span>(<span class="loginFriends"> </span> / <span class="allFriends"> </span>)</span>
							<div class="undreadMsg" style="display:inline-block; background : red; color : white; width : 30px; height : 21px; border-radius : 30px; margin-left : 5%;"></div>
						</div>
						<div class="inner">
							<ul id="friendsList" class="friend_list">
								<script>
								
									var receiverNickName;
									function getFriendList(){
										
										var member_Code = ${ loginUser.member_Code };
										$.ajax({
											url : "selectFriendList.ms",
											type : "POST",
											data : {member_Code:member_Code},
											success : function(data) {
												$('#friendsList').empty();
												
												for(var i=0; i<data.length ;i++){
													var eachFriendMemberCode = data[i].member_Code;
													var eachFriendMemberNickname = data[i].member_Nickname;
													var $li = $('<li>' + 
																		'<span class="img_area">' +
																		'<img src="/studyplus/resources/upload/member/thumbnail/' + data[i].member_Files.files_Name + '" alt="study plus logo" style="width:100%;">' + 
																	'</span>' +
																	'<span class="name nameClass' + i +'">' + data[i].member_Nickname + '</span>' +
																'</li>');
	
													$.ajax({
														url : "eachUnreadMsg.ms",
														type : "POST",
														data : {
															
															member_Code : member_Code,
															eachFriendMemberCode : eachFriendMemberCode
														},
														async: false,
														success : function(data) {

															$li.append( 
																	'<span class="friendList' + eachFriendMemberNickname + ' eachUndreadMsg" style="display:inline-block; background : red; color : white; width : 30px; height : 21px; border-radius : 30px; margin-left : 5%; position : absolute; right : 30px; top : 8px; text-align : center;">' +
																	+ data + '</span>'
																	+ '<span id="status'+  eachFriendMemberNickname  +'"class="status"></span>');
														}
														
													});
													
													$('#friendsList').append($li);
													
													$('.nameClass' + i).click(function(){
														
														receiverNickName = $(this).text()+"";
														$('#chatMessageArea').empty();
														// 메시지 불러서 넣어줘라
														
														$.ajax({
															url : "selectMessageList.ms",
															type : "POST",
															data : {member_Code:member_Code, receiverNickName:receiverNickName},
															success : function(data){
																
																// 읽은 처리 
																$.ajax({
																		url : "unreadToRead.ms",
																		type : "POST",
																		data : {member_Code:member_Code, receiverNickName:receiverNickName},
																		success : function(data){
																			unreadMsg = unreadMsg - data;
																			$('.undreadMsg').text(unreadMsg);
																			$('.friendList'+receiverNickName).html(parseInt($('.friendList'+receiverNickName).html(), 10)-data); // this is 
																		}
																});
																
																for(var i=0; i<data.length ;i++){
																	
																	if(data[i].sender_nickName == '${loginUser.member_Nickname}'){
																		$('#chatMessageArea').append(
																				'<div style="width:98%; display: inline-block;">' + 
																				'<table style="margin-top : 10px; float:right;">'
																						+ '<tr><td>'
																						+ '<div class="dateArea">'
																						+ data[i].message_send_date
																						+ '분</div>' 
																						+ '<div class="msgArea" style="background : #fde09a;">'
																						+ data[i].message_content
																						+ '</div>' 
																						+  '</td></tr></div>');
																		
																	}else{
																		$('#chatMessageArea').append(
																				'<table style="margin-top : 10px;">'
																						+ '<tr><td rowspan="2" style="vertical-align: text-top; display: table-cell;">'
																						+ '<div class="msgImgArea">'
																						+ '<img src="/studyplus/resources/upload/member/thumbnail/'+ data[i].sender_img_name + '" alt="study plus logo" style="border-radius : 50%; width:100%;">'
																						+ '</div></td>'
																						+ '<td><div class="nicknameArea">'
																						+ data[i].sender_nickName
																						+ '</div>'
																						+ '</td></tr>'
																						+ '<tr><td>'
																						+ '<div class="msgArea">'
																						+ data[i].message_content
																						+ '</div>' + '<div class="dateArea">'
																						+ data[i].message_send_date
																						+ '분</div>' + '</td></tr>');
																	}
																}
																var chatAreaHeight = $('#chatArea').height();
																var maxScroll = $('#chatMessageArea').height() - chatAreaHeight;
																$('#chatArea').scrollTop(maxScroll);
															}
														});
													});
												}
												snsSlideChat();
											},
											error:function(){
												console.log("에러 발생!!!");
											}
										});
									}
								</script>
							</ul>
							<div class="chating">
	
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
									<dt>목표 시간</dt>
									<dd class="ipt_wrap">
										<input type="number" class="form-control" placeholder="ex) 3">
										<span>시간</span>
									</dd>
								</dl>
								<dl>
									<dt>달성량</dt>
									<dd class="ipt_wrap">
										<input type="number" class="form-control" readonly>
										<span>/ 3</span>
									</dd>
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
								<div class="book_img">
									img area
								</div>
								<p class="book_info">자바의 정석</p>
							</div>
							<div class="col-sm-7 col-xs-12 ipt_area">
								<dl>
									<dt>목표명</dt>
									<dd><input type="text" class="form-control" placeholder="목표를 입력하세요"></dd>
								</dl>
								<dl>
									<dt>목표 페이지</dt>
									<dd class="ipt_wrap">
										<input type="number" class="form-control" placeholder="ex) 20">
										<span>페이지</span>
									</dd>
								</dl>
								<dl>
									<dt>달성량</dt>
									<dd class="ipt_wrap">
										<input type="number" class="form-control">
										<span>/ 20</span>
									</dd>
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