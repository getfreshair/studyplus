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
	var groupWSocket;
	var userCount = 0;
	
	connect();
	function connect() {
		// ws://192.168.10.69:8001/studyplus/chat-ws.socket
		//192.168.43.188:8001/studyplus ws://localhost:8001/studyplus/chat-ws.socket
		groupWSocket = new WebSocket("ws://192.168.10.69:8001/studyplus/groupChat-ws.groupSocket");
		groupWSocket.onopen = onOpen;
		//서버로부터 메시지를 받으면 호출되는 함수 지정
		groupWSocket.onmessage = onMessage;
		groupWSocket.onclose = onClose;

		$('#message').attr('disabled', false);
	}

	function disconnect() {
		
	}

	function onOpen(evt) {
		
	}

	function onMessage(evt) {
		var data = evt.data;
		if (data.substring(0, 9) == 'groupMsg:') {
			appendMessage(data.substring(9));
		}
	}

	function onClose(evt) {
		
		$('#nickname').val("");
		$('#message').attr('disabled', true);
	}

	function send() {
		var nickname = $('#nickname').val();
		var msg = $('#message').val();
		var groupCode = $('#grCode').val();
		
		groupWSocket.send("groupMsg:" + nickname + ':' + msg + ':' + groupCode);
		$('#message').val('');
	}

	function appendMessage(msg) {
		
		var groupCode = $('#grCode').val();
		
		if(msg.substr(msg.lastIndexOf(":")+1, msg.length) == groupCode){
			
			var d = new Date();
			var userNickname = '${sessionScope.loginUser.member_Nickname}';
		
			if (userNickname  == msg.substr(0,
					msg.indexOf(":"))) { // 내가 보냈을 때 채팅창에 출력

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
			} else { // 내가받았을 때

				$('#chatMessageArea').append(
						'<table style="margin-top : 10px;">'
								+ '<tr><td rowspan="2" style="vertical-align: text-top; display: table-cell;">'
								+ '<div class="msgImgArea">'
								+ '<img class="chatProfile ' + 'user' + userCount + '" src="/studyplus/resources/images/studyGroup/img_plus.png" style="width : 30px; border-radius : 50%; width:100%;">'
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
						
						$('.user' + userCount).attr("src", "/studyplus/resources/upload/member/thumbnail/" + data);
						userCount = userCount + 1;
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
	height: 93%;
	overflow-y: auto;
	padding-bottom: 5%;
}

#sendArea {
	width: 100%;
	height: 15%;
}

#message {
	width: 76%;
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
	text-align : left;
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
		<input type="text" id="message">
		<div id="sendBtn">전송</div>
	</div>
</body>
</html>