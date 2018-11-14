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
		width:185px;
	}
	.addFriend-btn {
		border-style:none;
		float:right;
		margin-top: 10px;
		margin-right: 5px;
	}
</style>

<script>
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
</script>
<div class="addFriendSearchArea">
	<c:forEach var="list" items="${userList}">
		<div class="addFriend addFriend${list.MEMBER_CODE}">
			<img class="addFriend-userImg" src="/studyplus/resources/upload/member/thumbnail/${ list.FILES_NAME }"/>
			<p class="addFriend-userNickname">${list.MEMBER_NICKNAME}</p>
			<button type="button" class="addFriend-btn btn-primary btn-sm addFriend-btn${list.MEMBER_CODE}" onclick="addFriendWant(${list.MEMBER_CODE})">신청</button>
		</div>
	</c:forEach>
</div>