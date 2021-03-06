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
	    background-image: url("/studyplus/resources/images/studyGroup/insertGroup.png");
	    background-size:100% 100%;
	    text-align: left;
		padding-left: 10px;
		padding-top: 5px;
		font-weight: bold;
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
		height:307px;
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
		display:table;
		margin:0 auto;
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
		overflow: hidden;
	}
	.SGMyBoardListArea{
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
	.SGTitleArea:hover {
		cursor:pointer;
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
	.insertSGImgAreaInfo {
		text-align:left;
		font-weight: 600;
    	margin-top: 15px;
	}
</style>
<script>
	$(function(){
		var member_Code = ${ sessionScope.loginUser.member_Code };
		
		$.ajax({
			url : 'studyGroupInSGRankingList.sg',
			data : {
				member_Code : member_Code
			},
			beforeSend : function(){
				$img = $('<img>');
				$img.attr('src', '/studyplus/resources/images/studyGroup/groupListLoading.gif');
				$img.css({
					'width': '50px',
					'height': '50px',
					'display': 'inline-block',
					'margin-left': '403px',
					'margin-top': '50px'
				});
			},
			success : function(data){
				for(var key in data){
					$inSGTitleArea = $('<div class="inSGTitleArea">').append(data[key].STUDYGROUP_NAME);
					$('.inSGTitleListArea').append($inSGTitleArea);
					$inSGRankingArea = $('<div class="inSGRankingArea">').append(data[key].CATEGORY_NAME + ' ' + data[key].RANK + '위 / ' + data[key].CATEGORY_TOTALNUM + '위');
					$('.inSGTitleListArea').append($inSGRankingArea);
				}
			}
		});	
		
		$.ajax({
			url : 'studyGroupInSGLastBoardList.sg',
			data : {
				member_Code : member_Code
			},
			beforeSend : function(){
				$img = $('<img>');
				$img.attr('src', '/studyplus/resources/images/studyGroup/groupListLoading.gif');
				$img.css({
					'width': '50px',
					'height': '50px',
					'display': 'inline-block',
					'margin-left': '403px',
					'margin-top': '50px'
				});
				
				$('.SGLastBoardArea').append($img);
			},
			success : function(data){
				if(data != ','){
					for(var i = 0; i < data.length; i++){
						if(data[i] != null){
							$SGLastBoardArea = $('<div class="SGLastBoardArea">');
							$SGTitleArea = $('<div class="SGTitleArea">').append(data[i].GROUPBOARD_TITLE);
							$SGLastBoardArea.append($SGTitleArea);
							$SGBoardReadCheckArea = $('<div class="SGBoardReadCheckArea">').append($('<img>').attr('src', '/studyplus/resources/images/studyGroup/checked.png'));
							$SGLastBoardArea.append($SGBoardReadCheckArea);
							$SGBoardTitleArea = $('<div class="SGBoardTitleArea">').append(data[i].GROUPBOARD_CONTENT);
							$SGLastBoardArea.append($SGBoardTitleArea);
							
							$('.SGBoardListArea').append($SGLastBoardArea);
						}
					}
				}
			}
		});
		
		$.ajax({
			url : 'studyGroupInSGMyBoardArea.sg',
			data : {
				member_Code : member_Code
			},
			beforeSend : function(){
				$img = $('<img>');
				$img.attr('src', '/studyplus/resources/images/studyGroup/groupListLoading.gif');
				$img.css({
					'width': '50px',
					'height': '50px',
					'display': 'inline-block',
					'margin-left': '403px',
					'margin-top': '50px'
				});
				
				$('.SGLastBoardArea').append($img);
			},
			success : function(data){
				for(var key in data){
					$SGMyBoardArea = $('<div class="SGMyBoardArea">');
					$SGTitleArea = $('<div class="SGTitleArea">').append(data[key].GROUPBOARD_TITLE);
					$SGMyBoardArea.append($SGTitleArea);
					$SGBoardReadCheckArea = $('<div class="SGBoardReadCheckArea">').append($('<img>').attr('src', '/studyplus/resources/images/studyGroup/checked.png'));
					$SGMyBoardArea.append($SGBoardReadCheckArea);
					$SGBoardTitleArea = $('<div class="SGBoardTitleArea">').append(data[key].GROUPBOARD_CONTENT);
					$SGMyBoardArea.append($SGBoardTitleArea);
					
					$('.SGMyBoardListArea').append($SGMyBoardArea);
				}
			}
		});
	});
	
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
				$img.attr('src', '/studyplus/resources/images/studyGroup/groupListLoading.gif');
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
			Create study group
			<p class="insertSGImgAreaInfo"><u>스터디 그룹 생성하고,<br>최고의 그룹을 이끌어 가세요 </u>&nbsp; > </p>
		</div>
		<div class="SGBoardArea">
			<div class="SGBoardChooseBtnArea">
				<ul class="SGBoardChooseBtnUl">
					<li onclick="SGBoardList('SGBoardListArea')"><img src="/studyplus/resources/images/studyGroup/pencil.png"/> 최근 게시글</li>
					<li onclick="SGBoardList('SGMyBoardListArea')"><img>내 게시글</li>
				</ul>
			</div>
			<div class="SGBoardListArea"></div>
			<div class="SGMyBoardListArea"></div>
		</div>
		<div class="inSGTitleListArea"><h4>참여 그룹 순위</h4></div>
	</div>
</body>
</html>