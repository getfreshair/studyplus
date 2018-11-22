<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
	.SGMainBodyLeftArea {
		width:857px;
	}
	.adArea img {
		width:860px;
		height:150px;
	}
	.adArea > img:hover {
		cursor:pointer;
	}
	.inSGArea {
		box-shadow: 0px 5px 5px 0px #D8D8D8;
		margin-bottom:7px;
		background:white;
	}
	.inSGArea:first-child {
		border-top-right-radius:0px;
		border-top-left-radius:0px;
	}
	.inSGImgArea {
		display:inline-block;
	}
	.inSGImgArea:hover {
		cursor:pointer;
	}
	.inSGArea:first-child .inSGImgArea img:first-child {
		border-top-left-radius:0px;
	}
	.inSGImgArea img {
		width:300px;
		height:217px;
	}
	.inSGInfoArea {
		margin-left:10px;
		margin-right:10px;
		position: absolute;
		display:inline-block;
	    width:538px;
	    text-align:center;
	}
	.inSGTitle {
		display:inline-block;
		width:100%;
		padding-top:10px;
	}
	.inSGTitle h4 {
		display:inline-block;
		background:#FCCE00;
		border-radius:8px;
		padding-left:20px;
		padding-right:20px;
		margin-top:5px;
		margin-bottom:5px;
		font-size:15px;
		font-weight:bold;
		padding-top:3px;
    	padding-bottom:3px;
	}
	.inSGTitle h4:hover {
		cursor:pointer;
	}
	.inSGTitle img {
		width:25px;
		height:25px;
		margin-bottom:4px;
	}
	.inSGIntro {
		font-size: 12px;
	    width: 100%;
	    color: #3D3D3D;
	    text-align: center;
	}
	.inSGEnrolldate, .inSGDate {
		display: inline-block;
    	margin-top: 5px;
    	width: 266px;
    	font-size: 12px;
    	font-weight: bold;
    	text-align:left;
	}
	.SGEnrolldate {
		display: inline-block;
    	margin-top: 5px;
    	width: 266px;
    	font-size: 12px;
    	font-weight: bold;
    	text-align:center;
	}
	.inSGJoinTime {
		display:inline-block;
		background:white;
		margin-top:5px;
		width:151px;
		padding:3px;
		padding-left:0px;
		border-radius:7px;
		font-weight:bold;
		font-size:12px;
		margin-right:3px;
		overflow:hidden;
		text-align:left;
	}
	.inSGAim {
		position:relative;
		display:inline-block;
		background:lightgray;
		margin-top:5px;
		width:374px;
		border-radius:7px;
		font-size:12px;
		margin-right:4px;
		text-align: left;
		overflow:hidden;
		height:22px;
	}
	.inSGAimProgress {
		position:absolute;
		display:inline-block;
		background:#FCCE00;
		border-radius:7px;
		padding:3px;
		font-size:12px;
		margin-right:4px;
		height:22px;
	}
	.inSGAimPercent {
		position:absolute;
		width:374px;
		text-align:center;
		margin-top:3px;
	}
	.inSGUserImage {
		display:inline-block;
	}
	.inSGUserImage img {
		width:28px;
		height:28px;
		border-radius:50%;
	}
	.SGUserImage {
		display:inline-block;
	}
	.SGUserImage img {
		width:50px;
		height:50px;
		margin-top: 4px;
	}
	.SGUserImage img:hover {
		cursor:pointer;
	}
	.inSGUserImage img:hover {
		cursor:pointer;
	}
	.inSGUserImageArea {
		width: 543px;
    	display: inline-block;
    	font-size: 12px;
	}
	.inSGUserInfo {
		font-weight:bold;
		padding-bottom: 5px;
	}
	.SGListChangeUl {
		width:860px;
		list-style:none;
		display:inline-block;
		margin:0px;
		padding:0px;
		font-size:12px;
		padding-top:7px;
		padding-bottom:7px;
	}
	.SGListChangeUl li {
		float:left;
		width:286px;
		text-align:center;
		cursor:pointer;
	}
	.SGListChangeUl li:first-child {
		border-right:1px solid gray;
		font-weight:bold;
	}
	.SGListChangeUl li:last-child {
		border-left:1px solid gray;
	}
	.inMySGListArea, .recommendationSGListArea {
		display:none;
	}
