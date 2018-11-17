<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width">
<script src="/studyplus/resources/js/jquery-1.11.1.min.js"></script>
<style>
	html, body{
		margin:0px;
	}
	.chatBotArea {
		overflow: scroll;
	    display: inline-block;
	    width: 467px;
	    height: 382px;
	}
	.chatBotMicArea {
		width:100%;
		text-align:center;
		position:absolute;
		bottom:0px;
	}
	.chatBotScrollAreaScroll {
		width: 100%;
	    height: 365px;
	    overflow: hidden;
	    padding-top: 5px;
	}
	.chatBotMicImg {
		display:block;
		margin:0 auto;
		margin-bottom: 5px;
	}
	.chatBotMicImg:hover {
		cursor:pointer;
	}
	.voiceMakingGif {
		width:25px;
	}
	.clientContent {
		display:inline-block;
		width:100%;
		text-align:right;
		margin-bottom:5px;
	}
	.serverContent {
		display:inline-block;
		margin-bottom:5px;
		width:100%;
	}
	.output, .phrase {
		display: inline-block;
		font-size:12px;
		border-radius:15px;
		padding:8px;
		padding-right:15px;
		padding-left:15px;
		max-width:385px;
		vertical-align: top;
		background:#EFEFF5;
	}
	.clientImg, .serverImg {
		vertical-align: text-top;
		display: inline-block;
		
	}
	.serverImg {
		width: 25px;
    	margin-left: 10px;
	}
	.clientImg {
		width: 30px;
	    height: 30px;
	    border-radius: 50%;
	}
	.chatBotTop {
		padding-top: 8px;
    	padding-bottom: 12px;
		background:#F8AC58;
		color:white;
		text-align: center;
	    height: 25px;
	    font-size: 13px;
	    font-weight: bold;
	}
	.closeChatImg {
	    float: left;
	    margin: 0px;
	    margin-left: 5px;
	    margin-top: 5px;
	}
	.pencilChatImg {
		margin-right:5px;
	}
	.chatBotTop:hover {
		cursor:pointer;
	}
	.serverInfoImg {
		vertical-align:top;
		max-width: 385px;
	}
</style>
<script>
	function chatBotClose(){
		window.close();
	}
</script>
</head>
<body>
	<div class="chatBotTop">
		<img onclick="chatBotClose()" class="closeChatImg" src="/studyplus/resources/images/common/closeChatImg.PNG">
		<img class="pencilChatImg" src="/studyplus/resources/images/common/pencilChatImg.PNG">STUDY PLUS X DONG BOT
	</div>
	<div class="chatBotScrollAreaScroll">
		<div class="chatBotArea">
			<div class="serverContent">
				<img class="serverImg" src="/studyplus/resources/images/common/operator.png"/>
				<div class="phrase">무엇이든 물어보세요^^</div>
			</div>
		</div>
	</div>
	<div class="chatBotMicArea">
		<img class="voiceMakingGif"/>
		<img class="chatBotMicImg" src="/studyplus/resources/images/common/microphone.png">
	</div>
	<script src="/studyplus/resources/js/webSpeech.js"></script>
</body>
</html>