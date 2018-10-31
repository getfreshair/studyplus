<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.SGListAdArea img {
		width:100%;
		height:170px;
		margin-bottom:5px;
	}
	.SGInfoArea {
		background:white;
		display:inline-block;
		width:385px;
		text-align:left;
		margin-bottom:20px;
	}
	.SGInfoThumbnailImgArea {
		display:inline-block;
	}
	.SGListInfoArea {
		text-align:justify;
		margin-bottom:10px;
	}
	.SGInfoRightArea {
		width:245px;
		position:absolute;
		display:inline-block;
	}
	.SGInfoThumbnailImg {
		width: 140px;
    	height: 180px;
	}
	.SGInfoCategoryArea, .SGInfoLocationArea {
		display:inline-block;
		margin:12px;
		margin-bottom: 0px;
		font-size:12px;
	}
	.SGInfoBossImg {
		width:40px;
		height:40px;
		border-radius: 37%;
    	margin: 5px;
	}
	.SGInfoTitleArea {
		display:inline-block;
		width:245px;
		font-size: 14px;
		padding-right: 5px;
    	font-weight: 450;
    	white-space: nowrap;
    	overflow: hidden;
    	text-overflow: ellipsis;
	}
	.SGInfoCommentArea {
		width: 245px;
	    height: 33px;
	    font-size: 12px;
	    padding: 10px;
	    padding-top: 4px;
		overflow: hidden;
		white-space: normal;
		line-height: 1.2;
		text-align: left;
		word-wrap: break-word;
		display: -webkit-box;
		-webkit-line-clamp: 2;
		-webkit-box-orient: vertical;
	}
	.SGInfoDGArea {
		text-align:justify;
	}
	.SGDateArea, .SGGoalArea {
		display: table-cell;
	    width: 123px;
	    font-size: 12px;
	    font-weight:bold;
	    padding: 11px;
	    padding-top:7px;
	    padding-bottom:7px;
	}
	.SGInfoMaxCrewArea {
		width:245px;
		height:32px;
		font-size: 12px;
		font-weight:bold;
		padding-left:10px;
	}
	.SGInfoLockArea {
		display:inline-block;
		float:right;
	}
	.SGInfoLockImg {
		width: 15px;
    	height: 15px;
    	margin-right:10px;
	}
	.SGPIArea {
		text-align:center;
		margin-bottom:30px;
	}
	.SGPageBtn {
		display: inline-block;
	    background: #FCCE00;
	    color:white;
	    border-radius: 10%;
	    height: 40px;
	    width: 40px;
	    font-size: 21px;
	    padding-right: 1px;
	    padding-top: 4px;
	}
</style>
<script>
	$(function(){
		selectSGList($('.searchGroupName').val(), 1);
	});
	
	function moreSGList(searchSGName, currentPage){
		selectSGList(searchSGName, pageNo);
	}
	
	function selectSGList(searchSGName, currentPage){
		$.ajax({
			url: 'selectStudyGroupList.sg',
			data: {
				searchSGName : searchSGName,
				currentPage : currentPage
			},
			beforeSend : function(){
				
			},
			success : function(data){
				$SGListInfoArea = $('.SGListInfoArea');
				$SGInfoArea = $('<div class="SGInfoArea">');
				$SGInfoThumbnailImgArea = $('<div class="SGInfoThumbnailImgArea">');
				$SGInfoThumbnailImg = $('<img class="SGInfoThumbnailImg">').attr('src', "${ contextPath }/resources/images/studyGroup/poster.jpg");
				$SGInfoRightArea = $('<div class="SGInfoRightArea">');
				$SGInfoCLArea = $('<div class="SGInfoCLArea">');
				$SGInfoCategoryArea = $('<div class="SGInfoCategoryArea">').append('카테고리');
				$SGInfoLocationArea = $('<div class="SGInfoLocationArea">').append('지역');
				$SGInfoTitleArea = $('<div class="SGInfoTitleArea">'); //아래 이미지 어펜드 후 제목 어펜드
				$SGInfoBossImg = $('<img class="SGInfoBossImg">').attr('src', "${contextPath}/resources/upload/member/thumbnail/${sessionScope.loginUser.member_Files.files_Name}");
				$SGInfoCommentArea = $('<div class="SGInfoCommentArea">').append('There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which dont look even slightly believable.');
				$SGInfoDGArea = $('<div class="SGInfoDGArea">');
				$SGDateArea = $('<div class="SGDateArea">').append('2018년 10월 24일');
				$SGGoalArea = $('<div class="SGGoalArea">').append('일간 목표 : ' + '12시간');
				$SGInfoMaxCrewArea = $('<div class="SGInfoMaxCrewArea">').append('모집 인원 : ' + '15' + '명 / ' + '20' + '명');
				$SGInfoLockArea = $('<div class="SGInfoLockArea">');
				$SGInfoLockImg = $('<img class="SGInfoLockImg">').attr('src', '${ contextPath }/resources/images/studyGroup/key.png');
				
				$SGInfoThumbnailImgArea.append($SGInfoThumbnailImg);
				$SGInfoRightArea.append($SGInfoThumbnailImgArea);
				$SGInfoCLArea.append($SGInfoCategoryArea);
				$SGInfoCLArea.append($SGInfoLocationArea);
				$SGInfoRightArea.append($SGInfoCLArea);
				$SGInfoTitleArea.append($SGInfoBossImg);
				$SGInfoTitleArea.append("'SHOW ME THE MONEY' IN START");
				$SGInfoRightArea.append($SGInfoTitleArea);
				$SGInfoRightArea.append($SGInfoCommentArea);
				$SGInfoDGArea.append($SGDateArea);
				$SGInfoDGArea.append($SGGoalArea);
				$SGInfoRightArea.append($SGInfoDGArea);
				
				$SGInfoLockArea.append($SGInfoLockImg);
				$SGInfoMaxCrewArea.append($SGInfoLockArea);
				$SGInfoRightArea.append($SGInfoMaxCrewArea);
				$SGInfoArea.append($SGInfoThumbnailImgArea);
				$SGInfoArea.append($SGInfoRightArea);
				
				$SGListInfoArea.append($SGInfoArea);
			}
		});
	};
</script>
</head>
<body>
	<div class="SGListAdArea"><img src="${contextPath}/resources/images/ad/ad2.jpg"></div>
	<div class="SGListInfoArea"></div>
	<div class="SGPIArea"><div class="SGPageBtn">1</div></div>
</body>
</html>