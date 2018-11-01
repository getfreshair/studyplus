<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	.SGMainFiledListArea button {
		width:80px;
		height:80px;
		border:none;
		background-color: rgba( 250, 124, 124, 0.8 );
		padding:12px;
		text-align:center;
		text-decoration:none;
		display:inline-block;
		font-size:15px;
		margin:18px;
		color:white;
		cursor:pointer;
		border-radius:7px;
	}
	.SGMainFiledListArea button:focus {
		outline:none;
	}
	.SGMainInfoArea {
		width:356px;
		display:inline-block;
		box-sizing:border-box;
		font-size:25px;
		color:white;
    	font-weight:bold;
		margin-top:-30px;
		vertical-align:text-top;
	}
</style>
</head>
<script>
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
	});
	
	$(function(){
		$('.searchGroupName').click(function(){
			$('.searchGroupName').val("");
		});
		
		$('.searchGroupName').keypress(function(key) {
			if(key.which == 13){
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
		});
	})
</script>
<body>
	<div class="SGHeaderSeachArea" style="background-image:url(/studyplus/resources/images/studyGroup/group_background.jpg)">
		<div class="SGSeachArea">
			<div class="SGSearch">
				<input type="text" class="searchGroupName" name="searchGroupName" placeholder="Study Group Name"/>
				<img src="/studyplus/resources/images/studyGroup/location_Icon.png"/>
			</div>
		</div>
		<div class="SGMainFiledListArea">
			<div class="SGMainInfoArea">
				<p>스터디 그룹</p>에 가입하고. <br> 공동의  목표를 성취하세요!
			</div>
			<button>전체</button>
			<button>고입</button>
			<button>대입</button>
			<button>고시</button>
			<button>공시</button>
			<button>외국어</button>
			<button>취준</button>
			<button>자격증</button>
			<button>기타</button>
		</div>
	</div>
</body>
</html>