$(function(){
	snsScrollUp();			//메신저 노출
	snsSlideChat();			//채팅 슬라이드
	scrollShadow();			//스크롤박스 하단 그림자
	
	goalAddMdal();			//목표 등록 모달
	modalChart();			//목표등록 모달 내 공부량 차트
	
	//todayChart();			//일간 공부량 차트
	todayDatePicker();		//일간 공부량 날짜선택
	studyTendencyChart();	//공부성향 분석 차트
	
	GoalListChart();		//목표 리스트 노출된 부분 공부량 차트
	
	
	
	
	todayChartTodaydate();
	todayChartChangeDate();
});


//메신저 노출
function snsScrollUp(){
	$(".click_area").click(function(){
		if($(this).hasClass("on") != true){
			getFriendList();
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

//채팅 슬라이드
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

//스크롤박스 하단 그림자
function scrollShadow(){
	// 오늘 목표
	var todayH = $(".today_goals .goals_list").height();
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

//목표 등록 모달
function goalAddMdal(){
	//모달 오픈
	$('#myModal').on('shown.bs.modal', function () {
		$('#myInput').focus();
	});
	
	//목표 시간단위, 페이지단위 등록 탭
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
}

//목표등록 모달 내 공부량 차트
function modalChart(){
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
};

//일간 공부량 차트
function todayChartTodaydate(){
	//페이지 진입시 오늘 날짜 선택
	var now = new Date();
	var year= now.getFullYear();
    var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
    var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
            
    var chan_val = year + '-' + mon + '-' + day;
    $(this).val(chan_val);

	console.log("오늘날짜 : " + chan_val);
	
	var dateVal = chan_val; //컨트롤러에 보낼 날짜
	
	todayChart(dateVal);
}

//일간 공부량 날짜 변경시
function todayChartChangeDate(){
	$("#todayDatePicker").change(function(){
		var dateVal = $("#todayDatePicker").val(); //컨트롤러에 보낼 날짜
		console.log("선택한날짜 : " + dateVal);
		todayChart(dateVal);
	});
}

//일간 공부량 차트
function todayChart(dateVal){
	var ctx = document.getElementById("todayChart").getContext('2d');
	$.ajax({
		url : "studyPlannerTodayChart.sp",
		data : {dateVal : dateVal},
		type : "post",
		success : function(data) {
			
			//console.log(data);
			
			var todayChart = new Chart(ctx, {
				type: 'bar',
				data: {
					labels: ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", 
						"13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"],
						datasets: [{
							//label: '# of Votes',
							data: [23, 3, 5, 2, 3, 1, 2, 3, 4, 5, 6, 12, 12,
								19, 3, 5, 2, 3, 1, 2, 3, 4, 5, 6],
								backgroundColor: [
									'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(255, 159, 64, 0.2)',
									'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(255, 159, 64, 0.2)',
									'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									],
									/*borderColor: [
    					'rgba(255,99,132,1)',
    					'rgba(54, 162, 235, 1)',
    					'rgba(255, 206, 86, 1)',
    					'rgba(75, 192, 192, 1)',
    					'rgba(153, 102, 255, 1)',
    					'rgba(255, 159, 64, 1)',
    					'rgba(255,99,132,1)',
    					'rgba(54, 162, 235, 1)',
    					'rgba(255, 206, 86, 1)',
    					'rgba(75, 192, 192, 1)',
    					'rgba(153, 102, 255, 1)'
    				],*/
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
			
			
		},
		error : function() {
			console.log("에러발생!");
		}
	});
	
}

//일간 공부량 날짜선택
function todayDatePicker(){
	$( "#todayDatePicker" ).datepicker({
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
	}).datepicker("setDate", new Date());
	/* $(".date").click(function(){
		$(".datepicker-here").show();
	}); */
}

//공부성향 분석 차트
function studyTendencyChart(){
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
		'chartDiv': 'studyTendencyChart',
		'chartType': 'radar',
		'chartSize': { width: 500, height: 300 }
	};
	Nwagon.chart(options);
}

//목표 리스트 노출된 부분 공부량 차트 
function GoalListChart(){
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
}
