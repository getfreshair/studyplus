<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.addFriendSearchArea {
		width: 318px;
   		height: 437px;
   		overflow: scroll;
	}
	.addFriend {
		width:302px;
		padding-left: 10px;
		padding-top:3px;
		margin-bottom:5px; 
	}
	.addFriend-userImg {
		width:40px;
		height:40px;
		border-radius:50%;
	}
	.addFriend-userNickname {
		display:inline-block;
		margin:0px;
		font-size: 12px;
		width:170px;
		font-weight:bold;
	}
	.addFriend-btn {
		background:#F8AC58;
		border-radius: 20px;
		border-style:none;
		float:right;
		margin-top: 6px;
		margin-right: 5px;
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
	
	function addFriendWant(member_Code2){
		var member_Code1 = ${sessionScope.loginUser.member_Code};
	
		$.ajax({
			url:'addFriendWant.me',
			data:{
				member_Code1 : member_Code1,
				member_Code2 : member_Code2
			},
			success : function(data){
				$('.addFriend-btn' + member_Code2).parent('.addFriend'+member_Code2).remove();
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
<div class="addFriendSearchArea">
	<div class="addFriend-search">
		<input type="text" name="member_Nickname" class="form-control addFriend-search-btn" id="InputId" placeholder="닉네임">
	</div>
	<c:if test="${userList != null}">
		<c:forEach var="list" items="${userList}">
			<div class="addFriend addFriend${list.MEMBER_CODE}">
				<img class="addFriend-userImg" src="/studyplus/resources/upload/member/thumbnail/${ list.FILES_NAME }"/>
				<p class="addFriend-userNickname">${list.MEMBER_NICKNAME}</p>
				<button type="button" class="addFriend-btn btn-primary btn-sm addFriend-btn${list.MEMBER_CODE}" onclick="addFriendWant(${list.MEMBER_CODE})">친구 신청</button>
			</div>
		</c:forEach>
	</c:if>
</div>