<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	.SGMainBodyRightArea {
		width:333px;
		margin-left:7px;
		margin-bottom:7px;
	}
	.insertSGImgArea {
		border-radius:10px;
		width:100%;
	    height:100px;
	    background:#FCCE00;
	    text-align:center;
	}
	.insertSGImgArea img{
		margin-top:32px;
	}
	.insertSGImgArea:hover {
		cursor:pointer;
	}
	.inSGTitleListArea {
		width:100%;
		box-shadow: 0px 5px 5px 0px #D8D8D8;
		background:white;
		border-radius:10px;
		margin-top:5px;
		padding-top:5px;
		text-align:center;
	}
	.inSGTitleListArea h4{
		border-radius:7px;
		margin:5px;
		margin-top:0px;
		color:black;
		font-size:13px;
		padding-bottom:3px;
	}
	.inSGTitleArea {
		display:inline-block;
		margin-bottom:5px;
		background:cadetblue;
		border-radius:10px;
		padding-top: 1px;
    	padding-bottom: 1px;
		padding-left:10px;
		padding-right:10px;
		font-size:12px;
		color:white;
	}
	.inSGRankingArea {
		display:inline-block;
		border:1px solid lightgray;
		padding-left:10px;
		padding-right:10px;
		border-radius:10px;
		margin-bottom:10px;
		font-size:13px;
	}
	.inSGRankingArea {
		background:#F6F6F6;
	}
	.SGBoardArea {
		width:100%;
		box-shadow: 0px 5px 5px 0px #D8D8D8;
		background:white;
		border-radius:10px;
		margin-top:5px;
		padding-top:5px;
		text-align:center;
	}
	.SGBoardListArea, .SGMyBoardListArea {
		display:inline-block;
		width:98%;
		border-radius:10px;
		text-align:center;
		margin:0 auto;
		height:162px;
	}
	.SGMyBoardListArea {
		display:none;
	}
	.SGLastBoardArea, .SGMyBoardArea {
		border-bottom:1px solid #f0f0f0;
    	display: table;
	}
	.SGTitleArea {
		display:inline-block;
		width:100%;
		padding-top: 1px;
    	padding-bottom: 1px;
		margin-top:5px;
		margin-bottom:5px;
		font-size:13px;
	}
	.SGBoardReadCheckArea {
		display:inline-block;
		float:left;
	}
	.SGBoardReadCheckArea img{
		width:20px;
		height:20px;
		margin-left:10px;
		margin-bottom:3px;
	}
	.SGBoardTitleArea {
		display:inline-block;
		text-align:left;
		float:left;
		width:287px;
		margin-top:2px;
		margin-left:9px;
		font-size:12px;
	}
	.SGBoardChooseBtnUl {
		width:100%;
		list-style:none;
		display:inline-block;
		margin:0px;
		padding:0px;
		font-size:12px;
		padding-top:7px;
		padding-bottom:7px;
	}
	.SGBoardChooseBtnUl li {
		float:left;
		width:49.5%;
		text-align:center;
		cursor:pointer;
	}
	.SGBoardChooseBtnUl li:first-child {
		border-right:1px solid gray;
		font-weight:bold;
	}
	.SGBoardChooseBtnUl li:last-child img {
		display:none;
	}
	.SGBoardChooseBtnUl li img {
		width:20px;
		height:20px;
	}
</style>
<script>
	function SGBoardList(page){
		if(page == 'SGBoardListArea') {
			$('.SGBoardChooseBtnUl li').css('font-weight', 'unset');
			$('.SGBoardChooseBtnUl li:first-child').css('font-weight', 'bold');
			$('.SGBoardListArea').css('display', 'inline-block');
			$('.SGMyBoardListArea').css('display', 'none');
		}else {
			$('.SGBoardChooseBtnUl li').css('font-weight', 'unset');
			$('.SGBoardChooseBtnUl li:last-child').css('font-weight', 'bold');
			$('.SGBoardListArea').css('display', 'none');
			$('.SGMyBoardListArea').css('display', 'inline-block');
		}
	}
	
	function studyGroupInsertPage(){
		$.ajax({
			url: 'studyGroupInsertPage.sg',
			beforeSend : function(){
				var path = '${ contextPath }';
				
				$('.SGHeaderArea').css('display', 'none');
				$('.SGContentArea').css('display', 'none');
				
				$img = $('<img>');
				$img.attr('src', path + '/resources/images/studyGroup/groupListLoading.gif');
				$img.css({
					'width': '50px',
					'height': '50px',
					'display': 'inline-block',
					'margin-left': '575px'
				});
				$('html, body').css('background', 'white');
				
				$('.SGInsertArea').attr('display', 'block');
				$('.SGInsertArea').html($img);
			},
			success: function(data){
				$('.SGInsertArea').empty();
				$('.SGInsertArea').html(data);
			}
		});
	}
</script>
</head>
<body>
	<div class="SGMainBodyRightArea">
		<div class="insertSGImgArea" onclick="studyGroupInsertPage()">
			<img src="${contextPath}/resources/images/studyGroup/insertGroup.png">
		</div>
		<div class="SGBoardArea">
			<div class="SGBoardChooseBtnArea">
				<ul class="SGBoardChooseBtnUl">
					<li onclick="SGBoardList('SGBoardListArea')"><img src="${contextPath}/resources/images/studyGroup/pencil.png"/> 최근 게시글</li>
					<li onclick="SGBoardList('SGMyBoardListArea')"><img>내 게시글</li>
				</ul>
			</div>
			<div class="SGBoardListArea">
				<div class="SGLastBoardArea">
					<div class="SGTitleArea">2018년 KH정보교육원 학생들의 모임</div><br>
					<div class="SGBoardReadCheckArea">
						<img src="${ contextPath }/resources/images/studyGroup/checked.png">
					</div>
					<div class="SGBoardTitleArea">이거 문제좀 풀어주세요</div>
				</div>
			</div>
			<div class="SGMyBoardListArea">
				<div class="SGMyBoardArea">
					<div class="SGTitleArea">연봉을 올려봐요!!!</div><br>
					<div class="SGBoardReadCheckArea">
						<img src="${ contextPath }/resources/images/studyGroup/checked.png">
					</div>
					<div class="SGBoardTitleArea">정답 공유해드립니다</div>
				</div>
			</div>
		</div>
		<div class="inSGTitleListArea">
			<h4>참여 그룹 순위</h4>
			<div class="inSGTitleArea">2018년 KH정보교육원 학생들의 모임</div>
			<div class="inSGRankingArea">카테고리 283위 / 3,203위</div>
			<div class="inSGTitleArea">2018년 KH정보교육원 학생들의 모임</div>
			<div class="inSGRankingArea">카테고리 283위 / 3,203위</div>
			<div class="inSGTitleArea">2018년 KH정보교육원 학생들의 모임</div>
			<div class="inSGRankingArea">카테고리 283위 / 3,203위</div>
			<div class="inSGTitleArea">2018년 KH정보교육원 학생들의 모임</div>
			<div class="inSGRankingArea">카테고리 283위 / 3,203위</div>
			<div class="inSGTitleArea">2018년 KH정보교육원 학생들의 모임</div>
			<div class="inSGRankingArea">카테고리 283위 / 3,203위</div>
		</div>
	</div>
</body>
</html>