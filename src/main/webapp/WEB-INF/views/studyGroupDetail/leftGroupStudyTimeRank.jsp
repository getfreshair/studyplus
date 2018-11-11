<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	.priodTabMenuArea {/*  width:100%; */ margin-right:15px; padding:0px 10px 10px 10px; /* border-bottom:1px solid gray; */ text-align:right; }
	  .priodTabMenuArea span { cursor:pointer; font-size:14px; /* font-weight:bold; */ }
	  	.prevBtn:hover, .nextBtn:hover { color:#ed876a; font-weight:bold; }
	  
 	  .memberOneWrapArea { width:263px; /* border:1px dashed red; display:inline-block; */ }
		.memberInfo { margin:10px 0px; }
		  .memberInfo td { position:relative; padding-left:12px; text-align:left; display:table-cell; vertical-align:middle; }
		   .rankImg { position:absolute; width:15px; margin-top:-8px; }
		    .rankImg img{ margin-left:37px; }
		   .profImg { width:50px; height:50px; overflow-y:hidden; border-radius:20%; }
		  	.profImg img { width:100%; }
		  .nickName	{ width:105px; height:50%; font-size:12.5px; font-weight:bold; line-height:1.2; word-break:break-all; }
		    .nickName strong { vertical-align:super; }
		  .timeStickAera { width:100%; position:relative; }
 		    .timeStickWrap { width:100%; height:20px; background:lightgray; border-radius:15px; border:2px solid; } 
 		    .timeStickBack { width:100%; height:100%; position:relative; }
 			.timeStick{ width:50%; height:100%; background:lawngreen; border-radius:15px; border:2px outset; }
			.memberTime{ z-index:999; width:100%; position:absolute; text-align:center; font-size:10px; font-weight:bold; }	
</style>

</head>
<body>
	<div class="rankPageWrap">
		<div class="priodTabMenuArea">
			<table width="100%"><tr>
				<td style="text-align:left;">
					<span><strong class="prevBtn">< </strong></span>
					<span style="cursor:auto;"> 18. 10. 1주차 </span>
					<span><strong class="nextBtn"> ></strong></span>
				</td>
				<td style="text-align:right;">
					<span id="selectDay" class="menuBtn" onclick="selectDay();">일간</span>
					<span style="cursor:auto;">|</span>
					<span id="selectWeek" class="menuBtn" onclick="selectWeek();">주간</span>
					<span style="cursor:auto;">|</span>
					<span id="selectMonth" class="menuBtn" onclick="selectMonth();">월간</span>
				</td>
			</tr></table>
		</div>
		
<!-- 	반복영역 -->
		<div class="memberListArea">
			<div class="memberOneWrapArea">
				<table class="memberInfo" border="1">
					<tr>							
						<td rowspan="2">
							<div class="rankImg">
								<img width="100%" src="${ contextPath }/resources/upload/studygroup/thumbnail/medal.png" />
							</div>
							<div class="profImg">
								<input type="hidden" id="memCode" value=""/>
								<img src="${ contextPath }/resources/upload/member/thumbnail/163428ba12e94f148ba8cc438e88d3a1" />
							</div>
						</td>
						<td class="nickName"><strong>닉네임자리</strong></td>
					</tr>
					<tr><td class="timeStickAera">
						<div class="timeStickWrap">
							<div class="timeStickBack">
								<div class="memberTime">00:00:00</div>
								<div class="timeStick"></div>
							</div>
						</div>
					</td></tr>
				</table>
			</div>				
		</div>
		

	</div>
</body>

<script>
/* 	 조건
		1. 시작일 이전으로는 조회 불가 / 오늘 이후로는 조회 불가
		2. 년, 월, 주 값이 1미만이라면
			date 값을 해당 단위의 시작 일자에서 - 1 로 변경 하여 적용하기
			ex) 1일 일 때 전 월 마지막 일자로 ( 기본적으로 돼 있음)
				1 주차 일 때 전 월의 마지막 주로 / 
				1월 일 때 전 년도 12월로 / 
		3. 값이 없을 때에도 기본값이 닉네임 순으로 정렬되어 00:00:00 띄우기(왕관은 빼고)
		4. 목표 시간 이상 달성한 회원은 bar 색을 초록으로, 그렇지 않으면 빨강으로
		( 5. 목표 시간 달성이 안되면 왕관 빼기
				 (주간 : 목표시간 * 7 / 월간 : 목표시간 * 일 수 미만)
			 -> 기준이 애매해서 보류) */


 	var selectPeriod = 0;
	var dayPick = 0;
	var monthPick = 0;
	
	$(function(){
		selectDay();
	});
		
	function selectRankingDate(selectPeriod, dayPick, monthPick, yearPick){
		alert("여긴 와?");
		$.ajax({
			url:"selectRankingDate.sgd",
			data : { selectPeriod : selectPeriod, dayPick : dayPick,
					 monthPick : monthPick },
			type : "POST",
			success:function(data) {
				console.log(data);
			}
		
		});
	}
	
	$(".prevBtn").click(function(){
		selectPeriod += -1
		alert(pickDate);
		console.log("prevBtn selectPeriod = " + selectPeriod);
		console.log("prevBtn dayPick = " + dayPick);
		console.log("prevBtn monthPick = " + monthPick);
		console.log("prevBtn yearPick = " + yearPick);
		
		selectRankingDate(selectPeriod, dayPick, monthPick, yearPick);
		
/* 		if(montlyPick = 1 && 현재 받아 온 월의 jstl 값이 1이면서 해당 버튼을 눌렀다면 년도 변경하기){
			
		}
*/
		
		
	});
	$(".nextBtn").click(function(){
		selectPeriod += 1
		alert(pickDate);
		console.log("nextBtn selectPeriod = " + selectPeriod);
		console.log("nextBtn dayPick = " + dayPick);
		console.log("nextBtn monthPick = " + monthPick);
		console.log("nextBtn yearPick = " + yearPick);
		
		if(selectPeriod >= 0){
			$('.nextBtn').prop("disabled", true);
			alert("선택불가");
			pickDate = 0;
		}
		
		selectRankingDate(selectPeriod, dayPick, monthPick, yearPick);
	});
		
	function selectDay(){
		$('#selectDay').css({"font-weight":"bold"});
		$('#selectWeek').css({"font-weight":""});
		$('#selectMonth').css({"font-weight":""});

		selectPeriod = 0;
		dayPick = 1;
		monthPick = 0;
		yearPick = 0;
		
		console.log("Daily selectPeriod = " + selectPeriod);
		console.log("Daily dayPick = " + dayPick);
		console.log("Daily monthPick = " + monthPick);
		console.log("Daily yearPick = " + yearPick);
		
		selectRankingDate(selectPeriod, dayPick, monthPick, yearPick);
	};

	function selectWeek(){
		$('#selectDay').css({"font-weight":""});
		$('#selectWeek').css({"font-weight":"bold"});
		$('#selectMonth').css({"font-weight":""});			
		
		selectPeriod = 0;
		dayPick = 7;
		monthPick = 0;
		yearPick = 0;
		
		console.log("Weekly selectPeriod = " + selectPeriod);
		console.log("Weekly dayPick = " + dayPick);
		console.log("Weekly monthPick = " + monthPick);
		console.log("Weekly yearPick = " + yearPick);
		
		selectRankingDate(selectPeriod, dayPick, monthPick, yearPick);
	};
				
	function selectMonth(){
		$('#selectDay').css({"font-weight":""});
		$('#selectWeek').css({"font-weight":""});
		$('#selectMonth').css({"font-weight":"bold"});

		selectPeriod = 0;
		dayPick = 0;
		monthPick = 1;
		yearPick = 0;
		
		console.log("Monthly selectPeriod = " + selectPeriod);
		console.log("Monthly dayPick = " + dayPick);
		console.log("Monthly monthPick = " + monthPick);
		console.log("Monthly yearPick = " + yearPick);
		
		selectRankingDate(selectPeriod, dayPick, monthPick, yearPick);
	};
</script>


</html>