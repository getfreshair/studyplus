$(function(){
	snsScrollUp();			//메신저 노출
	snsSlideChat();			//채팅 슬라이드
	scrollShadow();			//스크롤박스 하단 그림자
	//-------------- 분석 --------------
	datePicker();			//데이트피커 날짜선택
	dateTabBtn();			//주간 월간 선택 버튼
	todaydate();			//페이지 진입시 현재 날짜 선택
	todaydateWeekly();		//페이지 진입시 한 주 선택
	todaydateYear();		//페이지 진입시 현재 년도 선택
	todayChartChangeDate();	//일간 공부량 날짜 변경시
	weeklyChartChangeDate(); //주간 공부량 날짜 변경시
	monthlyChartChangeDate();//월간 공부량 날짜 변경시
	studyTendencyChart();	//공부성향 분석 차트
	//-------------- 오늘의 목표 --------------
	todayGoalsList();		//오늘의 목표 리스트
	goalAddMdal();			//목표 등록 모달
	bookIsbn();				//isbn 책검색

});


//메신저 노출
function snsScrollUp(){
	$(".click_area").click(function(){
		if($(this).hasClass("on") != true){
			getFriendList();
			$(this).addClass("on");
			$(".addFriendIcon").animate({
				"bottom":"423px"
			}, 400);
			$(".sns_wrap").animate({
				"height":"460px"
			}, 400);
		}else{
			$(this).removeClass("on");
			$(".addFriendIcon").animate({
				"bottom":"6px"
			}, 400);
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
}

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
	//console.log("왜 안되는것이야 : " + dateVal)	

	$('#todayDatePicker').attr("value",dateVal);
	todayChart(dateVal);		//일간 공부량 차트
}

//페이지 진입시 한 주 선택
function todaydateWeekly(){
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
			
			$("#weeklyDatePicker").attr(firstDate+' ~ '+lastDate);
			$(".weeklyDateCk").text(firstDate+' ~ '+lastDate);
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
			
			$("#weeklyDatePicker").attr(firstDate+' ~ '+lastDate);
			$(".weeklyDateCk").text(firstDate+' ~ '+lastDate);
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
			
			$("#weeklyDatePicker").attr(firstDate+' ~ '+lastDate);
			$(".weeklyDateCk").text(firstDate+' ~ '+lastDate);
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
			
			$("#weeklyDatePicker").attr(firstDate+' ~ '+lastDate);
			$(".weeklyDateCk").text(firstDate+' ~ '+lastDate);
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
			
			$("#weeklyDatePicker").attr(firstDate+' ~ '+lastDate);
			$(".weeklyDateCk").text(firstDate+' ~ '+lastDate);
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
			
			$("#weeklyDatePicker").attr(firstDate+' ~ '+lastDate);
			$(".weeklyDateCk").text(firstDate+' ~ '+lastDate);
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
			
			$("#weeklyDatePicker").attr(firstDate+' ~ '+lastDate);
			$(".weeklyDateCk").text(firstDate+' ~ '+lastDate);
			break;
	}
	var dateVal = $(".weeklyDateCk").text(); //컨트롤러에 보낼 날짜
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
	
	$("#weeklyDatePicker").click(function(){
		//over된 곳의 날짜를 뽑아와서 / 요일을 추출해서 / bg컬러입히기
		$(".datepicker:nth-child(2) .datepicker--cell").mouseover(function(){
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
				
			var dateVal = $(".weeklyDateCk").text(); //컨트롤러에 보낼 날짜
			weeklyChart(dateVal); //주간 공부량 차트
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
				names: ['언어형', '직관형',	'숙고형', '순차형',
					'시각형',	'감각형',	'활동형',	'총체형']
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


//------------------------------------ 오늘의 목표 ------------------------------------
//오늘의 목표 날짜, 오늘의 목표 리스트
function todayGoalsList(){
	//이번주 날짜 출력
	var now = new Date();
	var year= now.getFullYear();
	var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
	var chan_val = year + '-' + mon + '-' + day;
	

	//$today 오늘날짜 2018-11-6
	var $todayVal= new Date(Date.parse(now) + 0 * 1000 * 60 * 60 * 24).getFullYear() + "/" + (new Date(Date.parse(now) + 0 * 1000 * 60 * 60 * 24).getMonth() +1) + "/" + new Date(Date.parse(now) + 0 * 1000 * 60 * 60 * 24).getDate();
	//$today 오늘
	var $today = (new Date(Date.parse(now) + 0 * 1000 * 60 * 60 * 24).getDate()); 
	
	for (var i = 1; i < 7; i++) { 
		//$prevVal1 -> 1일전 날짜 2018-11-6 ~  $prevVal6 -> 6일전 날짜
		eval('var $prevVal' + i + '= new Date(Date.parse(now) - i * 1000 * 60 * 60 * 24).getFullYear() + "/" + (new Date(Date.parse(now) - i * 1000 * 60 * 60 * 24).getMonth() +1) + "/" + new Date(Date.parse(now) - i * 1000 * 60 * 60 * 24).getDate()');
		//$nextVal1 -> 1일뒤 날짜 2018-11-6 ~  $nextVal6 -> 6일뒤 날짜
		eval('var $nextVal' + i + '= new Date(Date.parse(now) + i * 1000 * 60 * 60 * 24).getFullYear() + "/" + (new Date(Date.parse(now) + i * 1000 * 60 * 60 * 24).getMonth() +1) + "/" + new Date(Date.parse(now) + i * 1000 * 60 * 60 * 24).getDate()');
	
		//$prev1 -> 1일전 ~ $prev6 -> 6일전 
		eval('var $prev' + i + '= (new Date(Date.parse(now) - i * 1000 * 60 * 60 * 24).getDate())');
		//$next1 -> 1일뒤 ~ $next6 -> 6일뒤 
		eval('var $next' + i + '= (new Date(Date.parse(now) + i * 1000 * 60 * 60 * 24).getDate())');
	}
	

	var $todayPoint = $(".today_point span");
	var $weekday0 = $(".time_form .sel_wrap input");
	var $weekday1 = $(".book_form .sel_wrap input");
	var $weekday2 = $(".time_form .up_sel_wrap input");
	var $weekday3 = $(".book_form .up_sel_wrap input");
	
	//노가다 눈물난다..
	switch(now.getDay()){
		case 0 : //일요일
			$todayPoint.eq(0).text($today).addClass('on').attr("value",$todayVal);
			$todayPoint.eq(1).text($next1).attr("value",$nextVal1);
			$todayPoint.eq(2).text($next2).attr("value",$nextVal2);
			$todayPoint.eq(3).text($next3).attr("value",$nextVal3);
			$todayPoint.eq(4).text($next4).attr("value",$nextVal4);
			$todayPoint.eq(5).text($next5).attr("value",$nextVal5);
			$todayPoint.eq(6).text($next6).attr("value",$nextVal6);
			
			//모달 요일 선택에도 날짜 넣어줌
			for(var i = 0; i < 4; i++){
				eval('$weekday' + i + '.eq(0).attr("value",$todayVal)');
				eval('$weekday' + i + '.eq(1).attr("value",$nextVal1)');
				eval('$weekday' + i + '.eq(2).attr("value",$nextVal2)');
				eval('$weekday' + i + '.eq(3).attr("value",$nextVal3)');
				eval('$weekday' + i + '.eq(4).attr("value",$nextVal4)');
				eval('$weekday' + i + '.eq(5).attr("value",$nextVal5)');
				eval('$weekday' + i + '.eq(6).attr("value",$nextVal6)');
			}
			
			break;
		case 1 : //월요일
			$todayPoint.eq(0).text($prev1).attr("value",$prevVal1).addClass('la');
			$todayPoint.eq(1).text($today).addClass('on').attr("value",$todayVal);
			$todayPoint.eq(2).text($next1).attr("value",$nextVal1);
			$todayPoint.eq(3).text($next2).attr("value",$nextVal2);
			$todayPoint.eq(4).text($next3).attr("value",$nextVal3);
			$todayPoint.eq(5).text($next4).attr("value",$nextVal4);
			$todayPoint.eq(6).text($next5).attr("value",$nextVal5);
			
			for(var i = 0; i < 4; i++){
				eval('$weekday' + i + '.eq(0).attr("value",$prevVal1)');
				eval('$weekday' + i + '.eq(1).attr("value",$todayVal)');
				eval('$weekday' + i + '.eq(2).attr("value",$nextVal1)');
				eval('$weekday' + i + '.eq(3).attr("value",$nextVal2)');
				eval('$weekday' + i + '.eq(4).attr("value",$nextVal3)');
				eval('$weekday' + i + '.eq(5).attr("value",$nextVal4)');
				eval('$weekday' + i + '.eq(6).attr("value",$nextVal5)');
			}

			break;
		case 2 : //화요일
			$todayPoint.eq(0).text($prev2).attr("value",$prevVal2).addClass('la');
			$todayPoint.eq(1).text($prev1).attr("value",$prevVal1).addClass('la');
			$todayPoint.eq(2).text($today).addClass('on').attr("value",$todayVal);
			$todayPoint.eq(3).text($next1).attr("value",$nextVal1);
			$todayPoint.eq(4).text($next2).attr("value",$nextVal2);
			$todayPoint.eq(5).text($next3).attr("value",$nextVal3);
			$todayPoint.eq(6).text($next4).attr("value",$nextVal4);
			
			for(var i = 0; i < 4; i++){
				eval('$weekday' + i + '.eq(0).attr("value",$prevVal2)');
				eval('$weekday' + i + '.eq(1).attr("value",$prevVal1)');
				eval('$weekday' + i + '.eq(2).attr("value",$todayVal)');
				eval('$weekday' + i + '.eq(3).attr("value",$nextVal1)');
				eval('$weekday' + i + '.eq(4).attr("value",$nextVal2)');
				eval('$weekday' + i + '.eq(5).attr("value",$nextVal3)');
				eval('$weekday' + i + '.eq(6).attr("value",$nextVal4)');
			}
			
			break;
		case 3 : //수요일
			$todayPoint.eq(0).text($prev3).attr("value",$prevVal3).addClass('la');
			$todayPoint.eq(1).text($prev2).attr("value",$prevVal2).addClass('la');
			$todayPoint.eq(2).text($prev1).attr("value",$prevVal1).addClass('la');
			$todayPoint.eq(3).text($today).addClass('on').attr("value",$todayVal);
			$todayPoint.eq(4).text($next1).attr("value",$nextVal1);
			$todayPoint.eq(5).text($next2).attr("value",$nextVal2);
			$todayPoint.eq(6).text($next3).attr("value",$nextVal3);
			
			for(var i = 0; i < 4; i++){
				eval('$weekday' + i + '.eq(0).attr("value",$prevVal3)');
				eval('$weekday' + i + '.eq(1).attr("value",$prevVal2)');
				eval('$weekday' + i + '.eq(2).attr("value",$prevVal1)');
				eval('$weekday' + i + '.eq(3).attr("value",$todayVal)');
				eval('$weekday' + i + '.eq(4).attr("value",$nextVal1)');
				eval('$weekday' + i + '.eq(5).attr("value",$nextVal2)');
				eval('$weekday' + i + '.eq(6).attr("value",$nextVal3)');
			}
			
			break;
		case 4 : //목요일
			$todayPoint.eq(0).text($prev4).attr("value",$prevVal4).addClass('la');
			$todayPoint.eq(1).text($prev3).attr("value",$prevVal3).addClass('la');
			$todayPoint.eq(2).text($prev2).attr("value",$prevVal2).addClass('la');
			$todayPoint.eq(3).text($prev1).attr("value",$prevVal1).addClass('la');
			$todayPoint.eq(4).text($today).addClass('on').attr("value",$todayVal);
			$todayPoint.eq(5).text($next1).attr("value",$nextVal1);
			$todayPoint.eq(6).text($next2).attr("value",$nextVal2);
			
			for(var i = 0; i < 4; i++){
				eval('$weekday' + i + '.eq(0).attr("value",$prevVal4)');
				eval('$weekday' + i + '.eq(1).attr("value",$prevVal3)');
				eval('$weekday' + i + '.eq(2).attr("value",$prevVal2)');
				eval('$weekday' + i + '.eq(3).attr("value",$prevVal1)');
				eval('$weekday' + i + '.eq(4).attr("value",$todayVal)');
				eval('$weekday' + i + '.eq(5).attr("value",$nextVal1)');
				eval('$weekday' + i + '.eq(6).attr("value",$nextVal2)');
			}
			
			break;
		case 5 : //금요일
			$todayPoint.eq(0).text($prev5).attr("value",$prevVal5).addClass('la');
			$todayPoint.eq(1).text($prev4).attr("value",$prevVal4).addClass('la');
			$todayPoint.eq(2).text($prev3).attr("value",$prevVal3).addClass('la');
			$todayPoint.eq(3).text($prev2).attr("value",$prevVal2).addClass('la');
			$todayPoint.eq(4).text($prev1).attr("value",$prevVal1).addClass('la');
			$todayPoint.eq(5).text($today).addClass('on').attr("value",$todayVal);
			$todayPoint.eq(6).text($next1).attr("value",$nextVal1);
			
			for(var i = 0; i < 4; i++){
				eval('$weekday' + i + '.eq(0).attr("value",$prevVal5)');
				eval('$weekday' + i + '.eq(1).attr("value",$prevVal4)');
				eval('$weekday' + i + '.eq(2).attr("value",$prevVal3)');
				eval('$weekday' + i + '.eq(3).attr("value",$prevVal2)');
				eval('$weekday' + i + '.eq(4).attr("value",$prevVal1)');
				eval('$weekday' + i + '.eq(5).attr("value",$todayVal)');
				eval('$weekday' + i + '.eq(6).attr("value",$nextVal1)');
			}
			
			break;
		case 6 : //토요일
			$todayPoint.eq(0).text($prev6).attr("value",$prevVal6).addClass('la');
			$todayPoint.eq(1).text($prev5).attr("value",$prevVal5).addClass('la');
			$todayPoint.eq(2).text($prev4).attr("value",$prevVal4).addClass('la');
			$todayPoint.eq(3).text($prev3).attr("value",$prevVal3).addClass('la');
			$todayPoint.eq(4).text($prev2).attr("value",$prevVal2).addClass('la');
			$todayPoint.eq(5).text($prev1).attr("value",$prevVal1).addClass('la');
			$todayPoint.eq(6).text($today).addClass('on').attr("value",$todayVal);
			
			for(var i = 0; i < 4; i++){
				eval('$weekday' + i + '.eq(0).attr("value",$prevVal6)');
				eval('$weekday' + i + '.eq(1).attr("value",$prevVal5)');
				eval('$weekday' + i + '.eq(2).attr("value",$prevVal4)');
				eval('$weekday' + i + '.eq(3).attr("value",$prevVal3)');
				eval('$weekday' + i + '.eq(4).attr("value",$prevVal2)');
				eval('$weekday' + i + '.eq(5).attr("value",$prevVal1)');
				eval('$weekday' + i + '.eq(6).attr("value",$todayVal)');
			}

			break;
	}
	
	//오늘날짜 리스트 default로 출력(아래 함수 호출)
	todayGoalsList($todayVal);
	//주간목표 리스트 default로 출력(아래 함수 호출)
	weeklyGoalsList($todayVal);
	
	//날짜 선택시 해당 날짜의 리스트 출력
	$(".today_point li span").click(function(){
		
		var $todayVal = $(this).attr("value");
		
		$(".today_goals .goals_list").empty();
		todayGoalsList($todayVal);
		
		//날짜 선택시 bg컬러 효과
		$(".today_point li span").removeClass('ov');
		if(!$(this).hasClass('on')){
			$(this).addClass('ov');
		}
	});
	
	
	//오늘날짜 리스트 default로 출력
	function todayGoalsList($todayVal){
		$.ajax({
			url : "todayGoalsList.sp",  
			data : {dateVal : $todayVal}, //오늘날짜 보냄
			type : "post",
			success : function(data) {
				
				$(".today_goals .goals_list").empty();
				for (var i = 0; i < data.length; i++) {
					
					var goalCode = data[i].GOAL_CODE; 				//목표코드
					var content = data[i].GOAL_CONTENT;				//목표명
					//var type = data[i].GOAL_TYPE == 0?"페이지":"시간"; //0일경우 페이지, 1일경우 시간
					var type = data[i].GOAL_TYPE;					//0일경우 페이지, 1일경우 시간
					var achiev = data[i].GOAL_ACHIEVEAMOUNT; 		//달성량
					var goalAmount = data[i].GOAL_GOALAMOUNT; 		//목표량
					var achievPer = ((data[i].GOAL_ACHIEVEAMOUNT / data[i].GOAL_GOALAMOUNT) * 100).toFixed(0); //달성률
					var shortfallPer = 100 - achievPer; 			//미달성률
					var division = data[i].GOAL_DIVISION;			//0일경우 일간묙표, 1일경우 주간목표
					var enrolldate = data[i].GOAL_ENROLLDATE;		//목표날짜 
					var goalISBN = data[i].GOAL_ISBN;				//isbn code

					//목표 타입이 시간일 경우 시간,분으로 변경
					var dataType;
					if(type != 0){
						var goalAmountHour = Math.floor(((goalAmount/60)/60)%24);	//목표량 시간
						var goalAmountMin = ((goalAmount/60)%60);					//목표량 분
						var achievHour = Math.floor(((achiev/60)/60)%24);			//달성량 시간
						var achievMin = ((achiev/60)%60);							//달성량 분
						
						dataType = achievHour + "시간 " + achievMin + "분"  + ' / ' + goalAmountHour + "시간 " + goalAmountMin + "분";
					}else{
						dataType = achiev  + ' / ' + goalAmount + " 페이지";
					}
					
					
					
					$('.today_goals .goals_list').append('<li value="'+ goalCode +'">'
							 + '<div class="left_area">'
							 + '<div class="donut_area">'
							 + '<canvas id="today_donut'+ i +'" width="70" height="70"></canvas>'
							 + '<span class="chart_per">' + achievPer + '%' + '</span>'
							 + '</div>'
							 + '</div>'
							 + '<div class="right_area" value="' + data[i].GOAL_TYPE + '">' 
							 + '<p class="tit">' + content + '</p>'
							 + '<p class="per">' + dataType
							 + '</p>'
							 + '</div>'
							 + '</li>');
					
					//목표 리스트 노출된 부분 공부량 차트 (아래 함수 호출)
					GoalListChart(achievPer, shortfallPer, i);

					
					//목표 리스트 각 목표 클릭시 상세 팝업창 노출(아래 함수 호출)
					todayGoalDetail(goalCode, content, goalAmount, achiev, goalAmountHour, goalAmountMin, achievHour, 
							achievMin, achievPer, shortfallPer, goalISBN);
					
				}
			},
			error : function() {
				console.log("에러발생!");
			}
		});
	}
	
	
	//이번주 주간 목표 리스트 default로 출력
	function weeklyGoalsList($todayVal){
		$.ajax({
			url : "weeklyGoalsList.sp",
			data : {dateVal : $todayVal},
			type : "post",
			success : function(data){
				
				//사용할 배열 변수 선언
				var weekGoalCode = new Array();
				var weekWeek = new Array();
				var weekDay = new Array();
				var weekAchieveAmount = new Array();
				var weekGoalAmount = new Array();
				for(var key in data[0]){
					for(var i = 0; i < data[0][key].length; i++){

						var goalCode = data[0][key][i].goalCode;			//목표코드
						var content = data[0][key][i].goalContent;			//목표명
						var type = data[0][key][i].goalType;				//0일경우 페이지, 1일경우 시간
						var achiev = data[0][key][i].goalAchieveAmount;		//달성량
						var goalAmount = data[0][key][i].goalGoalAmount;	//목표량
						
						var achievPer = ((data[0][key][i].goalAchieveAmount / data[0][key][i].goalGoalAmount) * 100).toFixed(0); //달성률
						var shortfallPer = 100 - achievPer;					//미달성률
						
						var week = data[0][key][i].week;					//목표 요일
						var todayOrWeek = data[0][key][i].goalDivision;		//0일경우 오늘목표, 1일경우 주간목표
						var enrolldate = data[0][key][i].dateString;		//목표날짜

						
						weekGoalCode[i] = data[0][key][i].goalCode;						//이번주 중 등록한 목표코드들
						weekWeek[i] = data[0][key][i].week;								//이번주 중 선택한 요일들
						weekDay[i] = ((data[0][key][i].dateString).substr(0, 10)).replace(/-/g,'/');	//이번주 중 선택한 날짜들
						weekAchieveAmount[i] = data[0][key][i].goalAchieveAmount;		//이번주 중 달성량들
						weekGoalAmount[i] = data[0][key][i].goalGoalAmount;				//이번주 중 목표량들
						
					}
					
					var totalWeekWeek = "";
					var totalAchieveAmount = 0;
					var totalWeekGoalAmount = 0;
					for(var i = 0; i < weekGoalCode.length; i++){
						totalWeekWeek += weekWeek[i] + ", ";				//이번주 선택한 요일들(월,화,)
						totalAchieveAmount += weekAchieveAmount[i];			//이번주 총 달성량
						totalWeekGoalAmount += weekGoalAmount[i];			//이번주 총 목표량
					}
					totalWeekWeek = totalWeekWeek.substring(0, totalWeekWeek.length -2); 	//이번주 선택한 요일들(월,화)
					
					
					//목표 타입이 시간일 경우 시간,분으로 변경
					var dataType;
					if(type != 0){
						var achievHour = Math.floor(((totalAchieveAmount/60)/60)%24);			//총 달성량 시간
						var achievMin = ((totalAchieveAmount/60)%60);							//총 달성량 분
						var goalAmountHour = Math.floor(((totalWeekGoalAmount/60)/60)%24);		//총 목표량 시간
						var goalAmountMin = ((totalWeekGoalAmount/60)%60);						//총 목표량 분
						
						dataType = achievHour + "시간 " + achievMin + "분"  + ' / ' + goalAmountHour + "시간 " + goalAmountMin + "분";
					}else{
						dataType = achiev  + ' / ' + goalAmount + " 페이지";
					}
					
					
					$('.weekly_goals .goals_list').append('<li value="'+ goalCode +'">'
							+ '<div class="left_area">'
							+ '<div class="donut_area">'
							+ '<canvas id="weekly_donut'+ i +'" width="70" height="70"></canvas>'
							+ '<span class="chart_per">' + achievPer + '%' + '</span>'
							+ '</div>'
							+ '</div>'
							+ '<div class="right_area" value="' + type + '">' 
							+ '<p class="tit">' + content + ' <span class="week">(' + totalWeekWeek + ')</span></p>'
							+ '<p class="per">' + dataType
							+ '</p>'
							+ '</div>'
							+ '</li>');
				

					
					//for(var i = 0; i < data[0][key].length; i++){
						//목표 리스트 노출된 부분 공부량 차트 (아래 함수 호출)
						GoalListChart2(achievPer, shortfallPer, i);
						//console.log(i)
					//}
					//목표 리스트 각 목표 클릭시 상세 팝업창 노출(아래 함수 호출)
					weeklyGoalDetail(goalCode, content, goalAmount, achiev, goalAmountHour, goalAmountMin, 
							achievHour, achievMin, achievPer, shortfallPer, enrolldate, weekDay);
				
				}
			},
			error : function(){
				console.log("주간에러발생!");
			}
		});
	}
	
}


//오늘의 목표 리스트 노출된 부분 공부량 차트 
function GoalListChart(achievPer, shortfallPer, i){
	var ctx = document.getElementById("today_donut"+i).getContext('2d');
	var today_donut = new Chart(ctx, {
		type: 'doughnut',
		data: data = {
				datasets: [{
					data: [achievPer, shortfallPer],
					backgroundColor: ['#36a2eb']
				}],
		},
		options: {
			events: [false],
		}
	});	
}

//주간 목표 리스트 노출된 부분 공부량 차트 
function GoalListChart2(achievPer, shortfallPer, i){
	var ctx = document.getElementById("weekly_donut"+i).getContext('2d');
	var today_donut = new Chart(ctx, {
		type: 'doughnut',
		data: data = {
				datasets: [{
					data: [achievPer, shortfallPer],
					backgroundColor: ['#36a2eb']
				}],
		},
		options: {
			events: [false],
		}
	});	
}


//오늘의 목표 리스트, 각 목표 클릭시 상세 팝업창 노출
function todayGoalDetail(goalCode, content, goalAmount, achiev, goalAmountHour, goalAmountMin, achievHour, 
						achievMin, achievPer, shortfallPer, goalISBN){
	
	$(".today_goals li .right_area").click(function(){
		
		var liIndex = $(this).parent().val();
		
		if($(this).attr("value") == 1){ //타입이 시간일경우
			
			$("#detailViewModal .tab button:nth-child(1)").attr('disabled',false).addClass('on');
			$("#detailViewModal .tab button:nth-child(2)").attr('disabled',true).removeClass('on');
			$('#detailViewModal .time_form').css("display","block");
			$('#detailViewModal .book_form').css("display","none");
			
			if(liIndex == goalCode){
				$(this).attr({"data-toggle":"modal", "data-target":"#detailViewModal"});
				$("#detailViewModal .time_form #goalName").attr("value",content);
				$("#detailViewModal .time_form #goalTime").attr("value",goalAmountHour);
				$("#detailViewModal .time_form #goalMin").attr("value",goalAmountMin);
				$("#detailViewModal .time_form #achiev").text(achievHour + "시간 " + achievMin + "분");
				$("#detailViewModal .time_form #goalAmount").text(goalAmountHour + "시간 " + goalAmountMin + "분");
				$("#detailViewModal .time_form .chart_per").text(achievPer + "%");
				
				$("#detailViewModal .time_form").parent().attr("action","TodayTimeGoalUpdateModal.sp?liIndex=" + liIndex);

				//모달 내 차트
				var ctx = document.getElementById("today_Modal_donut").getContext('2d');
				var today_donut = new Chart(ctx, {
					type: 'doughnut',
					data: data = {
							datasets: [{
								data: [achievPer, shortfallPer],
								backgroundColor: ['#36a2eb']
							}],
							labels: ['달성%','미달성%']
					}
				});
			}
			
		}else{ //타입이 페이지일경우
			
			$("#detailViewModal .tab button:nth-child(1)").attr('disabled',true).removeClass('on');
			$("#detailViewModal .tab button:nth-child(2)").attr('disabled',false).addClass('on');
			$('#detailViewModal .time_form').css("display","none");
			$('#detailViewModal .book_form').css("display","block");
			
			if(liIndex == goalCode){
				$(this).attr({"data-toggle":"modal", "data-target":"#detailViewModal"});
				$("#detailViewModal .book_form #goalName").attr("value",content);
				$("#detailViewModal .book_form #goalPage").attr("value",goalAmount);
				$("#detailViewModal .book_form #goalAchiev").attr("value",achiev);
				$("#detailViewModal .book_form .bookIpt").attr("value",goalISBN);
				
				$("#detailViewModal .book_form").parent().attr("action","TodayBookGoalUpdateModal.sp?liIndex=" + liIndex);
				
				if($("#detailViewModal .book_form .bookIpt").val() != null){
					$.ajax({
						url : "bookIsbn.sp",
						data : {searchBook : goalISBN},
						type : "get",
						success : function(data) {
							
							var object = JSON.parse(data);
							//console.log(object);
							
							//$(".bookIpt").attr("value", object.items[0].isbn);
							$(".book_img").append().html('<img src="' + object.items[0].image + '">');
							$(".book_info").append().html(object.items[0].title);
							
							
							$("#bookBtn").click(function(){
								var searchBook = ($(".bookIpt").val()).replace(/ /g,"");
								console.log(searchBook);
								$.ajax({
									url : "bookIsbn.sp",
									data : {searchBook : searchBook},
									type : "get",
									success : function(data) {
										console.log("검색한 데이터 : " + data)
										
										var object = JSON.parse(data);
										console.log(object);
										
										console.log(object.items[0].title);
										console.log(object.items[0].image);
										console.log(object.items[0].isbn);
										
										//$(".bookIpt").attr("value", object.items[0].isbn);
										$(".book_img").append().html('<img src="' + object.items[0].image + '">');
										$(".book_info").append().html(object.items[0].title);
									},
									error : function() {
										console.log("에러발생!");
									}
								});
							});
							
							
							
						},
						error : function() {
							console.log("에러발생!");
						}
					});
				}
				
			}
		}
		
		/*$("#saveBtn").click(function(){
			alert("저장시 주간목표로 등록 한 데이터는 전부 변경됩니다.")
		});*/
		
	});
}

//주간 목표 리스트, 각 목표 클릭시 상세 팝업창 노출
function weeklyGoalDetail(goalCode, content, goalAmount, achiev, goalAmountHour, goalAmountMin, 
		achievHour, achievMin, achievPer, shortfallPer, enrolldate, weekDay){
	
	$(".weekly_goals li .right_area").click(function(){
		
		var liIndex = $(this).parent().val();
		
		if($(this).attr("value") == 1){ //타입이 시간일경우
			
			$("#weeklyDetailViewModal .tab button:nth-child(1)").attr('disabled',false).addClass('on');
			$("#weeklyDetailViewModal .tab button:nth-child(2)").attr('disabled',true).removeClass('on');
			$('#weeklyDetailViewModal .time_form').css("display","block");
			$('#weeklyDetailViewModal .book_form').css("display","none");
			
			if(liIndex == goalCode){
				$(this).attr({"data-toggle":"modal", "data-target":"#weeklyDetailViewModal"});
				$("#weeklyDetailViewModal .time_form #goalName").attr("value",content);
				$("#weeklyDetailViewModal .time_form #goalTime").attr("value",goalAmountHour);
				$("#weeklyDetailViewModal .time_form #goalMin").attr("value",goalAmountMin);
				$("#weeklyDetailViewModal .time_form #achiev").text(achievHour + "시간 " + achievMin + "분");
				$("#weeklyDetailViewModal .time_form #goalAmount").text(goalAmountHour + "시간 " + goalAmountMin + "분");
				$("#weeklyDetailViewModal .time_form .chart_per").text(achievPer + "%");
				
				//등록시 선택한 요일 체크
				var weekIpt = $("#weeklyDetailViewModal .up_sel_wrap input");
				for(var i = 0; i < weekDay.length; i++){
					for(var j = 0; j < 8; j++){
						if(weekIpt.eq(j).val() == weekDay[i]){
							weekIpt.eq(j).attr("checked", true);
						}
					}
				}
				
				//submit버튼 클릭시 업데이트하는 맵핑주소로 변경
				$("#weeklyDetailViewModal .time_form").parent().attr("action","TodayTimeGoalUpdateModal.sp?liIndex=" + liIndex);

				//모달 내 차트
				var ctx = document.getElementById("weekly_Modal_donut").getContext('2d');
				var today_donut = new Chart(ctx, {
					type: 'doughnut',
					data: data = {
							datasets: [{
								data: [achievPer, shortfallPer],
								backgroundColor: ['#36a2eb']
							}],
							labels: ['달성%','미달성%']
					}
				});
			}
			
		}else{ //타입이 페이지일경우
			
			$("#weeklyDetailViewModal .tab button:nth-child(1)").attr('disabled',true).removeClass('on');
			$("#weeklyDetailViewModal .tab button:nth-child(2)").attr('disabled',false).addClass('on');
			$('#weeklyDetailViewModal .time_form').css("display","none");
			$('#weeklyDetailViewModal .book_form').css("display","block");
			
			if(liIndex == goalCode){
				$(this).attr({"data-toggle":"modal", "data-target":"#weeklyDetailViewModal"});
				$("#weeklyDetailViewModal .book_form #goalName").attr("value",content);
				$("#weeklyDetailViewModal .book_form #goalPage").attr("value",goalAmount);
				$("#weeklyDetailViewModal .book_form #goalAchiev").attr("value",achiev);
				
				$("#weeklyDetailViewModal .book_form").parent().attr("action","TodayBookGoalUpdateModal.sp?liIndex=" + liIndex);
			}
		}
		
		/*$("#saveBtn").click(function(){
			alert("저장시 주간목표로 등록 한 데이터는 전부 변경됩니다.")
		});*/
		
	});
}

//목표 등록 모달
function goalAddMdal(){
	//오늘의 목표 모달 오픈
	$('#insertTodayModal').on('show.bs.modal',function(){

		//등록 모달 클릭시 데이터 초기화
		$("#insertTodayModal .bookIpt").attr("value","");
		$("#insertTodayModal .book_img").empty();
		$("#insertTodayModal .book_info").text("");
		
		//모달 내 차트(default)
		var why = 0;
		var ctx = document.getElementById("insert_Modal_donut").getContext('2d');
		var default_donut = new Chart(ctx, {
			type: 'doughnut',
			data: data = {
					datasets: [{
						data: [why, why],
						backgroundColor: ['#36a2eb']
					}],
					labels: ['달성%','미달성%']
			}
		});	
	});
	
	//주간 목표 모달 오픈
	$('#insertWeeklyModal').on('show.bs.modal',function(){

		//등록 모달 클릭시 데이터 초기화
		$("#insertWeeklyModal .bookIpt").attr("value","");
		$("#insertWeeklyModal .book_img").empty();
		$("#insertWeeklyModal .book_info").text("");
		
		//모달 내 차트(default)
		var ctx = document.getElementById("insert_Modal_donut2").getContext('2d');
		var default_donut = new Chart(ctx, {
			type: 'doughnut',
			data: data = {
					labels: ['달성%','미달성%'],
					datasets: [{
						data: [0, 0],
						backgroundColor: ['#36a2eb']
					}]
			}
		});	
	});

	
	$(".book_form").hide();
	$(".modal .tab button:first-child").click(function(){
		$(".tab button").removeClass('on');
		$(this).addClass('on');
		$(".book_form").hide();
		$(".time_form").show();
	});
	$(".modal .tab button:last-child").click(function(){
		$(".tab button").removeClass('on');
		$(this).addClass('on');
		$(".time_form").hide();
		$(".book_form").show();
		
	});
	
}

//isbn 책검색
function bookIsbn(){
	$("#bookBtn").click(function(){
		var searchBook = ($(".bookIpt").val()).replace(/ /g,"");
		console.log(searchBook);
		$.ajax({
			url : "bookIsbn.sp",
			data : {searchBook : searchBook},
			type : "get",
			success : function(data) {
				console.log("검색한 데이터 : " + data)
				
				var object = JSON.parse(data);
				console.log(object);
				
				console.log(object.items[0].title);
				console.log(object.items[0].image);
				console.log(object.items[0].isbn);
				
				//$(".bookIpt").attr("value", object.items[0].isbn);
				$(".book_img").append().html('<img src="' + object.items[0].image + '">');
				$(".book_info").append().html(object.items[0].title);
			},
			error : function() {
				console.log("에러발생!");
			}
		});
	});
}