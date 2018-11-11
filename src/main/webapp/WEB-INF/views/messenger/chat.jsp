<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>
<script type="text/javascript"
	src="/studyplus/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	var wsocket;

	connect();
	function connect() {
		// ws://192.168.10.69:8001/studyplus/chat-ws.socket
		//192.168.43.188:8001/studyplus ws://localhost:8001/studyplus/chat-ws.socket
		wsocket = new WebSocket("ws://localhost:8001/studyplus/chat-ws.socket");
		wsocket.onopen = onOpen;
		//서버로부터 메시지를 받으면 호출되는 함수 지정
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;

		$('#message').attr('disabled', false);
	}

	function disconnect() {
		
	}

	function onOpen(evt) {
		
		var msg = 'msg:' + '${loginUser.member_Nickname}' + ":입장"; // 입장 시 친구에게 알리기 위해 메시지 송출
		wsocket.send(msg);
	}

	function onMessage(evt) {
		var data = evt.data;
		if (data.substring(0, 4) == 'msg:') {
			appendMessage(data.substring(4));
		}
	}

	function onClose(evt) {
		
		$('#nickname').val("");
		$('#message').attr('disabled', true);
	}

	function send() {
		var nickname = $('#nickname').val();
		var msg = $('#message').val();
		wsocket.send("msg:" + nickname + ':' + msg + ':' + receiverNickName);
		$('#message').val('');
	}

	function appendMessage(msg) {
		var d = new Date();

		if (msg.substr(msg.indexOf(":")+1, msg.length) == '입장') { // 친구 입장 시 접속 친구 증가

			loginFriends = loginFriends + 1; 
			$('.loginFriends').text(loginFriends);
			$('#status' + msg.substr(0, msg.indexOf(":"))).addClass('on');
		} else if(msg.substr(msg.indexOf(":")+1, msg.length) == '퇴장'){ // 친구 퇴장 시 접속 친구 감소
			
			loginFriends = loginFriends - 1; 
			$('.loginFriends').text(loginFriends);
			$('#status' + msg.substr(0, msg.indexOf(":"))).removeClass('on');
		} else if(msg.substr(msg.indexOf(":")+1, msg.length) == '초기'){ //  로그인 시 접속 친구 파악 프로세스
			
			loginFriends = msg.substr(0, msg.indexOf("/"));
			$('.loginFriends').text(loginFriends);
			var allFriends = msg.substr(msg.indexOf("/")+1, msg.indexOf(":")-2);
			$('.allFriends').text(allFriends);
		} else { // 기타 메시지
	
			if (receiverNickName == msg.substr(msg.lastIndexOf(":") + 1,
					msg.length)) { // 내가 보냈을 때 채팅창에 출력

				$('#chatMessageArea').append(
								'<div style="width:98%; display: inline-block;">' + 
								'<table style="margin-top : 10px; float:right;">'
										+ '<tr><td>'
										+ '<div class="dateArea">'
										+ d.getHours() + '시' + d.getMinutes()
										+ '분</div>' 
										+ '<div class="msgArea" style="background : #fde09a;">'
										+ msg.substr(msg.indexOf(":") + 1, msg
												.lastIndexOf(":")
												- (msg.indexOf(":") + 1))
										+ '</div>' 
										+  '</td></tr></div>');
			} else if (receiverNickName == msg.substr(0, msg.indexOf(":"))) { // 내가 받았을 때
				
				if (receiverNickName == msg.substr(0, msg.indexOf(":"))) { // 채팅창 상대(receiverNickName) == 보낸이 // 채팅방에 들어와있을때  
					// 메시지 상태 읽음 DB 인설트
					var receiver_member_code = ${sessionScope.loginUser.member_Code};
					
					$.ajax({
						url : "${contextPath}/insertMessage.ms",
						type : "POST",
						data : {
							msg_content : msg.substr(msg.indexOf(":") + 1, msg.lastIndexOf(":") - (msg.indexOf(":") + 1)),
							sender_member_nickname : msg.substr(0, msg.indexOf(":")),
							receiver_member_code : receiver_member_code,
							status : 1,
							type : 0
						},
						success : function(data){

						}
					});
				
					$('#chatMessageArea').append(
									'<table style="margin-top : 10px;">'
											+ '<tr><td rowspan="2" style="vertical-align: text-top; display: table-cell;">'
											+ '<div class="msgImgArea">'
											+ '<img class="chatProfile" src="/studyplus/resources/images/studyGroup/img_plus.png" style="width : 30px; border-radius : 50%; width:100%;">'
											+ '</div></td>'
											+ '<td><div class="nicknameArea">'
											+ msg.substr(0, msg.indexOf(":"))
											+ '</div>'
											+ '</td></tr>'
											+ '<tr><td>'
											+ '<div class="msgArea">'
											+ msg
													.substr(
															msg.indexOf(":") + 1,
															msg
																	.lastIndexOf(":")
																	- (msg
																			.indexOf(":") + 1))
											+ '</div>'
											+ '<div class="dateArea">'
											+ d.getHours() + '시'
											+ d.getMinutes() + '분</div>'
											+ '</td></tr>');
					
					$.ajax({
						url : "selcectMemberProfile.ms",
						type : "POST",
						data : {
							
							member_Nickname : msg.substr(0, msg.indexOf(":"))
						},
						async: false,
						success : function(data){
							
							$('.chatProfile').attr("src", "/studyplus/resources/upload/member/thumbnail/" + data);
						}
					});
				}
			}else {
				
				// 메시지 상태 안읽음 DB 인설트
				unreadMsg = unreadMsg + 1;
				$('.undreadMsg').text(unreadMsg);

				$('.friendList'+msg.substr(0, msg.indexOf(":"))).html(parseInt($('.friendList'+msg.substr(0, msg.indexOf(":"))).html(), 10)+1);
				
				var receiver_member_code = ${sessionScope.loginUser.member_Code};
				$.ajax({
					url : "${contextPath}/insertMessage.ms",
					type : "POST",
					data : {
						msg_content : msg.substr(msg.indexOf(":") + 1, msg.lastIndexOf(":") - (msg.indexOf(":") + 1)),
						sender_member_nickname : msg.substr(0, msg.indexOf(":")),
						receiver_member_code : receiver_member_code,
						status : 0,
						type : 0
					},
					success : function(data){

					}
				});
			}

			var chatAreaHeight = $('#chatArea').height();
			var maxScroll = $('#chatMessageArea').height() - chatAreaHeight;
			$('#chatArea').scrollTop(maxScroll);
		}
	}

	$(document).ready(function() {

		$("#nickname").val('${loginUser.member_Nickname}');

		$('#message').keypress(function(event) {
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if (keycode == '13') {
				send();
			}
			event.stopPropagation();
		});

		$('#sendBtn').click(function() {
			send();
		});

		$('#exitBtn').click(function() {
			receiverNickName = "";
		});
	});
