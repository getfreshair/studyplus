$(function(){
	snsScrollUp();			//메신저 노출
	snsSlideChat();			//채팅 슬라이드
	scrollShadow();			//스크롤박스 하단 그림자

	goalAddMdal();			//목표 등록 모달
	modalChart();			//목표등록 모달 내 공부량 차트

	datePicker();			//데이트피커 날짜선택
	dateTabBtn();			//주간 월간 선택 버튼
	todaydate();			//페이지 진입시 현재 날짜 선택
	todaydateWeekly()		//페이지 진입시 한 주 선택
	todaydateYear();		//페이지 진입시 현재 년도 선택
	todayChartChangeDate();	//일간 공부량 날짜 변경시
	weeklyChartChangeDate(); //주간 공부량 날짜 변경시
	monthlyChartChangeDate();//월간 공부량 날짜 변경시

	studyTendencyChart();	//공부성향 분석 차트

	GoalListChart();		//목표 리스트 노출된 부분 공부량 차트
	

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

//------------------------------------ 일간/주간/월간 차트 ------------------------------------
//페이지 진입시 현재 날짜 선택
function todaydate(){
	var now = new Date();
	var year= now.getFullYear();
	var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();

	var chan_val = year + '-' + mon + '-' + day;
	$(this).val(chan_val);

	var dateVal = chan_val;		//컨트롤러에 보낼 날짜

	$('#todayDatePicker').attr("value",dateVal);
	todayChart(dateVal);		//일간 공부량 차트
	//console.log("왜 안되는것이야 : " + dateVal)
}

//페이지 진입시 한 주 선택
function todaydateWeekly(){
	var now = new Date();
	var year= now.getFullYear();
	var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
	var week = now.getDay();
	
	
	//오늘 달력에 선택된 날짜
	var currentMon = ($(".datepicker:nth-child(2) .-current-").attr("data-month")*1)+1;
	var resultCurrentMon = (currentMon+1)>9 ? ''+(currentMon+1) : '0'+(currentMon+1);
	
	var currentDay = $(".datepicker:nth-child(2) .-current-").attr("data-date");
	var resultCurrentDay = (currentDay)>9 ? ''+(currentDay) : '0'+(currentDay);

	var resultToday = $(".datepicker:nth-child(2) .-current-").attr("data-year") + "-" + currentMon + "-" + resultCurrentDay;
	
	var todayArea = $(".datepicker:nth-child(2) .-current-");
	
	//페이지 진입시 오늘날짜 추출해서 input에 value노출 시키기 
	switch(week){
		case 0 : 
			var firstDate = resultToday;
			var lastDate =
			$(todayArea).next().next().next().next().next().next().attr("data-year") + "-" +
			(($(todayArea).next().next().next().next().next().next().attr("data-month")*1)+1) + "-" +
			$(todayArea).next().next().next().next().next().next().attr("data-date");
			
			$(".weeklyDateCk").text(resultToday+' ~ '+lastDate);
			break;
		case 1 : break;
		case 2 : break;
		case 3 : break;
		case 4 : break;
		case 5 : 
			todayArea.prev().prev().prev().prev().prev().css("background","red"); 
			todayArea.next().css("background","red");
			break;
		case 6 : 
			todayArea.prev().prev().prev().prev().prev().prev().css("background","red"); break;
	}
	
	$("#weeklyDatePicker").click(function(){
		//over된 곳의 날짜를 뽑아와서 / 요일을 추출해서 / bg컬러입히기
		$(".datepicker:nth-child(2) .datepicker--cell").mouseover(function(){
			//해달 셀의 날자 추출
			var pickYear = $(this).attr("data-year");
			var pickMon = $(this).attr("data-month") * 1 + 1;
			var pickDay = $(this).attr("data-date");
			
			var overDate = pickYear + "-" + pickMon  + "-" + pickDay;
			var overWeek = new Date(overDate).getDay(); //over한 날짜의 요일 추출
			var overBg = {"background":"#efefef"}; //over시 적용할 bg
			/*console.log(pickMon)
			console.log(overDate);
			console.log(overWeek);*/
	
			//over시 요일추출해서 bg컬러입힘
			/*switch(overWeek){
				case 0 : 
				case 1 : break;
				case 2 : break;
				case 3 : break;
				case 4 : break;
				case 5 : break;
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
			}*/
			
		}).click(function(){
			//해달 셀의 날자 추출
			var pickYear = $(this).attr("data-year");
			var pickMon = $(this).attr("data-month") * 1 + 1;
			var pickDay = $(this).attr("data-date");
			
			var overDate = pickYear + "-" + pickMon  + "-" + pickDay;
			var overWeek = new Date(overDate).getDay(); //click한 날짜의 요일 추출
			
			//클릭시 해당 주의 날짜를 출력함(노가다의 끝판왕)
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
				
					$("#weeklyDatePicker").attr("value", result);
					$(".weeklyDateCk").text(result);
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
				
					$("#weeklyDatePicker").attr("value", result);
					$(".weeklyDateCk").text(result);
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
				
					$("#weeklyDatePicker").attr("value", result);
					$(".weeklyDateCk").text(result);
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
				
					$("#weeklyDatePicker").attr("value", result);
					$(".weeklyDateCk").text(result);
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
				
					$("#weeklyDatePicker").attr("value", result);
					$(".weeklyDateCk").text(result);
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
					
					$("#weeklyDatePicker").attr("value", result);
					$(".weeklyDateCk").text(result);
					break;
					
				case 6 : //토요일
					var firstYear = $(this).prev().prev().prev().prev().prev().prev().attr("data-year");
					var firstMon = $(this).prev().prev().prev().prev().prev().prev().attr("data-month");
					var firstDate = $(this).prev().prev().prev().prev().prev().prev().attr("data-date");
					
					var resultDate = firstYear + "-" + ((firstMon * 1) +1)  + "-" + firstDate;
					var lastDate = overDate;
					var result = resultDate + ' ~ ' + lastDate;
					
					$("#weeklyDatePicker").attr("value", result);
					$(".weeklyDateCk").text(result);
					break;
			}
				
		});
	});

	var dateVal = $(".weeklyDateCk").text(); //컨트롤러에 보낼 날짜
	console.log("컨트롤러에 보낼 날짜 : " + dateVal);
	weeklyChart(dateVal); //주간 공부량 차트
}

//페이지 진입시 현재 년도 선택
function todaydateYear(){
	var now = new Date();
	var year= now.getFullYear();

	var dateVal = year; 		//컨트롤러에 보낼 날짜

	$('#monthlyDatePicker').attr("value",year);
	monthlyChart(dateVal);		//월간 공부량 차트
}

//일간 공부량 날짜 변경시
function todayChartChangeDate(){
	/*$("#todayDatePicker").change(function(){
		console.log("체인지가 안먹힌다?")
		var dateVal = $("#todayDatePicker").val(); //컨트롤러에 보낼 날짜
		console.log("선택한날짜 : " + dateVal);
		todayChart(dateVal);
	});*/
	
	$("#todayDatePicker").click(function(){
		$(".datepicker:nth-child(1) .datepicker--cell-day").click(function(){
			var dateVal = $(this).attr("data-year") + "-" + (($(this).attr("data-month")*1) +1) + "-" + $(this).attr("data-date");
			//console.log("선택한날짜 : " + dateVal);
			$('#todayDatePicker').attr("value",dateVal);
			todayChart(dateVal);
		});
	});
}

//일간 공부량 차트
function todayChart(dateVal){
	var ctx = document.getElementById("todayChart").getContext('2d');
	//console.log("input의 값은 들어오나?" + dateVal)
	$.ajax({
		url : "studyPlannerTodayChart.sp",
		data : {dateVal : dateVal},
		type : "post",
		success : function(data) {
			//console.log("일간공부량 데이터" + data);
			var arr;
			arr = data.split(",");
			
			for(var i = 0; i < arr.length; i++){
				arr[i] = arr[i]/60;
			}
			
			var todayChart = new Chart(ctx, {
				type: 'bar',
				data: {
					labels: ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", 
						"13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"],
						datasets: [{
							//label: '# of Votes',
							data: [arr[0], arr[1], arr[2], arr[3], arr[4], arr[5], arr[6], arr[7], arr[8], arr[9], arr[10], arr[11], arr[12],
								arr[13], arr[14], arr[15], arr[16], arr[17], arr[18], arr[19], arr[20], arr[21], arr[22], arr[23]],
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
									]
						}]
				},
				options: {
					legend: {display: false,},
					events: [false],
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

//주간 공부량 날짜 변경시
function weeklyChartChangeDate(){
	/*$("#weeklyDatePicker").change(function(){
		var dateVal = $("#weeklyDatePicker").val(); //컨트롤러에 보낼 날짜
		console.log("선택한날짜 : " + dateVal);
		weeklyChart(dateVal);
	});*/
	$("#weeklyDatePicker").click(function(){
		$(".datepicker--cell-day").click(function(){
			var dateVal = $(this).attr("data-year");
			//console.log("선택한날짜 : " + dateVal);
			monthlyChart(dateVal);		
		});
	});		
	
}

//주간 공부량 차트
function weeklyChart(dateVal){
	var ctx = document.getElementById("weeklyChart").getContext('2d');
	$.ajax({
		url : "studyPlannerWeeklyChart.sp",
		data : {dateVal : dateVal},
		type : "post",
		success : function(data) {
			
			var arr;
			arr = data.split(",");
			
			for(var i = 0; i < arr.length; i++){
				arr[i] = arr[i]/60;
			}
			
			var weeklyChart = new Chart(ctx, {
				type: 'bar',
				data: {
					labels: ["일", "월", "화", "수", "목", "금", "토"],
						datasets: [{
							//label: '# of Votes',
							data: [arr[0], arr[1], arr[2], arr[3], arr[4], arr[5], arr[6]],
								backgroundColor: [
									'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(255, 159, 64, 0.2)',
									'rgba(255, 99, 132, 0.2)',
									]
						}]
				},
				options: {
					legend: {display: false,},
					events: [false],
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

//월간 공부량 날짜 변경시
function monthlyChartChangeDate(){
	$("#monthlyDatePicker").click(function(){
		$(".datepicker--cell-year").click(function(){
			var dateVal = $(this).attr("data-year");
			//console.log("선택한날짜 : " + dateVal);
			monthlyChart(dateVal);		
		});
	});
}

//월간 공부량 차트
function monthlyChart(dateVal){
	var ctx = document.getElementById("monthlyChart").getContext('2d');
	$.ajax({
		url : "studyPlannerMonthlyChart.sp",
		data : {dateVal : dateVal},
		type : "post",
		success : function(data) {
			//console.log(data);
			
			var arr;
			arr = data.split(",");
			
			for(var i = 0; i < arr.length; i++){
				arr[i] = arr[i]/60;
			}
			
			var monthlyChart = new Chart(ctx, {
				type: 'bar',
				data: {
					labels: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
						datasets: [{
							//label: '# of Votes',
							data: [arr[0], arr[1], arr[2], arr[3], arr[4], arr[5], arr[6], arr[7], arr[8], arr[9], arr[10], arr[11], arr[12]],
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
									]
						}]
				},
				options: {
					legend: {display: false,},
					events: [false],
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

//데이트피커
function datePicker(){
	
	$('#todayDatePicker').datepicker({
	    language: 'ko',
	    dateFormat: "yyyy-mm-dd",
	    autoClose: true,
	    todayButton: new Date(),
	    /*moveToOtherYearsOnSelect: false,
	    onSelect: function(formattedDate, date, inst) {
	        $(inst.el).trigger('change');
	    }*/
	});
	
	$('#weeklyDatePicker').datepicker({
	    language: 'ko',
	    dateFormat: "yyyy-mm-dd",
	    autoClose: true
	});

	
	$('#monthlyDatePicker').datepicker({
	    language: 'ko',
	    dateFormat: "yyyy",
	    autoClose: true
	});
	
	
	
	//일간 공부량 날짜선택
	/*$( "#todayDatePicker" ).datepicker({
		dateFormat: 'yy-mm-dd',
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNames: ['일','월','화','수','목','금','토'],
		dayNamesShort: ['일','월','화','수','목','금','토'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		showMonthAfterYear: true,
		yearSuffix: '년',
		weekends : true,
		maxDate: 'today'
	}).datepicker("setDate", new Date());
	
	//주간 공부량 날짜선택
	$( "#weeklyDatePicker" ).datepicker({
		dateFormat: 'yy-mm-dd',
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNames: ['일','월','화','수','목','금','토'],
		dayNamesShort: ['일','월','화','수','목','금','토'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		showMonthAfterYear: true,
		//changeMonth: true,
		//changeYear: true,
		showWeek: true,
		maxDate: 'today',
		beforeShow: function(elem, ui) {
		      $(ui.dpDiv).on('click', 'tbody .ui-datepicker-week-col', function() {
		      	$(elem).val('Week ' + $(this).text()).datepicker( "hide" );
		      });
		    },
		yearSuffix: '년',
		weekends : true
	}).datepicker("setDate", new Date());
	
	//월간 공부량 날짜선택
	$( "#monthlyDatePicker" ).datepicker({
		dateFormat: 'yy-mm',
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNames: ['일','월','화','수','목','금','토'],
		dayNamesShort: ['일','월','화','수','목','금','토'],
		dayNamesMin: ['일','월','화','수','목','금','토'],
		showMonthAfterYear: true,
		//changeMonth: true,
		//changeYear: true,
		yearSuffix: '년',
		weekends : true
	}).datepicker("setDate", new Date());*/
}

//주간 월간 선택 버튼
function dateTabBtn(){
	//페이지 진입시 default
	$("#weeklyChart").show();
	$("#weeklyDatePicker").show();
	$(".weeklyDateCk").show();
	$("#monthlyChart").hide();
	$("#monthlyDatePicker").hide();
	$("#weeklyBtn").click(function(){ //주간공부량 선택시
		$("#monthlyChart").hide();
		$("#monthlyDatePicker").hide();
		$("#weeklyChart").show();
		$("#weeklyDatePicker").show();
		$(".weeklyDateCk").show();
	});
	$("#monthlyBtn").click(function(){ //월간공부량 선택시
		$("#weeklyChart").hide();
		$("#weeklyDatePicker").hide();
		$(".weeklyDateCk").hide();
		$("#monthlyChart").show();
		$("#monthlyDatePicker").show();
	});
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