</style>
<script>
	function changeGroupList(page){
		if(page == 'inSGListArea') {
			$('.SGListChangeUl li').css('font-weight', 'unset');
			$('.SGListChangeUl li:first-child').css('font-weight', 'bold');
			$('.inSGListArea').css('display', 'block');
			$('.inMySGListArea').css('display', 'none');
			$('.recommendationSGListArea').css('display', 'none');
		}else if(page == "inMySGListArea") {
			$('.SGListChangeUl li').css('font-weight', 'unset');
			$('.SGListChangeUl li:nth-of-type(2)').css('font-weight', 'bold');
			$('.inSGListArea').css('display', 'none');
			$('.inMySGListArea').css('display', 'block');
			$('.recommendationSGListArea').css('display', 'none');
		}else {
			$('.SGListChangeUl li').css('font-weight', 'unset');
			$('.SGListChangeUl li:last-child').css('font-weight', 'bold');
			$('.inSGListArea').css('display', 'none');
			$('.inMySGListArea').css('display', 'none');
			$('.recommendationSGListArea').css('display', 'block');
		}
	}
	
	$(function(){
		var member_Code = '${ sessionScope.loginUser.member_Code }';
		
		$.ajax({
			url: 'studyGroupSelectJoinSGList.sg',
			type : 'POST',
			data : {
				member_Code : member_Code
			},
			beforeSend : function(){
				$('.inSGListArea').empty();
				
				$img = $('<img>');
				$img.attr('src', '/studyplus/resources/images/studyGroup/groupListLoading.gif');
				$img.css({
					'width': '50px',
					'height': '50px',
					'display': 'inline-block',
					'margin-left': '403px',
					'margin-top': '50px'
				});
				
				$('.inSGListArea').html($img);
			},
			success : function(data){
				var studygroup_Code = -1;
				var loginuser_Code = ${sessionScope.loginUser.member_Code}; 
				var mySGTrophy_Temp = 1;
				
				$('.inSGListArea').empty();
				for(var key in data){
					if(studygroup_Code != data[key].STUDYGROUP_CODE){
						studygroup_Code = data[key].STUDYGROUP_CODE;
						
						$inSGArea = $('<div class="inSGArea">');
						$inSGImgARea = $('<div class="inSGImgArea">');
						$inSGImg = $('<img>').attr('src', "/studyplus/resources/upload/studygroup/thumbnail/" + data[key].FILES_SUTDYGROUPNAME);
		        		$inSGImg.attr('onclick', "SGdetailPage(" + data[key].STUDYGROUP_CODE + ")");
						$inSGInfoArea = $('<div class="inSGInfoArea">');
						$inSGTitle = $('<div class="inSGTitle">');
						$inSGTrophyImg = $('<img>').attr('src', "/studyplus/resources/images/studyGroup/trophy.png");
						$inSGTitleH4 = $('<h4>').append(data[key].STUDYGROUP_NAME);
						$inSGTitleH4.attr('onclick', "SGdetailPage(" + data[key].STUDYGROUP_CODE + ")");
						$inSGIntro = $('<div class="inSGIntro">').append(data[key].STUDYGROUP_INTRO);
						$inSGEnrolldate = $('<div class="inSGEnrolldate">').append('그룹 개설일 : ' + data[key].STUDYGROUP_STDATE);
						$inSGDate = $('<div class="inSGDate">').append('그룹 가입일 : ' + data[key].JOINGROUP_ENROLLDATE);
						$inSGJoinTime = $('<div class="inSGJoinTime">').append('총 활동 시간 : ' + data[key].MEAT_STUDYTIME + '시간');
						$inSGAim = $('<div class="inSGAim">');
						$inSGAimProgress = $('<div class="inSGAimProgress inSGAimProgress' + key + '">').css('width', data[key].STUDYGROUP_GOALPERCENT + '%');
						$inSGAimPercent = $('<div class="inSGAimPercent">').append('그룹 목표 ' + data[key].STUDYGROUP_GOALPERCENT + '%');
						$inSGUserImageArea = $('<div class="inSGUserImageArea">');
						$inSGUserInfo = $('<div class="inSGUserInfo">').append('참여 인원');
						$inSGUserImage = $('<div class="inSGUserImage inSGUserImage' + key + '">');
						
						
						$inSGImgARea.append($inSGImg);
						
						if(key == 0){
							$inSGTitle.append($inSGTrophyImg);
						}
						
						$inSGTitle.append($inSGTitleH4);
						$inSGInfoArea.append($inSGTitle);
						$inSGInfoArea.append($inSGIntro);
						$inSGInfoArea.append($inSGEnrolldate);
						$inSGInfoArea.append($inSGDate);
						$inSGInfoArea.append($inSGJoinTime);
						$inSGAim.append($inSGAimProgress);
						$inSGAim.append($inSGAimPercent);
						$inSGInfoArea.append($inSGAim);
						$inSGUserImageArea.append($inSGUserInfo);
						$inSGUserImageArea.append($inSGUserImage);
						$inSGInfoArea.append($inSGUserImageArea);
						
						$inSGArea.append($inSGImgARea);
						$inSGArea.append($inSGInfoArea);
						
						if(loginuser_Code == data[key].STUDYGROUP_BOSSCODE){
							
							$inMySGArea = $('<div class="inSGArea">');
							$inMySGImgARea = $('<div class="inSGImgArea">');
							$inMySGImg = $('<img>').attr('src', "/studyplus/resources/upload/studygroup/thumbnail/" + data[key].FILES_SUTDYGROUPNAME);
			        		$inMySGImg.attr('onclick', "SGdetailPage(" + data[key].STUDYGROUP_CODE + ")");
							$inMySGInfoArea = $('<div class="inSGInfoArea">');
							$inMySGTitle = $('<div class="inSGTitle">');
							$inMySGTrophyImg = $('<img>').attr('src', "/studyplus/resources/images/studyGroup/trophy.png");
							$inMySGTitleH4 = $('<h4>').append(data[key].STUDYGROUP_NAME);
							$inMySGTitleH4.attr('onclick', "SGdetailPage(" + data[key].STUDYGROUP_CODE + ")");
							$inMySGIntro = $('<div class="inSGIntro">').append(data[key].STUDYGROUP_INTRO);
							$inMySGEnrolldate = $('<div class="inSGEnrolldate">').append('그룹 개설일 : ' + data[key].STUDYGROUP_STDATE);
							$inMySGDate = $('<div class="inSGDate">').append('그룹 가입일 : ' + data[key].JOINGROUP_ENROLLDATE);
							$inMySGJoinTime = $('<div class="inSGJoinTime">').append('총 활동 시간 : ' + data[key].MEAT_STUDYTIME + '시간');
							$inMySGAim = $('<div class="inSGAim">');
							$inMySGAimProgress = $('<div class="inSGAimProgress inSGAimProgress' + key + '">').css('width', data[key].STUDYGROUP_GOALPERCENT + '%');
							$inMySGAimPercent = $('<div class="inSGAimPercent">').append('그룹 목표 ' + data[key].STUDYGROUP_GOALPERCENT + '%');
							$inMySGUserImageArea = $('<div class="inSGUserImageArea">');
							$inMySGUserInfo = $('<div class="inSGUserInfo">').append('참여 인원');
							$inMySGUserImage = $('<div class="inSGUserImage inSGUserImage' + key + '">');
							
							$inMySGImgARea.append($inMySGImg);
							
							if(mySGTrophy_Temp == 1){
								$inMySGTitle.append($inMySGTrophyImg);
								
								mySGTrophy_Temp = data[key].STUDYGROUP_BOSSCODE;
							}
							
							$inMySGTitle.append($inMySGTitleH4);
							$inMySGInfoArea.append($inMySGTitle);
							$inMySGInfoArea.append($inMySGIntro);
							$inMySGInfoArea.append($inMySGEnrolldate);
							$inMySGInfoArea.append($inMySGDate);
							$inMySGInfoArea.append($inMySGJoinTime);
							$inMySGAim.append($inMySGAimProgress);
							$inMySGAim.append($inMySGAimPercent);
							$inMySGInfoArea.append($inMySGAim);
							$inMySGUserImageArea.append($inMySGUserInfo);
							$inMySGUserImageArea.append($inMySGUserImage);
							$inMySGInfoArea.append($inMySGUserImageArea);
							
							$inMySGArea.append($inMySGImgARea);
							$inMySGArea.append($inMySGInfoArea);
							
							$('.inMySGListArea').append($inMySGArea);
						};
						
						$('.inSGListArea').append($inSGArea);
					}
				}
				
				studygroup_Code = -1;
				
				for(var key in data){
					if(studygroup_Code != data[key].STUDYGROUP_CODE){
						studygroup_Code = data[key].STUDYGROUP_CODE;
						
						for(var img in data){
							if(studygroup_Code == data[img].STUDYGROUP_CODE){
								$inSGUserImg = $('<img>').attr('src', '/studyplus/resources/upload/member/thumbnail/' + data[img].FILES_FILES_MEMBERNAME);
								
								$('.inSGUserImage' + key).append($inSGUserImg);
							}
						}	
					}
				}
			}
		});
		
		$.ajax({
			url: 'studyGroupSelectRecommendSGList.sg',
			data : {
				member_Code : member_Code
			},
			beforeSend : function(){
				$('.recommendationSGListArea').empty();
				
				$img = $('<img>');
				$img.attr('src', '/studyplus/resources/images/studyGroup/groupListLoading.gif');
				$img.css({
					'width': '50px',
					'height': '50px',
					'display': 'inline-block',
					'margin-left': '403px',
					'margin-top': '50px'
				});
				
				$('.recommendationSGListArea').html($img);
			},
			success : function(data){
				$('.recommendationSGListArea').empty();
				
				for(var key in data){
					$SGArea = $('<div class="inSGArea">');
					$SGImgARea = $('<div class="inSGImgArea">');
					$SGImg = $('<img>').attr('src', "/studyplus/resources/upload/studygroup/thumbnail/" + data[key].FILES_NAME);
					$SGImg.attr('onclick', "SGdetailPage(" + data[key].STUDYGROUP_CODE + ")");
					$SGInfoArea = $('<div class="inSGInfoArea">');
					$SGTitle = $('<div class="inSGTitle">');
					$SGTrophyImg = $('<img>').attr('src', "/studyplus/resources/images/studyGroup/trophy.png");
					$SGTitleH4 = $('<h4>').append(data[key].STUDYGROUP_NAME);
					$SGTitleH4.attr('onclick', "SGdetailPage(" + data[key].STUDYGROUP_CODE + ")");
					
					$SGIntro = $('<div class="inSGIntro">').append(data[key].STUDYGROUP_INTRO);
					$SGEnrolldate = $('<div class="SGEnrolldate">').append(data[key].STUDYGROUP_STDATE);
					$SGAim = $('<div class="inSGAim">');
					$SGAimProgress = $('<div class="inSGAimProgress">').css('width', data[key].STUDYGROUP_GOALPERCENT + '%');
					$SGAimPercent = $('<div class="inSGAimPercent">').append('그룹 목표 ' + data[key].STUDYGROUP_GOALPERCENT + '%');
					$SGUserImageArea = $('<div class="inSGUserImageArea">');
					$SGUserInfo = $('<div class="inSGUserInfo">').append('JOIN');
					$SGUserImage = $('<div class="SGUserImage">');
					$SGUserImg = $('<img>').attr('src', '/studyplus/resources/images/studyGroup/join_icon.png');
					$SGUserImg.attr('onclick', "SGdetailPage(" + data[key].STUDYGROUP_CODE + ")");
					
					$SGImgARea.append($SGImg);
					
					if(key == 0){
						$SGTitle.append($SGTrophyImg);
					}
					
					$SGTitle.append($SGTitleH4);
					$SGInfoArea.append($SGTitle);
					$SGInfoArea.append($SGIntro);
					$SGInfoArea.append($SGEnrolldate);
					$SGAim.append($SGAimProgress);
					$SGAim.append($SGAimPercent);
					$SGInfoArea.append($SGAim);
					$SGUserImageArea.append($SGUserInfo);
					$SGUserImage.append($SGUserImg);
					$SGUserImageArea.append($SGUserImage);
					$SGInfoArea.append($SGUserImageArea);
					
					$SGArea.append($SGImgARea);
					$SGArea.append($SGInfoArea);
					
					$('.recommendationSGListArea').append($SGArea);	
				}				
			}
		});
	});
	
	$(function(){
		var member_Code = ${sessionScope.loginUser.member_Code};
		
		$.ajax({
			url : 'selectCPPImgAndLink.do',
			data : {
				member_Code : member_Code
			},
			success : function(data){
				if(data != ''){
					$('.SGMainPRImg').attr('src', '/studyplus/resources/upload/admin/thumbnail/' + data.FILES_NAME+'.png');
					$('.SGMainPRImg').attr('onclick', 'addPRCount(' + data.PR_CODE + ', ' + member_Code + ', "' + data.PR_LINK + '")');
				}else{
					$('.SGMainPRImg').attr('src', '/studyplus/resources/images/ad/ad.png');
				}
				
			}
		});
	});
	
	function SGdetailPage(group_No){
		location.href='selectOneGroup.sgd?group_No=' + group_No;
	}
	
	function addPRCount(pr_Code, member_Code, pr_Link){
		$.ajax({
			url : 'insertPRCount.do',
			data : {
				pr_Code : pr_Code,
				member_Code : member_Code
			},
			success : function(){
				window.open('http://'+pr_Link, '_blank'); 
			        
			}	
		})
	}

</script>
</head>
<body>
	<div class="SGMainBodyLeftArea">
		<div class="adArea">
			<img class="SGMainPRImg" onclick="addPRCount()"/>
			<a href="selectOneGroup.sgd?group_No=1">스터디 그룹 디테일</a>
		</div>
		<div class="SGListChangeBtnArea">
			<ul class="SGListChangeUl">
				<li onclick="changeGroupList('inSGListArea')">가입 그룹</li>
				<li onclick="changeGroupList('inMySGListArea')">개설 그룹</li>
				<li onclick="changeGroupList('recommendationSGListArea')">추천 그룹</li>
			</ul>
		</div>
		<div class="inSGListArea"></div>
		<div class="inMySGListArea"></div>
		<div class="recommendationSGListArea">
		</div>
	</div>
	<br>
</body>
</html>