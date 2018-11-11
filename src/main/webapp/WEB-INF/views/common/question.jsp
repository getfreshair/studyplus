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
	.chatBotArea {
		display:inline-block;
		width:100%;
		height:50%;
		background:white;
	}
	.chatBotMicArea {
		width:100%;
		text-align:center;
		margin-top:10px;
		margin-bottom:10px;
	}
	.chatBotMicImg:hover {
		cursor:pointer;
	}
	.clientContent {
		display:inline-block;
		width:100%;
		height:50%;
		text-align:right;
	}
	.serverContent {
		display:inline-block;
		width:100%;
		height:50%;
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
</style>
</head>
<body>
	<div class="chatBotArea">
		<div class="serverContent">
			<img class="serverImg" src="/studyplus/resources/images/common/operator.png"/>
			<div class="phrase">무엇이든 물어보세요^^</div>
		</div>
	</div>
	<div class="chatBotMicArea">
		<img class="chatBotMicImg" src="/studyplus/resources/images/common/microphoneOn.png">
	</div>
	<script src="/studyplus/resources/js/webSpeech.js"></script>
</body>
</html>