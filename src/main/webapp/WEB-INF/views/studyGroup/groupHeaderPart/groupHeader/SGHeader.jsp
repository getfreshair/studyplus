<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.SGHeaderSeachArea {
		width:100%;
		height:450px;
		background-size:cover;
		text-align:center;
	}
	.SGSeachArea {
		padding-top:7px;
	}
	.SGSearch {
		border:2px solid transparent;
		display: inline-block;
	    margin: 0 auto;
	    background: white;
	    border-radius: 20px;
	    text-align: center;
	    width: 545px;
	    height: 26px;
	    color: #00A2C9;
	}
	.SGSearch img {
		width:18px;
		height:18px;
		margin-bottom: 3px;
	}
	.SGSearch > img:hover {
		cursor:pointer;
	}
	.SGSearch > input[type='text']{
		border-style: none;
	    text-align: center;
	    width: 500px;
	    height: 22px;
	}
	.SGSearch > input[type='text']:focus{
		outline:none;
	}
	.SGMainFiledListArea {
		width:510px;
		height:400px;
		display:inline-block;
		margin:0 auto;
		margin-top:30px;
	}
	.SGMainFiledListArea p {
		display:inline-block;
		font-size:35px;
    	font-weight:bold;
    	margin:0px;
	}
	.SGMainFiledListArea label {
		width:80px;
		height:80px;
		border:none;
		background-color: rgba( 250, 124, 124, 0.8 );
		padding-top:29px;
		text-align:center;
		font-weight: unset;
		display:inline-block;
		font-size:15px;
		margin:18px;
		color:white;
		cursor:pointer;
		border-radius:7px;
	}
	.SGMainFiledListArea input[type='radio'] {
		display:none;
	}  
	.SGMainFiledListArea img {
		position:absolute;
		width: 16px;
	    height: 16px;
	    margin-top: 3px;
	    margin-left: -17px;
	    display:none;
	}
	.SGMainInfoArea {
		width:356px;
		display:inline-block;
		box-sizing:border-box;
		font-size:25px;
		color:white;
    	font-weight:bold;
		margin-top:-40px;
		vertical-align:text-top;
	}
	.locationCheckArea {
		position:absolute;
		left:15px;
		top:24px;
	}
	.locationCheckArea input[type='radio'] {
		display:none;
	}
	.locationCheckLabel {
		width: 54px;
	    font-size: 13px;
	    font-weight: unset;
	    color: white;
	}
	.locationCheckLabel:hover {
		cursor:pointer;
	}
	.locationCheckArea img {
		position:absolute;
		width: 13px;
	    height: 13px;
	    margin-top: 3px;
	    margin-left: -15px;
	    display:none;
	}
</style>
</head>
<script>
	$(function(){
		$("input:radio[class=category_Code]:checked").siblings('img').css('display', 'inline-block');
		$("input:radio[class=location_Code]:checked").siblings('img').css('display', 'inline-block');
	});

	$(function(){
		$('.SGSearch > input[type="text"]').focus(function(){
			$('.SGSearch').css({
				'border': '2px solid #B3CEFB'
			});
		}).blur(function(){
			$('.SGSearch').css({
				'border': '2px solid white'
			});
		});
		
		$('.searchSGName').click(function(){
			$('.searchSGName').val("");
		});
		
		$('.searchSGName').keypress(function(key) {
			if(key.which == 13){
				SGListCall();
			}
		});
	})
	function locationCheck(){
		$('.locationsCheckImg').css('display', 'none');
		$("input:radio[class=location_Code]:checked").siblings('img').css('display', 'inline-block');
		
		SGListCall();
	}
	
	function categoryCheckAndListCall(){
		$('.categoryCheckImg').css('display', 'none');
		$("input:radio[class=category_Code]:checked").siblings('img').css('display', 'inline-block');
		
		SGListCall();
	}
	
	function SGListCall(){
		$.ajax({
			url: 'studyGroupListPage.sg',
			beforeSend : function(){
				$('.SGContentArea').empty();
				
				$img = $('<img>');
				$img.attr('src', '/studyplus/resources/images/studyGroup/groupListLoading.gif');
				$img.css({
					'width': '50px',
					'height': '50px',
					'display': 'inline-block',
					'margin-left': '575px'
				});
				
				$('.SGContentArea').html($img);
			},
			success: function(data){
				$('.SGContentArea').empty();
				$('.SGContentArea').html(data);
			}
		});
	}
