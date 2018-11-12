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
<!-- #### JAVASCRIPT FILES #### -->
<script src="/studyplus/resources/js/jquery-1.11.1.min.js"></script>
<script src="/studyplus/resources/js/bootstrap.min.js"></script>
<style type="text/css">
	/* body{background:#f8f8f8;} */
	#footer{background: #fff;}
	.study_style{width:1200px; margin:0 auto; background:#fff;}
	#surveyList tbody td:nth-child(2n){text-align:left; padding-left:10px;}
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
		var radioCk = $("#surveyList input");
		
		$(radioCk).click(function(){
			console.log($(this).val());
			
			//$("#surveyList input[value^=a]").addClass('on');
			var surveyListVal = $("#surveyList input").val();
			var checklistVal = $("#checklist input").val();
			
			if($(this).val() == checklistVal){
				checklistVal.addClass('on')
			}
			/* if(surveyListVal.val() == checklistVal.val()){
				consol.log("test");
				$(this).checked == true
			} */
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
			<td></td>
			<td></td>
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
			<td></td>
			<td></td>
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
			<td></td>
			<td></td>
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
			<td></td>
			<td></td>
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
			<td></td>
			<td></td>
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
			<td></td>
			<td></td>
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
			<td></td>
			<td></td>
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
			<td></td>
			<td></td>
		</tr>
	</tbody>
</table>
<br>
<button type="button" class="btn btn-primary btn-block">결과 확인하기</button>







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