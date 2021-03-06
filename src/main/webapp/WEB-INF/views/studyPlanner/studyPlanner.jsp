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
	.weeklyDateCk{width:175px; height:25px; position:absolute; right:38px; top:10px; color:#fff; background:#5eafe4; text-align:right; font-size:14px; line-height:2;}
	.analysis_box .chart{padding:15px;}
	.analysis_box.st01 .chart{padding:0;}
	.analysis_box.st03 .chart{padding-top:70px;}
    .analysis_box.st04 .tab{margin-bottom:20px;}
	
	#studyTendencyChart svg{width:100%;}
	
	.scroll_area .add_btn{padding:20px 0 50px;}
	.rank_link, .rank_link:hover, .rank_link:focus{cursor:pointer; color:#fff;}
	/* .today_goals .scroll_area{display:none;}
	.today_goals .scroll_area.on{display:block;} */
	.today_point li.on2 span:before{position:absolute; top:0; left:0; content:''; display:inline-block; width:100%; height:100%; border:2px solid #5eafe4; border-radius:50%;}
	
	/* 모달 */
	.modal-body .tab{text-align:center;}
	.modal-body .tab button{width:49%; border-width:1px 1px 0 1px !important; border-radius:4px 4px 0 0 !important; border:solid #ddd; background:#ddd;}
	.modal-body .tab button.on{background:#fff;  border-width:1px 1px 0 1px; border:solid #ccc; color:#333;}
	.modal-body .tab button:focus{outline:none;}
	/* .modal-body .img_area .box{border:1px solid #ddd; width:85%;} */
	.modal-body .chart_area{position:relative; padding:0 20px;}
	.modal-body .chart_area .chart_per{position:absolute; top:50%; width:84%; text-align:center; font-size:22px;}

	.modal-body .time_form, .modal-body .book_form{padding-top:30px;}
	.modal-body .ipt_area dt{margin-bottom:5px;}
	.modal-body .btn-center{clear:both; padding-top:20px;}
	.modal-body .ipt_wrap input{width:120px; display:inline-block; margin-right:5px;}
	.modal-body .book_img{padding:30px 0; width:95%; text-align:center;}
	.modal-body .book_img img{border:1px solid #ddd;}
	.modal-body .book_info{text-align:center; width:95%; margin:0 auto; font-size:15px; word-break:keep-all;}
	.modal-body .bookIpt{width:65%; display:inline-block;}
	.modal-body .bookIpt + .btn{background:#efeeee; border:1px solid #ddd;}
	.modal-body .isbn_info{width:95%; text-align:center; padding:20px 0 0;}
	.modal-body .isbn_info img{width:80%;}
	.modal-body .isbn_info p{margin:10px 0 0; font-weight:bold; color:#1969ad; font-size:15px;}
	
	.sel_wrap label,
	.up_sel_wrap label{font-weight:normal; margin-bottom:8px; vertical-align:middle; margin-right:15px;}
	
	#insertTodayModal .book_img,
	#insertTodayModal .book_info{display:none;}
	#insertWeeklyModal .book_info,
	#insertWeeklyModal .book_img{display:none;}
	
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
							<span class="rank_link">
								<p class="rank">지역랭킹 : 상위  &nbsp;&nbsp; 분야 랭킹 : 상위 </p>
								<p class="need" onclick="rankLink()" title="나의 랭킹보기">식물 Lv. </p>
								<!-- <img class="addFriendIcon" src="/studyplus/resources/images/member/addUserIcon.png" data-toggle="modal" data-target="#addFriendModal"> -->
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
										<!-- 페이지 진입시 todayGoalsList() 호출 -->
									</ul>
									<div class="add_btn">
										<a href="#" data-toggle="modal" data-target="#insertTodayModal"></a>
									</div>
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
									<!-- 페이지 진입시 weeklyGoalsList() 호출 -->
								</ul>
								<div class="add_btn">
									<a href="#" data-toggle="modal" data-target="#insertWeeklyModal"></a>
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
						<img class="addFriendIcon" src="/studyplus/resources/images/member/addUserIcon.png" data-toggle="modal" data-target="#addFriendModal">
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
																	+ data + '</span>');
														}
														
													});
													
													$.ajax({
														url : "friendStatus.ms",
														type : "POST",
														data : {
															eachFriendMemberCode : eachFriendMemberCode
														},
														async : false,
														success : function(data){
															
															if(data == 0){
																
																$li.append('<span id="status'+  eachFriendMemberNickname  +'"class="status"></span>');
															}else{
																
																$li.append('<span id="status'+  eachFriendMemberNickname  +'"class="status on"></span>');
															}
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
																
																var year = '0';
																var month = '0';
																var date = '0';
																var day = '0';
																
																for(var i=0; i<data.length; i++){
																	
																	var msg_year = data[i].message_send_date.substring(0, 4);
																	var msg_month = data[i].message_send_date.substring(5, 7);
																	var msg_date = data[i].message_send_date.substring(8, 10);
																	var msg_day = data[i].message_send_date.substring(11, 14);
																	
																	if(year != msg_year || month != msg_month || date != msg_date || day != msg_day){
																		
																		year = msg_year;
																		month = msg_month;
																		date = msg_date;
																		day = msg_day;
																	
																	
																		$('#chatMessageArea').append('<div style="position:relative">'
																								+ '<div style="position:absolute; margin-top:-7px; margin-left:38%; background:white; text-align:center; font-size : 7px;">' + year + "년 " + month + "월 " + date + "일 " + day + '</div>'
																								+ '<hr>'
																								+ '</div>');
																	}
																	
																	if(data[i].sender_nickName == '${loginUser.member_Nickname}'){
																		$('#chatMessageArea').append(
																				'<div style="width:98%; display: inline-block;">' + 
																				'<table style="margin-top : 10px; float:right;">'
																						+ '<tr><td>'
																						+ '<div class="dateArea">'
																						+ data[i].message_send_date.substring(15, 17) + '시'
																						+ data[i].message_send_date.substring(18, 20) + '분' 
																						+ '</div>' 
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
																						+ data[i].message_send_date.substring(15, 17) + '시'
																						+ data[i].message_send_date.substring(18, 20) + '분' 
																						+ '</div>' + '</td></tr>');
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
		
		<button type="button"style="left:50%; margin-left:-250px;height:40px; position:fixed; bottom:0 ;border:1px solid #f1bc3c;border-radius:40px 40px 0 0;background:#f1bc3c;width:500px; color:white; z-index:888;"class="btn btn-danger" onclick="showBlockMain()">차단을 시작하고, 공부 시간 측정하기</button>
		<script>
			function showBlockMain(){
				location.href ="showBlockMain.bl";
			}
		</script>
		<!--  Modal -->
		<jsp:include page="goalsModal.jsp"/>
		<!-- // Modal -->
		
		<!--  Modal -->
		<jsp:include page="../member/friendPart/addFriend.jsp"/>
		<!-- // Modal -->
		
		<!-- Footer -->
		<jsp:include page="../common/footer.jsp"/>
		<!-- // Footer -->
	</div>
	
</body>
</html>