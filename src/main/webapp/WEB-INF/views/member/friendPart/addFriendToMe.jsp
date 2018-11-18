<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.addFriendSearchArea {
		width: 318px;
   		height: 437px;
   		overflow: scroll;
   		padding-top: 10px;
	}
	.addFriend {
		width:302px;
		padding-left: 5px;
		padding-top:3px;
		margin-top:2px;
		margin-bottom:3px;
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
		width:154px;
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
	.addFriend-cancelbtn {
		background:#F6F6F6;
		color:#B0B0B0;
	}
</style>
	
<script>
	function addFriendOk(friend_Code){
		$.ajax({
			url : 'addFriendOk.me',
			data : {
				friend_Code : friend_Code
			},
			success : function(data){
				$('.addFriend-btn' + friend_Code).parent('.addFriend'+friend_Code).remove();
			}
		});
	}
	
	function addFriendDelete(friend_Code){
		$.ajax({
			url : 'addFriendDelete.me',
			data : {
				friend_Code : friend_Code
			},
			success : function(data){
				$('.addFriend-btn' + friend_Code).parent('.addFriend'+friend_Code).remove();
			}
		});
	}
</script>

<div class="addFriendSearchArea">
	<c:forEach var="list" items="${userList}">
		<div class="addFriend addFriend${list.FRIEND_CODE}">
			<img class="addFriend-userImg" src="/studyplus/resources/upload/member/thumbnail/${ list.FILES_NAME }"/>
			<p class="addFriend-userNickname">${list.MEMBER_NICKNAME}</p>
			<c:if test="${list.FRIEND_STATUS == 0}">
				<button type="button" class="addFriend-btn btn-primary btn-sm addFriend-btn${list.FRIEND_CODE}" onclick="addFriendOk(${list.FRIEND_CODE})">수락</button>
				<button type="button" class="addFriend-cancelbtn addFriend-btn btn-primary btn-sm addFriend-btn${list.FRIEND_CODE}" onclick="addFriendDelete(${list.FRIEND_CODE})">거부</button>
			</c:if>
		</div>
	</c:forEach>
</div>