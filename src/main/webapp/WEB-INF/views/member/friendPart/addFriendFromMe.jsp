<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.addFriendSearchArea {
		width: 315px;
   		height: 337px;
   		overflow: scroll;
	}
	.addFriend {
		width:298px;
		padding-left: 5px;
		padding-top:3px; 
	}
	.addFriend-userImg {
		width:50px;
		height:50px;
		border-radius:50%;
	}
	.addFriend-userNickname {
		display:inline-block;
		margin:0px;
		font-size: 12px;
		width:130px;
	}
	.addFriend-btn {
		float:right;
		margin-top: 10px;
		margin-right: 5px;
		border-style:none;
	}
	.addFriend-cancelbtn {
		background:#F6F6F6;
		color:#787878;
	}
</style>

<script>
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
				<button type="button" class="addFriend-cancelbtn addFriend-btn btn btn-sm addFriend-btn${list.FRIEND_CODE}" onclick="addFriendDelete(${list.FRIEND_CODE})">취소</button>
			</c:if>
		</div>
	</c:forEach>
</div>