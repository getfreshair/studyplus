<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.modal-content-addFriend {
		border:0px;
		border-radius:0px;
	}
	.addFriendArea {
		width:302px;
	}
	.addFriend-content {
		border-radius:0px;
		overflow:hidden;
		height:420px;
	}
	.addFriend-label {
		font-size:12px;
	}
	.addFriend-menu {
		height: 40px;
	    vertical-align: middle;
	    display: inherit;
	    background: #795548;
	}
	.addFriend-menu h2 {
		background:#F8AC58;
		display: table-cell;
		vertical-align: inherit;
	    font-size: 14px;
	    height: 40px;
	    width: 101px;
	    text-align:center;
	    color: white;
	}
	.addFriend-menu > h2:hover {
		cursor:pointer;
	}
	.addFriend-search {
		height:45px;
		text-align:center;
		padding-top:5px;
		margin-bottom: 5px;
	}
	.addFriend-search-btn {
		width:97%;
		display:inline-block;
	}
</style>

<script>
	var member_Code = ${sessionScope.loginUser.member_Code};

	$(function(){
		$('.addFriend-search-btn').keypress(function(key) {
			if(key.which == 13){
				addFriendSearch();
			}
		});
		
		addFriendSearchPage();
	})
	
	function addFriendSearchPage(){
		$.ajax({
			url : 'addFriendSearchPage.me',
			success : function(data){
				$('.addFriend-content').empty();
				$('.addFriend-content').html(data);
				
				$('.addFriend-menu h2').css({
					'background': '#F8AC58',
					'color': 'white',
					'font-weight': 'unset'
				});
				
				$('.addFriendSearchPage').css({
					'background': 'white',
					'color': 'black',
					'font-weight': 'bold'
				});
			}
		});
	}
	
	function addFriendToMe(){
		$.ajax({
			url : 'addFriendToMe.me',
			data : {
				member_Code : member_Code
			},
			success : function(data){
				$('.addFriend-content').empty();
				$('.addFriend-content').html(data);
				
				$('.addFriend-menu h2').css({
					'background': '#F8AC58',
					'color': 'white',
					'font-weight': 'unset'
				});
				
				$('.addFriendToMe').css({
					'background': 'white',
					'color': 'black',
					'font-weight': 'bold'
				});
			}
		});
	}
	
	function addFriendFromMe(){
		$.ajax({
			url : 'addFriendFromMe.me',
			data : {
				member_Code : member_Code
			},
			success : function(data){
				$('.addFriend-content').empty();
				$('.addFriend-content').html(data);
				
				$('.addFriend-menu h2').css({
					'background': '#F8AC58',
					'color': 'white',
					'font-weight': 'unset'
				});
				
				$('.addFriendFromMe').css({
					'background': 'white',
					'color': 'black',
					'font-weight': 'bold'
				});
			}
		});
	}
</script>

<div class="modal fade" id="addFriendModal">
	<div class="modal-dialog addFriendArea">
		<div class="modal-content modal-content-addFriend">
			<div class="addFriend-menu">
				<h2 class="addFriendSearchPage" onclick="addFriendSearchPage()">검색</h2>
			    <h2 class="addFriendToMe" onclick="addFriendToMe()">받은 요청</h2>
			    <h2 class="addFriendFromMe" onclick="addFriendFromMe()">보낸 요청</h2>
			</div>
			<div class="addFriend-content"></div>
		</div>
	</div>
</div>