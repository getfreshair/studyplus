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
	.SGSeachArea > input[type='text']{
		border-radius:10px;
		border-style:double;
		border-color:white;
		text-align:center;
		width:500px;
		height:22px;
		padding:0px;
		padding-left:10px;
		color:#00A2C9;
	}
	.SGSeachArea > input[type='text']:focus{
		border-color:#FCCE00;
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
		
	})
	$(function(){
		$(".searchGroupName").keypress(function(key) {
			if(key.which == 13){
				var searchGroupName = $('.searchGroupName').val();
				$.ajax({
					url: 'searchGroupListPage.sg',
					data: {
						searchGroupName : searchGroupName
					},
					beforeSend : function(){
						var path = '${ contextPath }';
						$('.SGContentArea').empty();
						
						$img = $('<img>');
						$img.attr('src', path + '/resources/images/studyGroup/groupListLoading.gif');
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
	<div class="SGHeaderSeachArea" style="background-image:url(${contextPath}/resources/images/studyGroup/group_background.jpg)">
		<div class="SGSeachArea">
			<input type="text" class="searchGroupName" name="searchGroupName" placeholder="Study Group Name"/>
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