</script>
<style type="text/css">
#chatArea {
	width: 100%;
	height: 86%;
	overflow-y: auto;
	padding-bottom: 5%;
}

#sendArea {
	width: 100%;
	height: 15%;
}

#message {
	width: 73%;
	vertical-align: middle;
}

#sendBtn {
	width: 20%;
	text-align: center;
	background: #f1bc3c;
	color: white;
	display: inline-block;
	height: 24px;
	vertical-align: middle;
}

.msgImgArea {
	margin-left: 5%;
	border-radius: 50%;
	width: 35px;
	height: 35px;
	overflow : hidden;
	background: #fff;
    border: 1px solid #ddd;
}

.nicknameArea {
	margin-left: 5px;
}

.msgArea {
	background: WhiteSmoke;
	margin-left: 5px;
	display: inline-block;
	word-break: break-all;
	border-radius: 10px;
	padding : 3px;
}

.dateArea {
	margin-left: 3px;
	font-size: 3px;
	display: inline-block;
}

#exitBtn {
	margin-left: 1%;
}
</style>
</head>

<body>
	<input type="text" id="nickname" style="display: none;">
	<div id="chatArea">
		<div id="chatMessageArea"></div>
	</div>
	<br>
	<div id="sendArea">
		<input type="button" id="exitBtn" value="<" class="chat_close">
		<input type="text" id="message">
		<div id="sendBtn">전송</div>
	</div>
</body>
</html>