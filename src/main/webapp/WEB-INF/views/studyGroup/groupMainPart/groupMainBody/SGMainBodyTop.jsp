<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.SGBoardArea {
		width:1200px;
		margin-top:5px;
	}
	.SGBoardListArea, .SGMyBoardListArea {
		display:inline-block;
		background:#0f1827;
		width:597px;
		height:295px;
		border-radius:10px;
		text-align:center;
		margin:0 auto;
	}
	.SGBoardArea h3 {
		text-align:center;
		background:white;
	}
	.SGLastBoardArea {
		display:inline-block;
		border-radius:8px;
		width:550px;
		background:white;
		margin-bottom:10px;
	}
	.SGMyBoardArea {
		display:inline-block;
		border-radius:8px;
		width:550px;
		background:white;
		margin-bottom:10px;
	}
	.SGTitleArea {
		background:cadetblue;
		display:inline-block;
		border-radius:8px;
		padding-left:20px;
		padding-right:20px;
		padding-top: 1px;
    	padding-bottom: 1px;
		margin-top:5px;
		margin-bottom:5px;
		font-size:13px;
		color:white;
	}
	.SGBoardReadCheckArea {
		display:inline-block;
		float:left;
	}
	.SGBoardReadCheckArea img{
		margin-left:10px;
		margin-bottom:3px;
	}
	.SGBoardTitleArea {
		display:inline-block;
		float:left;
		margin-top:9px;
		margin-left:9px;
		font-size:12px;
	}
</style>
</head>
<body>
	<div class="SGBoardArea">
		<div class="SGBoardListArea">
			<h3>최근 게시물</h3>
			<div class="SGLastBoardArea">
				<div class="SGTitleArea">2018년 KH정보교육원 학생들의 모임</div><br>
				<div class="SGBoardReadCheckArea">
					<img src="${ contextPath }/resources/images/studyGroup/checked.png">
				</div>
				<div class="SGBoardTitleArea">이거 문제좀 풀어주세요</div>
			</div>
			<div class="SGLastBoardArea">
				<div class="SGTitleArea">2018년 KH정보교육원 학생들의 모임</div><br>
				<div class="SGBoardReadCheckArea">
					<img src="${ contextPath }/resources/images/studyGroup/checked.png">
				</div>
				<div class="SGBoardTitleArea">이거 문제좀 풀어주세요</div>
			</div>
			<div class="SGLastBoardArea">
				<div class="SGTitleArea">2018년 KH정보교육원 학생들의 모임</div><br>
				<div class="SGBoardReadCheckArea">
					<img src="${ contextPath }/resources/images/studyGroup/checked.png">
				</div>
				<div class="SGBoardTitleArea">이거 문제좀 풀어주세요</div>
			</div>
		</div>
		<div class="SGMyBoardListArea">
			<h3>내 게시물</h3>
			<div class="SGMyBoardArea">
				<div class="SGTitleArea">2018년 KH정보교육원 학생들의 모임</div><br>
				<div class="SGBoardReadCheckArea">
					<img src="${ contextPath }/resources/images/studyGroup/checked.png">
				</div>
				<div class="SGBoardTitleArea">정답 공유해드립니다</div>
			</div>
			<div class="SGMyBoardArea">
				<div class="SGTitleArea">2018년 KH정보교육원 학생들의 모임</div><br>
				<div class="SGBoardReadCheckArea">
					<img src="${ contextPath }/resources/images/studyGroup/checked.png">
				</div>
				<div class="SGBoardTitleArea">정답 공유해드립니다</div>
			</div>
			<div class="SGMyBoardArea">
				<div class="SGTitleArea">2018년 KH정보교육원 학생들의 모임</div><br>
				<div class="SGBoardReadCheckArea">
					<img src="${ contextPath }/resources/images/studyGroup/checked.png">
				</div>
				<div class="SGBoardTitleArea">정답 공유해드립니다</div>
			</div>
		</div>
	</div>
</body>
</html>