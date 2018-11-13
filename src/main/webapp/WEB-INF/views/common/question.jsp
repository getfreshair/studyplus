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
	    width: 417px;
	    height: 330px;
	}
	.chatBotMicArea {
		width:100%;
		text-align:center;
		position:absolute;
		bottom:0px;
	}
	.chatBotScrollAreaScroll {
		width: 100%;
	    height: 313px;
	    overflow: hidden;
	}
	.chatBotMicImg:hover {
		cursor:pointer;
	}
	.clientContent {
		display:inline-block;
		width:100%;
		text-align:right;
	}
	.serverContent {
		display:inline-block;
		width:100%;
	}
	.output, .phrase {
		display: inline-block;
		font-size:12px;
		border-radius:10px;
		padding:5px;
	}
	.phrase {
		background:#EFEFF5;
	}
	.output {
		background:#0C84FE;
	}
	.clientImg, .serverImg {
		vertical-align: text-top;
		display: inline-block;
	}
	.clientImg {
		width: 30px;
	    height: 30px;
	    border-radius: 50%;
	}
	.chatBotTop {
		padding-top: 4px;
    	padding-bottom: 8px;
    	margin-bottom: 10px;
		background:#F8F8F8;
		font-size:20px;
		color:#0C84FE;
		font-weight:bold;
	}
	.chatBotTop:hover {
		cursor:pointer;
	}
</style>
<script>
	function chatBotClose(){
		window.close();
	}
</script>
</head>
<body>
	<div class="chatBotTop" onclick="chatBotClose()">
		< ChatBot
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
		<img class="chatBotMicImg" src="/studyplus/resources/images/common/microphoneOn.png">
	</div>
	<script src="/studyplus/resources/js/webSpeech.js"></script>
</body>
</html>