</script>
<body>
	<div class="SGHeaderSeachArea" style="background-image:url(/studyplus/resources/images/studyGroup/group_background.jpg)">
		<div class="SGSeachArea">
			<div class="SGSearch container">
				<input type="text" class="searchSGName" name="searchSGName" placeholder="Study Group Name"/>
				<img data-toggle="collapse" data-target="#locationCheckArea" class="dropdown-toggle locationCheckImg" src="/studyplus/resources/images/studyGroup/location_Icon.png"/>
				<div id="locationCheckArea" class="collapse locationCheckArea">
					<label class="locationCheckLabel">
						<input type="radio" class="location_Code" name="location_Code" value="1" onclick="locationCheck()" checked>
						<img class="locationsCheckImg" src="/studyplus/resources/images/studyGroup/checking_Icon.png"/>
						전국
					</label>
					<label class="locationCheckLabel">
						<input type="radio" class="location_Code" name="location_Code" value="2" onclick="locationCheck()">
						<img class="locationsCheckImg" src="/studyplus/resources/images/studyGroup/checking_Icon.png"/>
						서울
						</label>
					<label class="locationCheckLabel">
						<input type="radio" class="location_Code" name="location_Code" value="3" onclick="locationCheck()">
						<img class="locationsCheckImg" src="/studyplus/resources/images/studyGroup/checking_Icon.png"/>
						경기
						</label>
					<label class="locationCheckLabel">
						<input type="radio" class="location_Code" name="location_Code" value="4" onclick="locationCheck()">
						<img class="locationsCheckImg" src="/studyplus/resources/images/studyGroup/checking_Icon.png"/>
						충청
						</label>
					<label class="locationCheckLabel">
						<input type="radio" class="location_Code" name="location_Code" value="5" onclick="locationCheck()">
						<img class="locationsCheckImg" src="/studyplus/resources/images/studyGroup/checking_Icon.png"/>
						전라
						</label>
					<label class="locationCheckLabel">
						<input type="radio" class="location_Code" name="location_Code" value="6" onclick="locationCheck()">
						<img class="locationsCheckImg" src="/studyplus/resources/images/studyGroup/checking_Icon.png"/>
						강원
						</label>
					<label class="locationCheckLabel">
						<input type="radio" class="location_Code" name="location_Code" value="7" onclick="locationCheck()">
						<img class="locationsCheckImg" src="/studyplus/resources/images/studyGroup/checking_Icon.png"/>
						경상
						</label>
					<label class="locationCheckLabel">
						<input type="radio" class="location_Code" name="location_Code" value="8" onclick="locationCheck()">
						<img class="locationsCheckImg" src="/studyplus/resources/images/studyGroup/checking_Icon.png"/>
						제주
						</label>
					<label class="locationCheckLabel">
						<input type="radio" class="location_Code" name="location_Code" value="9" onclick="locationCheck()">
						<img class="locationsCheckImg" src="/studyplus/resources/images/studyGroup/checking_Icon.png"/>
						기타
						</label>
			    </div>
			</div>
		</div>
		<div class="SGMainFiledListArea">
			<div class="SGMainInfoArea">
				<p>스터디 그룹</p>에 가입하고. <br> 공동의  목표를 성취하세요!
			</div>
			<label>
				<input type="radio" class="category_Code" name="category_Code" value="0" checked onclick="categoryCheckAndListCall()"/>
				<img class="categoryCheckImg" src="/studyplus/resources/images/studyGroup/checking_Icon.png"/>
				전체
			</label>
			<label>
				<input type="radio" class="category_Code" name="category_Code" value="1" onclick="categoryCheckAndListCall()"/>
				<img class="categoryCheckImg" src="/studyplus/resources/images/studyGroup/checking_Icon.png"/>
				고입
			</label>
			<label>
				<input type="radio" class="category_Code" name="category_Code" value="2" onclick="categoryCheckAndListCall()"/>
				<img class="categoryCheckImg" src="/studyplus/resources/images/studyGroup/checking_Icon.png"/>
				대입
			</label>
			<label>
				<input type="radio" class="category_Code" name="category_Code" value="3" onclick="categoryCheckAndListCall()"/>
				<img class="categoryCheckImg" src="/studyplus/resources/images/studyGroup/checking_Icon.png"/>
				 고시
				</label>
			<label>
				<input type="radio" class="category_Code" name="category_Code" value="4" onclick="categoryCheckAndListCall()"/>
				<img class="categoryCheckImg" src="/studyplus/resources/images/studyGroup/checking_Icon.png"/>
				 공시
			</label>
			<label>
				<input type="radio" class="category_Code" name="category_Code" value="5" onclick="categoryCheckAndListCall()"/>
				<img class="categoryCheckImg" src="/studyplus/resources/images/studyGroup/checking_Icon.png"/>
				 외국어
			</label>
			<label>
				<input type="radio" class="category_Code" name="category_Code" value="6" onclick="categoryCheckAndListCall()"/>
				<img class="categoryCheckImg" src="/studyplus/resources/images/studyGroup/checking_Icon.png"/>
				 취준
			</label>
			<label>
				<input type="radio" class="category_Code" name="category_Code" value="7" onclick="categoryCheckAndListCall()"/>
				<img class="categoryCheckImg" src="/studyplus/resources/images/studyGroup/checking_Icon.png"/>
				 자격증
			</label>
			<label>
				<input type="radio" class="category_Code" name="category_Code" value="8" onclick="categoryCheckAndListCall()"/>
				<img class="categoryCheckImg" src="/studyplus/resources/images/studyGroup/checking_Icon.png"/>
				 기타
			</label>
		</div>
	</div>
</body>
</html>