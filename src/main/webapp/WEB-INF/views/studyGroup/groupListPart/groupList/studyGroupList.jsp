<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		margin-bottom:20px;
	}
	.SGInfoArea:nth-of-type(1n), .SGInfoArea:nth-of-type(2n) {
		margin-right:22px;
	}
	.SGInfoArea:nth-of-type(3n) {
		margin-right:0px;
		margin-left: 1px;
	}
	.SGInfoThumbnailImgArea {
		display:inline-block;
	}
	.SGListInfoArea {
		text-align:justify;
		margin-bottom:30px;
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
	.SGInfoLockArea img {
		width: 15px;
    	height: 15px;
    	margin-right:10px;
	}
	.SGPIArea {
		display:block;
		text-align:center;
		margin-bottom: 30px;
	}
	.SGPageBtn {
		display: inline-block;
		background:white;
		padding: 8px;
		border-radius: 50%;
	    width: 35px;
	    height: 35px;
	    font-size: 12px;
	    color:#BDBDBD;
	    border: 1px solid currentColor;
	    margin-left: 2px;
    	margin-right: 2px;
	}
</style>
<script>
	$(function(){
		selectSGList($('.searchSGName').val(), $("input:radio[class=category_Code]:checked").val(), $("input:radio[class=location_Code]:checked").val(), 1);
	});
	
	function moreSGList(searchSGName, category_Code, location_Code, currentPage){
		selectSGList(searchSGName, category_Code, location_Code, currentPage);
	}
	
	function selectSGList(searchSGName, category_Code, location_Code, currentPage){
		$.ajax({
			url: 'selectStudyGroupList.sg',
			data: {
				searchSGName : searchSGName,
				category_Code : category_Code,
				location_Code : location_Code,
				currentPage : currentPage
			},
			beforeSend : function(){
				
			},
			success : function(data){
				$('.SGListInfoArea').empty();
				$('.SGPIArea').empty();
				
				for(var key in data){
					if(key <= (data.length - 2)){
						$SGInfoArea = $('<div class="SGInfoArea">');
						$SGInfoThumbnailImgArea = $('<div class="SGInfoThumbnailImgArea">');
						$SGInfoThumbnailImg = $('<img class="SGInfoThumbnailImg">').attr('src', "/studyplus/resources/upload/studygroup/thumbnail/" + data[key].SGFILES_NAME);
						$SGInfoRightArea = $('<div class="SGInfoRightArea">');
						$SGInfoCLArea = $('<div class="SGInfoCLArea">');
						$SGInfoCategoryArea = $('<div class="SGInfoCategoryArea">').append(data[key].CATEGORY_NAME);
						$SGInfoLocationArea = $('<div class="SGInfoLocationArea">').append(data[key].LOCATION_NAME);
						$SGInfoTitleArea = $('<div class="SGInfoTitleArea">');
						$SGInfoBossImg = $('<img class="SGInfoBossImg">').attr('src', "/studyplus/resources/upload/member/thumbnail/" + data[key].MFILES_NAME);
						$SGInfoCommentArea = $('<div class="SGInfoCommentArea">').append(data[key].STUDYGROUP_INTRO);
						$SGInfoDGArea = $('<div class="SGInfoDGArea">');
						$SGDateArea = $('<div class="SGDateArea">').append(data[key].STUDYGROUP_STDATE);
						$SGGoalArea = $('<div class="SGGoalArea">').append('일간 목표 : ' + data[key].STUDYGROUP_GOALTIME + '시간');
						$SGInfoMaxCrewArea = $('<div class="SGInfoMaxCrewArea">').append('모집 인원 : ' + data[key].JOINGROUP_MEMBERCOUNT + '명 / ' + data[key].STUDYGROUP_MAXNUM + '명');
						$SGInfoLockArea = $('<div class="SGInfoLockArea">');
						$SGInfoLockImg = $('<img>').attr('src', '/studyplus/resources/images/studyGroup/key.png');
						
						$SGInfoThumbnailImgArea.append($SGInfoThumbnailImg);
						$SGInfoRightArea.append($SGInfoThumbnailImgArea);
						$SGInfoCLArea.append($SGInfoCategoryArea);
						$SGInfoCLArea.append($SGInfoLocationArea);
						$SGInfoRightArea.append($SGInfoCLArea);
						$SGInfoTitleArea.append($SGInfoBossImg);
						$SGInfoTitleArea.append(data[key].STUDYGROUP_NAME);
						$SGInfoRightArea.append($SGInfoTitleArea);
						$SGInfoRightArea.append($SGInfoCommentArea);
						$SGInfoDGArea.append($SGDateArea);
						$SGInfoDGArea.append($SGGoalArea);
						$SGInfoRightArea.append($SGInfoDGArea);
						
						if(data[key].STUDYGROUP_OPENSTATUS != 0){
							$SGInfoLockArea.append($SGInfoLockImg);	
						}
						
						$SGInfoMaxCrewArea.append($SGInfoLockArea);
						$SGInfoRightArea.append($SGInfoMaxCrewArea);
						$SGInfoArea.append($SGInfoThumbnailImgArea);
						$SGInfoArea.append($SGInfoRightArea);
						
						$('.SGListInfoArea').append($SGInfoArea);
					}else{
						if(data[key].pi.startPage > 9){
							$SGPageBtn = $('<div class="SGPageBtn">').append('<<');
							$SGPageBtn.attr('onclick', 'moreSGList("' + data[key].pi.searchSGName + '", "' + data[key].pi.category_Code + '", "' + data[key].pi.location_Code + '", "' + (data[key].pi.startPage - 1) + '")');
							$('.SGPIArea').append($SGPageBtn);
						}
						
						if(data[key].pi.currentPage > 1){
							$SGPageBtn = $('<div class="SGPageBtn">').append('<');
							$SGPageBtn.attr('onclick', 'moreSGList("' + data[key].pi.searchSGName + '", "' + data[key].pi.category_Code + '", "' + data[key].pi.location_Code + '", "' + (data[key].pi.currentPage - 1) + '")');
							$('.SGPIArea').append($SGPageBtn);
						}
						
						for(var i = data[key].pi.startPage; i <= data[key].pi.endPage; i++){
							$SGPageBtn = $('<div class="SGPageBtn">').append(i);
							$SGPageBtn.attr('onclick', 'moreSGList("' + data[key].pi.searchSGName + '", "' + data[key].pi.category_Code + '", "' + data[key].pi.location_Code + '", "' + i + '")');
							$('.SGPIArea').append($SGPageBtn);
						}
						
						if(data[key].pi.currentPage < data[key].pi.maxPage){
							$SGPageBtn = $('<div class="SGPageBtn">').append('>');
							$SGPageBtn.attr('onclick', 'moreSGList("' + data[key].pi.searchSGName + '", "' + data[key].pi.category_Code + '", "' + data[key].pi.location_Code + '", "' + (data[key].pi.currentPage + 1) + '")');
							$('.SGPIArea').append($SGPageBtn);
						}
						
						if(data[key].pi.endPage < data[key].pi.maxPage){
							$SGPageBtn = $('<div class="SGPageBtn">').append('>>');
							$SGPageBtn.attr('onclick', 'moreSGList("' + data[key].pi.searchSGName + '", "' + data[key].pi.category_Code + '", "' + data[key].pi.location_Code + '", "' + (data[key].pi.endPage + 1) + '")');
							$('.SGPIArea').append($SGPageBtn);
						}
					}
				}
			}
		});
	};
</script>
</head>
<body>
	<div class="SGListAdArea"><img src="/studyplus/resources/images/ad/ad2.jpg"></div>
	<div class="SGListInfoArea"></div>
	<div class="SGPIArea"></div> 
</body>
</html>