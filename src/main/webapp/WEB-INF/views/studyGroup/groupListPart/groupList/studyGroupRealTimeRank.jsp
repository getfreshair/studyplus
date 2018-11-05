<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	.SGRTRankArea {
		width:1200px;
		text-align:center;
		background:white;
    	margin: 0 auto;
		margin-top: 5px;
	}
	.SGRTRankArea > h3 {
		margin: 0px;
    	padding-top: 10px;
    	font-size: 15px;
	}
	.SGRTRankLeftArea, .SGRTRankRightArea {
		display: inline-block;
	    width: 590px;
	    text-align: left;
	    box-sizing:border-box;
	    padding-top: 10px;
    	padding-left: 20px;
    	padding-bottom: 10px;
	}
	.SGRTRankArea h4 {
		margin:0px;
		margin-left:56px;
		display: inline-block;
    	width: 438px;
    	font-size:16px;
    	position: absolute;
    	margin-top: 10px;
    	white-space: nowrap;
    	overflow: hidden;
    	text-overflow: ellipsis;
	}
	.SGRTRankArea p {
		position: relative;
    	top: 27px;
		margin:0px;
		font-size:14px;
		margin-left:56px;
		display: inline-block;
    	width: 438px;
    	margin-bottom: 30px;
    	white-space: nowrap;
    	overflow: hidden;
    	text-overflow: ellipsis;
	}
	.RTRankSG span {
		position: absolute;
	    display: inline-block;
	    width: 56px;
	    line-height: 60px;
	    color: #49CDF4;
	    font-size: 17px;
	    text-align: center;
	    font-style: italic;
	}
	.RTRankSG {
		padding-top:8px;
		padding-bottom:8px;
	}
	.RTRankSG img{
		float:right;
		border-radius:42%;
		width:55px;
		height:55px;
		margin-right: 15px;
	}
</style>
<script>
	$(function(){
		var category_Code = $('input:radio[class=category_Code]:checked').val();
		var category_Name;
		
		switch(category_Code){
			case '1' : category_Name = '고입 '; break;
			case '2' : category_Name = '대입 '; break;
			case '3' : category_Name = '고시 '; break;
			case '4' : category_Name = '공시 '; break;
			case '5' : category_Name = '외국어 '; break;
			case '6' : category_Name = '취준 '; break;
			case '7' : category_Name = '자격증 '; break;
			case '8' : category_Name = '기타 '; break;
			default : category_Name = '전체 '; break;
		}
		
		$('.SGRTRankArea h3').empty().append(category_Name + '스터디 그룹 랭킹');
		
		
		$.ajax({
			url : 'selectStudyGroupSGRTRankList.sg',
			data : {
				category_Code : category_Code
			},
			beforeSend : function(){
				
			},
			success : function(data){
				var index = 1
				
				for(var key in data){
					if(data[key].STUDYGROUP_RANK < 6){
						$leftRTRankSG = $('<div class="RTRankSG">');
						$leftspan = $('<span>').append(index);
						$lefth4 = $('<h4>').append(data[key].STUDYGROUP_NAME);
						$leftp = $('<p>').append(data[key].STUDYGROUP_INTRO);
						$leftimg = $('<img>').attr('src','/studyplus/resources/upload/studygroup/thumbnail/' + data[key].FILES_NAME);
						
						$leftRTRankSG.append($leftspan);
						$leftRTRankSG.append($lefth4);
						$leftRTRankSG.append($leftp);
						$leftRTRankSG.append($leftimg);
						
						$('.SGRTRankLeftArea').append($leftRTRankSG);
						
						index++;
					}
				}
				
				for(var key in data){
					if(data[key].STUDYGROUP_RANK > 5){
						$rightRTRankSG = $('<div class="RTRankSG">');
						$rightspan = $('<span>').append(index);
						$righth4 = $('<h4>').append(data[key].STUDYGROUP_NAME);
						$rightp = $('<p>').append(data[key].STUDYGROUP_INTRO);
						$rightimg = $('<img>').attr('src','/studyplus/resources/upload/studygroup/thumbnail/' + data[key].FILES_NAME);
						
						$rightRTRankSG.append($rightspan);
						$rightRTRankSG.append($righth4);
						$rightRTRankSG.append($rightp);
						$rightRTRankSG.append($rightimg);
						
						$('.SGRTRankRightArea').append($rightRTRankSG);
						
						index++;
					}
				}
			}
		});
	});
</script>
</head>
<body>
	<div class="SGRTRankArea">
		<h3>취준 스터디 그룹 랭킹</h3>
		<div class="SGRTRankLeftArea"></div>
		<div class="SGRTRankRightArea"></div>
	</div>
</body>
</html>