<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>
<script type="text/javascript"
	src="/studyplus/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	var wsocket;
	
	function connect() {
		// ws://192.168.10.69:8001/studyplus/chat-ws.socket
		wsocket = new WebSocket("ws://localhost:8001/studyplus/chat-ws.socket");
		wsocket.onopen = onOpen;
		//서버로부터 메시지를 받으면 호출되는 함수 지정
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
		
		$('#message').attr('disabled',false);
	}
	
	function disconnect() {
		var msg = 'msg:[' + $('#nickname').val() + '퇴장!]';
		wsocket.send(msg);
	}
	
	function onOpen(evt) {
		var msg = 'msg:[' + $('#nickname').val() + '입장!]';
		//wsocket.send(msg);
	}
	
	function onMessage(evt) {
		var data = evt.data;
		if(data.substring(0,4) == 'msg:') {
			appendMessage(data.substring(4));
				/* 닉네임 추출 == 자기 닉네임과 같은지 체크 */
			if(data.substring(5,data.lastIndexOf('퇴장!')) 
					== $('#nickname').val() && data.lastIndexOf('퇴장!') != -1) {
				wsocket.close();
			}
		}
	}
	
	function onClose(evt) {
		//퇴장 한 이후 부과적인 작업이 있을 경우 명시
		$('#nickname').val("");
		$('#message').attr('disabled',true);
	}
	
	function send() {
		var nickname = $('#nickname').val();
		var msg = $('#message').val();
		wsocket.send("msg:" + nickname + ':' + msg);
		$('#message').val('');
	}
	
	function appendMessage(msg) {
		var d = new Date();
		
		$('#chatMessageArea').append(
				'<table style="margin-top : 10px;">'
				+ '<tr><td rowspan="2" style="vertical-align: text-top; display: table-cell;">' + '<div class="msgImgArea">'
			 	+ '<img src="/studyplus/resources/images/studyGroup/img_plus.png" style="width:100%;">'
			    + '</div></td>' 
				+ '<td><div class="nicknameArea">' + msg.substr(0, msg.lastIndexOf(":")) + '</div>'
				+ '</td></tr>'
				+ '<tr><td>' + '<div class="msgArea">' + msg.substr(msg.lastIndexOf(":")+1, msg.length-1) + '</div>'
				+ '<div class="dateArea">' +  d.getHours() + '시' + d.getMinutes() + '분</div>'
				+ '</td></tr>'); 
		
		var chatAreaHeight = $('#chatArea').height();
		var maxScroll = $('#chatMessageArea').height() - chatAreaHeight;
		$('#chatArea').scrollTop(maxScroll);
	}
	
	$(document).ready(function() {
		
		
		$("#nickname").val('${loginUser.member_Nickname}');
		connect();
		
		$('#message').keypress(function(event) {
			var keycode = (event.keyCode ? event.keyCode : event.which);
			if(keycode == '13') {
				send();
			}
			event.stopPropagation();
		});
		
		$('#sendBtn').click(function(){
			send();
		});
		
// 		$('#enterBtn').click(function(){
// 			if($('#nickname').val() == ''){
// 				alert('이름을 입력하세요!');
// 				$('#nickname').focus();
// 				return;
// 			}
// 			connect();
// 		});
		
		$('#exitBtn').click(function(){
			if($('#nickname').val() == ''){
				alert('이름을 입력하세요!');
				$('#nickname').focus();
				return;
			}
			disconnect();
		});
	});
	
</script>
<style type="text/css">
	#chatArea {
		width:100%;
		height:86%;
		overflow-y:auto;
	}
	
	#sendArea{
		
		width:100%;
		height:15%;
		
	}
		
	#message{

   		width: 73%;
   		vertical-align: middle;
	}
	
	#sendBtn{
		
		width: 20%;
	    text-align: center;
	    background: #f1bc3c;
	    color: white;
	    display: inline-block;
	    height: 24px;
	    vertical-align: middle;
	}
	
	.msgImgArea{
		margin-left : 5%;
		border-radius: 50%;
		width: 35px;
    	height: 35px;
	}
	
	.nicknameArea{
	
		margin-left : 5px;
	}
	
	.msgArea{
	
		background : WhiteSmoke;
		margin-left : 5px;
		display : inline-block;
		word-break: break-all;	
		border-radius : 15%;
	}
	
	.dateArea{
		
		margin-left : 3px;
		font-size : 3px;
		display : inline-block;
	}
	
	#exitBtn{
	
		margin-left : 1%;
	}
</style>
</head>

<body>
	<input type="text" id="nickname" style="display:none;">
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