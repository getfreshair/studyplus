<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>STUDY PLUS</title>
<!-- #### CSS FILES #### -->
<link rel="stylesheet" href="/studyplus/resources/css/bootstrap.css">
<link rel="stylesheet" href="/studyplus/resources/css/custom.css">
<link rel="stylesheet" href="/studyplus/resources/css/Nwagon.css">
<!-- #### JAVASCRIPT FILES #### -->
<script src="/studyplus/resources/js/jquery-1.11.1.min.js"></script>
<script src="/studyplus/resources/js/bootstrap.min.js"></script>
<script src="/studyplus/resources/js/Nwagon.js"></script>
<style type="text/css">
	/* body{background:#f8f8f8;} */
	#footer{background: #fff;}
	.study_style{width:1200px; margin:0 auto; background:#fff;}
	#surveyList tbody td:nth-child(2n){text-align:left; padding-left:10px;}
	
	#resultList > div{overflow:hidden;}
	#resultList ul{float:left;}
	#resultList span{font-weight:bold; color:#525252;}
	#resultList li, #resultList span{position:relative; float:left; width:50px; line-height:2.8; text-align:center; font-size: 16px;}
	#resultList li.on{font-weight:bold;}
	#resultList li.on:before{content:''; position:absolute; top:7px; left:10px; display:inline-block; width:30px; height:30px; border:2px solid red; border-radius:50%;}
</style>
</head>
<body>
	<div id="all">
		<!-- Header -->
		<jsp:include page="../common/header.jsp"/>
		<!-- // Header -->
		<!-- section -->
		<section>
			<div class="study_style">
				<div class="row">
					<!-- 학습스타일분석 -->
					<div class="col-sm-12 col-xs-12">

						<table class="tbl-type02" id="surveyList">
							<colgroup>
								<col style="width: 6%">
								<col style="width: 40%">
								<col style="width: 7%">
								<col style="width: 40%">
								<col style="width: 7%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col"></th>
									<th scope="col" colspan="2">( a )</th>
									<th scope="col" colspan="2">( b )</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>나는 무언가를 시험해 본 후에 더 잘 이해한다. </td>
									<td><input type="radio" value="a1" name="ck1"></td>
									<td>나는 무언가를 곰곰이 생각해 본 후에 더 잘 이해한다.</td>
									<td><input type="radio" value="b1" name="ck1"></td>
								</tr>
								<tr>
									<td>2</td>
									<td>나는 현실적인 편이다.</td>
									<td><input type="radio" value="a2" name="ck2"></td>
									<td>나는 혁신적인 편이다.</td>
									<td><input type="radio" value="b2" name="ck2"></td>
								</tr>
								<tr>
									<td>3</td>
									<td>어제 한 일을 떠올릴 때, 그림 그리듯 묘사하는 편이다.</td>
									<td><input type="radio" value="a3" name="ck3"></td>
									<td>어제 한 일을 떠올릴 때, 스토리 위주로 설명하는 편이다.</td>
									<td><input type="radio" value="b3" name="ck3"></td>
								</tr>
								<tr>
									<td>4</td>
									<td>세부적인 부분은 잘 이해하지만, 전체 구조 파악은 어렵다.</td>
									<td><input type="radio" value="a4" name="ck4"></td>
									<td>전체구조는 잘 이해하지만 세부사항과 연결 짓는 것이 어렵다.</td>
									<td><input type="radio" value="b4" name="ck4"></td>
								</tr>
								<tr>
									<td>5</td>
									<td>새로운 것을 배울 때, 그것에 대해 이야기하는 것이 도움이 된다. </td>
									<td><input type="radio" value="a5" name="ck5"></td>
									<td>새로운 것을 배울 때, 그것에 대해 숙고하는 것이 도움이 된다.</td>
									<td><input type="radio" value="b5" name="ck5"></td>
								</tr>
								<tr>
									<td>6</td>
									<td>내가 만약 선생님이라면, 객관적 사실 혹은 현실적 구조를 가르치고 싶다.</td>
									<td><input type="radio" value="a6" name="ck6"></td>
									<td>내가 만약 선생님이라면, 추상적인 개념이나 이론을 가르치고 싶다.</td>
									<td><input type="radio" value="b6" name="ck6"></td>
								</tr>
								<tr>
									<td>7</td>
									<td>새로운 정보를 배울 때, 그림, 도표, 그래프 또는 지도를 사용하는 것이 좋다.</td>
									<td><input type="radio" value="a7" name="ck7"></td>
									<td>새로운 정보를 배울 때, 말이나 글로 된 언어적 정보를 사용하는 것이 좋다.</td>
									<td><input type="radio" value="b7" name="ck7"></td>
								</tr>
								<tr>
									<td>8</td>
									<td>나는 부분부분을 이해한 후에 전체를 이해한다.</td>
									<td><input type="radio" value="a8" name="ck8"></td>
									<td>나는 먼저 전체를 이해하고 각 부분들이 어떻게 어울리는지를 알게 된다.</td>
									<td><input type="radio" value="b8" name="ck8"></td>
								</tr>
								<tr>
									<td>9</td>
									<td>스터디 그룹에서 나는 거기에 참여하고 아이디어를 내는 편이다.</td>
									<td><input type="radio" value="a9" name="ck9"></td>
									<td>스터디 그룹에서 나는 뒤에 앉아서 경청하는 편이다.</td>
									<td><input type="radio" value="b9" name="ck9"></td>
								</tr>
								<tr>
									<td>10</td>
									<td>구체적인 사실을 배우는 것이 더 쉽다.</td>
									<td><input type="radio" value="a10" name="ck10"></td>
									<td>추상적인 이론이나 개념을 배우는 것이 더쉽다.</td>
									<td><input type="radio" value="b10" name="ck10"></td>
								</tr>
								<tr>
									<td>11</td>
									<td>그림과 차트가 많이 실린 책을 읽을때, 그림과 차트를 자세하게 살핀다.</td>
									<td><input type="radio" value="a11" name="ck11"></td>
									<td>그림과 차트가 많이 실린 책을 읽을 때, 그것에 대한 설명에 집중하여 본다.</td>
									<td><input type="radio" value="b11" name="ck11"></td>
								</tr>
								<tr>
									<td>12</td>
									<td>수학문제를 풀 때, 나는 차근차근 한단계씩 문제를 풀어간다.</td>
									<td><input type="radio" value="a12" name="ck12"></td>
									<td>수학 문제를 풀 때, 나는 일단 답을 내본 후 풀이과정을 추론한다.</td>
									<td><input type="radio" value="b12" name="ck12"></td>
								</tr>
								<tr>
									<td>13</td>
									<td>나는 내가 듣는 수업에서 많은 친구들을 알게 되는 편이다.</td>
									<td><input type="radio" value="a13" name="ck13"></td>
									<td>나는 내가 듣는 수업에서 많은 친구들을 알게 되지 않는 편이다.</td>
									<td><input type="radio" value="b13" name="ck13"></td>
								</tr>
								<tr>
									<td>14</td>
									<td>글을 읽을 때, 새로운 사실이나 방법을 알게 되는 것을 선호한다.</td>
									<td><input type="radio" value="a14" name="ck14"></td>
									<td>글을 읽을 때, 깊이 생각해볼 만한 아이디어를 알게 되는 것을 선호한다.</td>
									<td><input type="radio" value="b14" name="ck14"></td>
								</tr>
								<tr>
									<td>15</td>
									<td>나는 칠판에 도표나 그림을 많이 그리면서 설명해 주시는 선생님이 좋다.</td>
									<td><input type="radio" value="a15" name="ck15"></td>
									<td>나는 말로 설명하는 데에 집중하시는 선생님이 좋다.</td>
									<td><input type="radio" value="b15" name="ck15"></td>
								</tr>
								<tr>
									<td>16</td>
									<td>소설을 분석할 때, 사건들을 하나하나 생각 한 뒤, 그 사건들을 연결지어 전체의 주제를 파악한다.</td>
									<td><input type="radio" value="a16" name="ck16"></td>
									<td>소설을 분석할 때, 나는 전체적인 흐름을 먼저 파악 한 뒤, 뒷받침이 되는 사건들을 찾는다.</td>
									<td><input type="radio" value="b16" name="ck16"></td>
								</tr>
								<tr>
									<td>17</td>
									<td>나는 숙제를 시작할 때, 즉시 해결책을 생각해 내려 한다.</td>
									<td><input type="radio" value="a17" name="ck17"></td>
									<td>나는 숙제를 시작할 때, 일단 문제를 완벽히 이해 하려 한다.</td>
									<td><input type="radio" value="b17" name="ck17"></td>
								</tr>
								<tr>
									<td>18</td>
									<td>나는 실제가 좋다.</td>
									<td><input type="radio" value="a18" name="ck18"></td>
									<td>나는 이론이 좋다.</td>
									<td><input type="radio" value="b18" name="ck18"></td>
								</tr>
								<tr>
									<td>19</td>
									<td>실제로 본 것을 잘 기억한다.</td>
									<td><input type="radio" value="a19" name="ck19"></td>
									<td>나는 실제로 들을 것을 잘 기억한다.</td>
									<td><input type="radio" value="b19" name="ck19"></td>
								</tr>
								<tr>
									<td>20</td>
									<td>내가 원하는 수업은 수업내용이 명확하고 체계적인 순서로 가르치는 것이다.</td>
									<td><input type="radio" value="a20" name="ck20"></td>
									<td>내가 원하는 수업은 수업내용의 전체적인 모습을 개괄한 뒤, 그것을 다른 주제에 연관짓는 것이다.</td>
									<td><input type="radio" value="b20" name="ck20"></td>
								</tr>
								<tr>
									<td>21</td>
									<td>공부할 때 스터디그룹을 선호한다.</td>
									<td><input type="radio" value="a21" name="ck21"></td>
									<td>공부할 때 혼자 하는 것을 선호한다.</td>
									<td><input type="radio" value="b21" name="ck21"></td>
								</tr>
								<tr>
									<td>22</td>
									<td>일을 할 때 일의 세부적인 사항들에 주의를 기울인다.</td>
									<td><input type="radio" value="a22" name="ck22"></td>
									<td>일을 할 때, 일을 어떻게 창의적으로 할 것 인가에 주의를 기울인다.</td>
									<td><input type="radio" value="b22" name="ck22"></td>
								</tr>
								<tr>
									<td>23</td>
									<td>모르는 장소에 찾아갈 때, 지도(그림)를 보는 것이 편하다.</td>
									<td><input type="radio" value="a23" name="ck23"></td>
									<td>모르는 장소에 찾아갈 때, 안내문(글)을 보는 것이 편하다.</td>
									<td><input type="radio" value="b23" name="ck23"></td>
								</tr>
								<tr>
									<td>24</td>
									<td>공부할 때, 한 단계씩 순차적으로 꾸준히 공부하는 것을 좋아한다.</td>
									<td><input type="radio" value="a24" name="ck24"></td>
									<td>공부할 때, 전체를 염두에 두며 공부하는 것을 좋아한다.</td>
									<td><input type="radio" value="b24" name="ck24"></td>
								</tr>
								<tr>
									<td>25</td>
									<td>나는 무슨 일을 할 때, 먼저 일단 저지르고 본다.</td>
									<td><input type="radio" value="a25" name="ck25"></td>
									<td>나는 무슨 일을 할 때, 먼저 어떻게 해야할지 생각을 해본다.</td>
									<td><input type="radio" value="b25" name="ck25"></td>
								</tr>
								<tr>
									<td>26</td>
									<td>여가시간에 독서를 할 경우, 말하고자 하는 바를 명료하게 드러내는 책이좋다.</td>
									<td><input type="radio" value="a26" name="ck26"></td>
									<td>여가시간에 독서할 경우, 창의적이고 흥미롭게 서술하는 책이 좋다.</td>
									<td><input type="radio" value="b26" name="ck26"></td>
								</tr>
								<tr>
									<td>27</td>
									<td>도표나 스케치를 보면서 배웠을 때, 나는 주로 그림을 기억한다.</td>
									<td><input type="radio" value="a27" name="ck27"></td>
									<td>도표나 스케치를 보면서 배웠을 때, 나는 주로 교수님의 설명을 기억한다.</td>
									<td><input type="radio" value="b27" name="ck27"></td>
								</tr>
								<tr>
									<td>28</td>
									<td>책을 읽을 때, 나는 세부적인 정보에 집중하느라 큰 흐름을 놓치곤 한다.</td>
									<td><input type="radio" value="a28" name="ck28"></td>
									<td>책을 읽을 때, 나는 큰 흐름을 우선 이해한 후에 세부적인 정보로 눈을 돌린다.</td>
									<td><input type="radio" value="b28" name="ck28"></td>
								</tr>
								<tr>
									<td>29</td>
									<td>나는 내가 실제로 해봤던 것을 더 쉽게 기억 한다.</td>
									<td><input type="radio" value="a29" name="ck29"></td>
									<td>나는 내가 생각을 많이 해봤던 것을 더 쉽게 기억한다.</td>
									<td><input type="radio" value="b29" name="ck29"></td>
								</tr>
								<tr>
									<td>30</td>
									<td>일을 할 때, 나는 그 일을 해결하는 한 가지 방법을 완벽히 마스터한다.</td>
									<td><input type="radio" value="a30" name="ck30"></td>
									<td>일을 할 때, 나는 여러 가지 새로운 방법을 찾으려고 노력하는 편이다. </td>
									<td><input type="radio" value="b30" name="ck30"></td>
								</tr>
								<tr>
									<td>31</td>
									<td>나는 어떤 자료를 볼 때 차트나 표 형식을 선호한다.</td>
									<td><input type="radio" value="a31" name="ck31"></td>
									<td>나는 어떤 자료를 볼 때 내용을 요약한 글 형식을 선호한다.</td>
									<td><input type="radio" value="b31" name="ck31"></td>
								</tr>
								<tr>
									<td>32</td>
									<td>레포트나 서술형 답안을 쓸 때, 나는 도입부분을 먼저 완성한 후 그 다음 단계로 나아간다.</td>
									<td><input type="radio" value="a32" name="ck32"></td>
									<td>레포트나 서술형 답안을 쓸 때, 부분적인 글을 완성 한 후 이들을 종합해서 하나로 완성한다.</td>
									<td><input type="radio" value="b32" name="ck32"></td>
								</tr>
								<tr>
									<td>33</td>
									<td>그룹 프로젝트 시, 함께 모여 자유로운 회의를 통해 아이디어를 내는 것 이 좋다.</td>
									<td><input type="radio" value="a33" name="ck33"></td>
									<td>그룹 프로젝트 시, 우선 각자 생각해 본 뒤 그룹으로 모여 의견을 합치는 것이 좋다.</td>
									<td><input type="radio" value="b33" name="ck33"></td>
								</tr>
								<tr>
									<td>34</td>
									<td>판단력이 뛰어나다는 말을 들었을 때 기분이 좋다.</td>
									<td><input type="radio" value="a34" name="ck34"></td>
									<td>창의적이라는 말을 들었을 때 기분이 좋다.</td>
									<td><input type="radio" value="b34" name="ck34"></td>
								</tr>
								<tr>
									<td>35</td>
									<td>모임에서 사람들을 만났을 때, 사람들의 생김새를 잘 기억한다.</td>
									<td><input type="radio" value="a35" name="ck35"></td>
									<td>모임에서 사람들을 만났을 때, 사람들이 한 말을 잘 기억한다.</td>
									<td><input type="radio" value="b35" name="ck35"></td>
								</tr>
								<tr>
									<td>36</td>
									<td>새로운 내용을 배울 때, 나는 내가 모르는 부분위주로 학습한다.</td>
									<td><input type="radio" value="a36" name="ck36"></td>
									<td>새로운 내용을 배울 때, 나는 그 주제와 관계되는 주제를 찾아본다.</td>
									<td><input type="radio" value="b36" name="ck36"></td>
								</tr>
								<tr>
									<td>37</td>
									<td>나는 외향적인 사람이라고 여겨지는 편이다.</td>
									<td><input type="radio" value="a37" name="ck37"></td>
									<td>나는 수줍음이 많은 사람이라고 여겨지는 편이다.</td>
									<td><input type="radio" value="b37" name="ck37"></td>
								</tr>
								<tr>
									<td>38</td>
									<td>내가 좋아하는 수업은 사실이나 자료 등 구체적인 내용을 중시하는 수업이다.</td>
									<td><input type="radio" value="a38" name="ck38"></td>
									<td>내가 좋아하는 수업은 개념이나 이론 등 추상적인 내용을 중시하는 수업이다.</td>
									<td><input type="radio" value="b38" name="ck38"></td>
								</tr>
								<tr>
									<td>39</td>
									<td>기분전환을 위해서 나는 TV를 본다.</td>
									<td><input type="radio" value="a39" name="ck39"></td>
									<td>기분전환을 위해서 나는 책을 읽는다.</td>
									<td><input type="radio" value="b39" name="ck39"></td>
								</tr>
								<tr>
									<td>40</td>
									<td>수업시작 시, 학습목표를 말씀해 주시는 것은 내게 약간 도움이 된다.</td>
									<td><input type="radio" value="a40" name="ck40"></td>
									<td>수업시작 시, 학습목표를 말씀해 주시는 것은 내게 큰 도움이 된다.</td>
									<td><input type="radio" value="b40" name="ck40"></td>
								</tr>
								<tr>
									<td>41</td>
									<td>그룹과제에서, 한 조의 과제점수가 모든 조원에게 똑같이 적용되는 평가체계는 마음에 든다.</td>
									<td><input type="radio" value="a41" name="ck41"></td>
									<td>그룹과제에서, 한조의 과제점수가 모든 조원에게 똑같이 적용되는 평가체계는 마음에 들지 않는다.</td>
									<td><input type="radio" value="b41" name="ck41"></td>
								</tr>
								<tr>
									<td>42</td>
									<td>복잡한 계산문제를 풀 때, 나는 대개 주의깊게 검산하는 편이다.</td>
									<td><input type="radio" value="a42" name="ck42"></td>
									<td>복잡한 계산문제를 풀 때, 나는 검산하는 것을 귀찮게 생각한다.</td>
									<td><input type="radio" value="b42" name="ck42"></td>
								</tr>
								<tr>
									<td>43</td>
									<td>내가 가보았던 장소를 떠올릴 때, 나는 쉽게 기억하고 정확하게 묘사하는 편이다.</td>
									<td><input type="radio" value="a43" name="ck43"></td>
									<td>내가 가보았던 장소를 떠올릴 때, 나는 잘 기억하지 못하고 상세하게 묘사하지 못하는 편이다.</td>
									<td><input type="radio" value="b43" name="ck43"></td>
								</tr>
								<tr>
									<td>44</td>
									<td>문제를 풀 때, 나는 문제해결과정을 단계별로 생각해 보는 편이다.</td>
									<td><input type="radio" value="a44" name="ck44"></td>
									<td>문제를 풀 때, 나는 가능한 결과들을 예측해 보거나, 넓은 영역에서 적용되는 해답을생각하는 편이다.</td>
									<td><input type="radio" value="b44" name="ck44"></td>
								</tr>
							</tbody>
						</table>
						
						
						<script>
							$(function(){
								//설문지 체크시 검사표에 체크됨
								$("#surveyList input").click(function(){
									if($(this).attr("checked", true)){
										var checkedVal = $(this).val();				
										console.log(checkedVal);
										$("#checklist input[value=" + checkedVal +"]").attr("checked", true);
									}
								});
								
								$("#typelist").hide();
								$(".resultBtn").click(function(){
									
									/* if($("#surveyList input").checked != true){
										console.log("모두 체크하세요")
									} */
										
									//합계
									var line1 = $("#checklist tr:nth-child(2) input:checked").length;
									var line2 = $("#checklist tr:nth-child(3) input:checked").length;
									var line3 = $("#checklist tr:nth-child(5) input:checked").length;
									var line4 = $("#checklist tr:nth-child(6) input:checked").length;
									var line5 = $("#checklist tr:nth-child(8) input:checked").length;
									var line6 = $("#checklist tr:nth-child(9) input:checked").length;
									var line7 = $("#checklist tr:nth-child(11) input:checked").length;
									var line8 = $("#checklist tr:nth-child(12) input:checked").length;
						
									for(var i = 1; i < 9; i++){
										//$("#sum1").text(line1);
										eval('$("#sum' + i +'").text(line' + i +')');
										//var $sum1 = $("#checklist #sum1").text();
										eval('var $sum' + i + '= $("#checklist #sum' + i +'").text()');
										//var $score1 = $("#score1");
										eval('var $score' + i + '= $("#score' + '8")');
									}
									
									//점수
									var result1 = Math.abs($sum1 - $sum2);
									var result2 = Math.abs($sum3 - $sum4);
									var result3 = Math.abs($sum5 - $sum6);
									var result4 = Math.abs($sum7 - $sum8);
									
									if($sum1 > $sum2){
										$("#score1").text(result1);
										$("#score2").text(0);
									}else{
										$("#score2").text(result1);
										$("#score1").text(0);
									}
									
									if($sum3 > $sum4){
										$("#score3").text(result2);
										$("#score4").text(0);
									}else{
										$("#score4").text(result2);
										$("#score3").text(0);
									}
									
									if($sum5 > $sum6){
										$("#score5").text(result3);
										$("#score6").text(0);
									}else{
										$("#score6").text(result3);
										$("#score5").text(0);
									}
									
									if($sum7 > $sum8){
										$("#score7").text(result4);
										$("#score8").text(0);
									}else{
										$("#score8").text(result4);
										$("#score7").text(0);
									}
									
						
										
									/* $("#resultList li").removeClass('on');
									switch($("#score1").text()){
										case "1" : $(".line1 li:nth-child(6)").addClass('on'); break;
										case "3" : $(".line1 li:nth-child(5)").addClass('on'); break;
										case "5" : $(".line1 li:nth-child(4)").addClass('on'); break;
										case "7" : $(".line1 li:nth-child(3)").addClass('on'); break;
										case "9" : $(".line1 li:nth-child(2)").addClass('on'); break;
										case "11" : $(".line1 li:nth-child(1)").addClass('on'); break;
									}
									switch($("#score3").text()){
										case "1" : $(".line2 li:nth-child(6)").addClass('on'); break;
										case "3" : $(".line2 li:nth-child(5)").addClass('on'); break;
										case "5" : $(".line2 li:nth-child(4)").addClass('on'); break;
										case "7" : $(".line2 li:nth-child(3)").addClass('on'); break;
										case "9" : $(".line2 li:nth-child(2)").addClass('on'); break;
										case "11" : $(".line2 li:nth-child(1)").addClass('on'); break;
									}
									switch($("#score5").text()){
										case "1" : $(".line3 li:nth-child(6)").addClass('on'); break;
										case "3" : $(".line3 li:nth-child(5)").addClass('on'); break;
										case "5" : $(".line3 li:nth-child(4)").addClass('on'); break;
										case "7" : $(".line3 li:nth-child(3)").addClass('on'); break;
										case "9" : $(".line3 li:nth-child(2)").addClass('on'); break;
										case "11" : $(".line3 li:nth-child(1)").addClass('on'); break;
									}
									switch($("#score7").text()){
										case "1" : $(".line4 li:nth-child(6)").addClass('on'); break;
										case "3" : $(".line4 li:nth-child(5)").addClass('on'); break;
										case "5" : $(".line4 li:nth-child(4)").addClass('on'); break;
										case "7" : $(".line4 li:nth-child(3)").addClass('on'); break;
										case "9" : $(".line4 li:nth-child(2)").addClass('on'); break;
										case "11" : $(".line4 li:nth-child(1)").addClass('on'); break;
									} */
						
									
									$("#typelist").show();
									$("#typelist dl").hide();
									//점수에 따른 결과
									if($("#score1").text() > 0){ //활동형
										console.log("활동형");
										$(".type1_1").show();
									}else if($("#score2").text() > 0){ //숙고형
										console.log("숙고형");
										$(".type1_2").show();
									}
									
									if($("#score3").text() > 0){ //감각형
										console.log("감각형");
										$(".type2_1").show();
									}else if($("#score4").text() > 0){ //직관형
										console.log("직관형");
										$(".type2_2").show();
									}
									
									if($("#score5").text() > 0){ //사각형
										console.log("사각형");
										$(".type3_1").show();
									}else if($("#score6").text() > 0){ //언어형
										console.log("언어형");
										$(".type3_2").show();
									}
									
									if($("#score7").text() > 0){ //순차형
										console.log("순차형");
										$(".type4_1").show();
									}else if($("#score8").text() > 0){ //총체형
										console.log("총체형");
										$(".type4_2").show();
									}
									
									resultChart();
									//차트
									function resultChart(){
										var scoreVal1 = $("#score1").text();
										var scoreVal2 = $("#score2").text();
										var scoreVal3 = $("#score3").text();
										var scoreVal4 = $("#score4").text();
										var scoreVal5 = $("#score5").text();
										var scoreVal6 = $("#score6").text();
										var scoreVal7 = $("#score7").text();
										var scoreVal8 = $("#score8").text();
										console.log(scoreVal7)
										
										var options = {
												'legend':{
													names: ['언어형', '직관형',	'숙고형', '순차형',
															'시각형',	'감각형',	'활동형',	'총체형']
												},
												'dataset': {
													title: '학습스타일 결과',
													values: [[scoreVal6, scoreVal4, scoreVal2, scoreVal7,
															scoreVal5, scoreVal3, scoreVal1, scoreVal8]],
													bgColor: '#f9f9f9',
													fgColor: '#30a1ce',
												},
												'chartDiv': 'studyTendencyChart',
												'chartType': 'radar',
												'chartSize': { width: 500, height: 300 }
										};
										Nwagon.chart(options);
									}
								
								});
							});
						</script>
						
						
						<br>
						
						<table class="tbl-type02" id="checklist">
							<colgroup>
								<col style="width: *%">
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 6%">
								<col style="width: 8%">
								<col style="width: 8%">
							</colgroup>
							<tbody>
								<tr>
									<th>활동형-숙고형</th>
									<th>1</th>
									<th>5</th>
									<th>9</th>
									<th>13</th>
									<th>17</th>
									<th>21</th>
									<th>25</th>
									<th>29</th>
									<th>33</th>
									<th>37</th>
									<th>41</th>
									<th>합계</th>
									<th>점수</th>
								</tr>
								<tr>
									<td>a(활동형)</td>
									<td><input type="radio" value="a1" name="ck1_in"></td>
									<td><input type="radio" value="a5" name="ck5_in"></td>
									<td><input type="radio" value="a9" name="ck9_in"></td>
									<td><input type="radio" value="a13" name="ck13_in"></td>
									<td><input type="radio" value="a17" name="ck17_in"></td>
									<td><input type="radio" value="a21" name="ck21_in"></td>
									<td><input type="radio" value="a25" name="ck25_in"></td>
									<td><input type="radio" value="a29" name="ck29_in"></td>
									<td><input type="radio" value="a33" name="ck33_in"></td>
									<td><input type="radio" value="a37" name="ck37_in"></td>
									<td><input type="radio" value="a41" name="ck41_in"></td>
									<td id="sum1"></td>
									<td id="score1"></td>
								</tr>
								<tr>
									<td>b(숙고형)</td>
									<td><input type="radio" value="b1" name="ck1_in"></td>
									<td><input type="radio" value="b5" name="ck5_in"></td>
									<td><input type="radio" value="b9" name="ck9_in"></td>
									<td><input type="radio" value="b13" name="ck13_in"></td>
									<td><input type="radio" value="b17" name="ck17_in"></td>
									<td><input type="radio" value="b21" name="ck21_in"></td>
									<td><input type="radio" value="b25" name="ck25_in"></td>
									<td><input type="radio" value="b29" name="ck29_in"></td>
									<td><input type="radio" value="b33" name="ck33_in"></td>
									<td><input type="radio" value="b37" name="ck37_in"></td>
									<td><input type="radio" value="b41" name="ck41_in"></td>
									<td id="sum2"></td>
									<td id="score2"></td>
								</tr>
								<tr>
									<th>감각형-직관형</th>
									<th>2</th>
									<th>6</th>
									<th>10</th>
									<th>14</th>
									<th>18</th>
									<th>22</th>
									<th>26</th>
									<th>30</th>
									<th>34</th>
									<th>38</th>
									<th>42</th>
									<th>합계</th>
									<th>점수</th>
								</tr>
								<tr>
									<td>a(감각형)</td>
									<td><input type="radio" value="a2" name="ck2_in"></td>
									<td><input type="radio" value="a6" name="ck6_in"></td>
									<td><input type="radio" value="a10" name="ck10_in"></td>
									<td><input type="radio" value="a14" name="ck14_in"></td>
									<td><input type="radio" value="a18" name="ck18_in"></td>
									<td><input type="radio" value="a22" name="ck22_in"></td>
									<td><input type="radio" value="a26" name="ck26_in"></td>
									<td><input type="radio" value="a30" name="ck30_in"></td>
									<td><input type="radio" value="a34" name="ck34_in"></td>
									<td><input type="radio" value="a38" name="ck38_in"></td>
									<td><input type="radio" value="a42" name="ck42_in"></td>
									<td id="sum3"></td>
									<td id="score3"></td>
								</tr>
								<tr>
									<td>b(직관형)</td>
									<td><input type="radio" value="b2" name="ck2_in"></td>
									<td><input type="radio" value="b6" name="ck6_in"></td>
									<td><input type="radio" value="b10" name="ck10_in"></td>
									<td><input type="radio" value="b14" name="ck14_in"></td>
									<td><input type="radio" value="b18" name="ck18_in"></td>
									<td><input type="radio" value="b22" name="ck22_in"></td>
									<td><input type="radio" value="b26" name="ck26_in"></td>
									<td><input type="radio" value="b30" name="ck30_in"></td>
									<td><input type="radio" value="b34" name="ck34_in"></td>
									<td><input type="radio" value="b38" name="ck38_in"></td>
									<td><input type="radio" value="b42" name="ck42_in"></td>
									<td id="sum4"></td>
									<td id="score4"></td>
								</tr>
								<tr>
									<th>사각형-언어형</th>
									<th>3</th>
									<th>7</th>
									<th>11</th>
									<th>15</th>
									<th>19</th>
									<th>23</th>
									<th>27</th>
									<th>31</th>
									<th>35</th>
									<th>39</th>
									<th>43</th>
									<th>합계</th>
									<th>점수</th>
								</tr>
								<tr>
									<td>a(사각형)</td>
									<td><input type="radio" value="a3" name="ck3_in"></td>
									<td><input type="radio" value="a7" name="ck7_in"></td>
									<td><input type="radio" value="a11" name="ck11_in"></td>
									<td><input type="radio" value="a15" name="ck15_in"></td>
									<td><input type="radio" value="a19" name="ck19_in"></td>
									<td><input type="radio" value="a23" name="ck23_in"></td>
									<td><input type="radio" value="a27" name="ck27_in"></td>
									<td><input type="radio" value="a31" name="ck31_in"></td>
									<td><input type="radio" value="a35" name="ck35_in"></td>
									<td><input type="radio" value="a39" name="ck39_in"></td>
									<td><input type="radio" value="a43" name="ck43_in"></td>
									<td id="sum5"></td>
									<td id="score5"></td>
								</tr>
								<tr>
									<td>b(언어형)</td>
									<td><input type="radio" value="b3" name="ck3_in"></td>
									<td><input type="radio" value="b7" name="ck7_in"></td>
									<td><input type="radio" value="b11" name="ck11_in"></td>
									<td><input type="radio" value="b15" name="ck15_in"></td>
									<td><input type="radio" value="b19" name="ck19_in"></td>
									<td><input type="radio" value="b23" name="ck23_in"></td>
									<td><input type="radio" value="b27" name="ck27_in"></td>
									<td><input type="radio" value="b31" name="ck31_in"></td>
									<td><input type="radio" value="b35" name="ck35_in"></td>
									<td><input type="radio" value="b39" name="ck39_in"></td>
									<td><input type="radio" value="b43" name="ck43_in"></td>
									<td id="sum6"></td>
									<td id="score6"></td>
								</tr>
								<tr>
									<th>순차형-총체형</th>
									<th>4</th>
									<th>8</th>
									<th>12</th>
									<th>16</th>
									<th>20</th>
									<th>24</th>
									<th>28</th>
									<th>32</th>
									<th>36</th>
									<th>40</th>
									<th>44</th>
									<th>합계</th>
									<th>점수</th>
								</tr>
								<tr>
									<td>a(순차형)</td>
									<td><input type="radio" value="a4" name="ck4_in"></td>
									<td><input type="radio" value="a8" name="ck8_in"></td>
									<td><input type="radio" value="a12" name="ck12_in"></td>
									<td><input type="radio" value="a16" name="ck16_in"></td>
									<td><input type="radio" value="a20" name="ck20_in"></td>
									<td><input type="radio" value="a24" name="ck24_in"></td>
									<td><input type="radio" value="a28" name="ck28_in"></td>
									<td><input type="radio" value="a32" name="ck32_in"></td>
									<td><input type="radio" value="a36" name="ck36_in"></td>
									<td><input type="radio" value="a40" name="ck40_in"></td>
									<td><input type="radio" value="a44" name="ck44_in"></td>
									<td id="sum7"></td>
									<td id="score7"></td>
								</tr>
								<tr>
									<td>b(총체형)</td>
									<td><input type="radio" value="b4" name="ck4_in"></td>
									<td><input type="radio" value="b8" name="ck8_in"></td>
									<td><input type="radio" value="b12" name="ck12_in"></td>
									<td><input type="radio" value="b16" name="ck16_in"></td>
									<td><input type="radio" value="b20" name="ck20_in"></td>
									<td><input type="radio" value="b24" name="ck24_in"></td>
									<td><input type="radio" value="b28" name="ck28_in"></td>
									<td><input type="radio" value="b32" name="ck32_in"></td>
									<td><input type="radio" value="b36" name="ck36_in"></td>
									<td><input type="radio" value="b40" name="ck40_in"></td>
									<td><input type="radio" value="b44" name="ck44_in"></td>
									<td id="sum8"></td>
									<td id="score8"></td>
								</tr>
							</tbody>
						</table>
						<br>
						<button type="button" class="btn btn-primary resultBtn">결과 확인하기</button>
						
						<div id="resultList">
							<div class="line1">
								<span>활동형</span>
								<ul>
									<li>11</li>
									<li>9</li>
									<li>7</li>
									<li>5</li>
									<li>3</li>
									<li>1</li>
									<li>1</li>
									<li>3</li>
									<li>5</li>
									<li>7</li>
									<li>9</li>
									<li>11</li>
								</ul>
								<span>숙고형</span>
							</div>
							<div class="line2">
								<span>감각형</span>
								<ul>
									<li>11</li>
									<li>9</li>
									<li>7</li>
									<li>5</li>
									<li>3</li>
									<li>1</li>
									<li>1</li>
									<li>3</li>
									<li>5</li>
									<li>7</li>
									<li>9</li>
									<li>11</li>
								</ul>
								<span>직관형</span>
							</div>
							<div class="line3">
								<span>시각형</span>
								<ul>
									<li>11</li>
									<li>9</li>
									<li>7</li>
									<li>5</li>
									<li>3</li>
									<li>1</li>
									<li>1</li>
									<li>3</li>
									<li>5</li>
									<li>7</li>
									<li>9</li>
									<li>11</li>
								</ul>
								<span>언어형</span>
							</div>
							<div class="line4">
								<span>순차형</span>
								<ul>
									<li>11</li>
									<li>9</li>
									<li>7</li>
									<li>5</li>
									<li>3</li>
									<li>1</li>
									<li>1</li>
									<li>3</li>
									<li>5</li>
									<li>7</li>
									<li>9</li>
									<li>11</li>
								</ul>
								<span>총체형</span>
							</div>
						</div>
						
						<div class="chart">
							<div id="studyTendencyChart"></div>
						</div>
						
						<p>학습스타일 결과분석</p>
						<ul>
							<li>· 점수가 1~3점인 경우, 당신은 두 영역 사이에서 균형잡힌 스타일을 가지고 있다(혹은 아직 스타일이 확고하지 못하다).</li>
							<li>· 점수가 5~7점인 경우, 당신은 한 영역에 중간 정도로 치우쳐 있다.</li>
							<li>· 점수가 9~11점인 경우, 당신은 한 영역으로 강하게 치우쳐 있다. 이런 경우, 자신의 스타일과 다른 학습 분위기에서 학습하기 어려울 수 있다.</li>
						</ul>
						
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
					<!-- // 학습스타일분석 -->
				</div>
			</div>
		</section>
		<!-- // section -->

		<!-- Footer -->
		<jsp:include page="../common/footer.jsp"/>
		<!-- // Footer -->
	</div>
</body>
</html>