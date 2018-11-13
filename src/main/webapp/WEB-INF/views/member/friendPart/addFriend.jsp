<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.addFriendArea {
		width:300px;
	}
	.addFriend-content {
		border-radius:0px;
		overflow:hidden;
		height:320px;
	}
	.addFriend-label {
		font-size:12px;
	}
	.addFriend-menu {
		height: 40px;
	    vertical-align: middle;
	    display: table-cell;
	    background: #795548;
	}
	.addFriend-menu > h2 {
		display: inline-block;
	    font-size: 14px;
	    width: 147px;
	    margin: 0px;
	    vertical-align: middle;
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
		border-bottom: 1px solid lightgray;
	}
	.addFriend-search-btn {
		width:90%;
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
	})
	
	function addFriendToMe(){
		$.ajax({
			url : 'addFriendToMe.me',
			data : {
				member_Code : member_Code
			},
			success : function(data){
				$('.addFriend-content').empty();
				$('.addFriend-content').html(data);
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
			}
		});
	}
	
	function addFriendSearch(){
		var member_Nickname = $('.addFriend-search-btn').val();
		
		$.ajax({
			url : 'addFriendSearch.me',
			data : {
				member_Nickname : member_Nickname,
				member_Code : member_Code
			},
			success : function(data){
				$('.addFriend-content').empty();
				$('.addFriend-content').html(data);
			}
		});
	}
</script>

<div class="modal fade" id="addFriendModal">
	<div class="modal-dialog addFriendArea">
		<div class="modal-content">
			<div class="addFriend-menu">
			    <h2 onclick="addFriendToMe()">to me</h2>
			    <h2 onclick="addFriendFromMe()">from me</h2>
			</div>
			<div class="addFriend-search">
				<input type="text" name="member_Nickname" class="form-control addFriend-search-btn" id="InputId" placeholder="닉네임">
			</div>
			<div class="addFriend-content"></div>
		</div>
	</div>
</div>