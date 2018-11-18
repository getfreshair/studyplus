var SpeechRecognition = SpeechRecognition || webkitSpeechRecognition;
var SpeechGrammarList = SpeechGrammarList || webkitSpeechGrammarList;
var SpeechRecognitionEvent = SpeechRecognitionEvent || webkitSpeechRecognitionEvent;

var phrasePara = document.querySelector('.phrase');
var testBtn = document.querySelector('.chatBotMicImg');

var seq = 1;
function testSpeech() {
  testBtn.disabled = true;
  $('.voiceMakingGif').attr('src','/studyplus/resources/images/common/voiceMakingGif.gif');

  // To ensure case consistency while checking with the returned output text
  $clientContent = $('<div class="clientContent">');
  $output = $('<div class="output output' + seq + '">');
  $clientImg = $('<img class="clientImg">');
  $clientImg.attr('src', '/studyplus/resources/images/member/userImg.png');
  $clientContent.append($output);
  $clientContent.append($clientImg);
  
  $('.chatBotArea').append($clientContent);
  $('.output'+seq).html('...');

  var recognition = new SpeechRecognition();
  var speechRecognitionList = new SpeechGrammarList();
  recognition.grammars = speechRecognitionList;
  recognition.lang = 'ko-KR';
  recognition.interimResults = false;
  recognition.maxAlternatives = 1;
  
  recognition.start();
  
  recognition.onresult = function(event) {
	  $.ajax({
		  url : 'questionAnalysis.me',
		  data : {
			  sentence : event.results[0][0].transcript
		  },
		  contentType: 'application/x-www-form-urlencoded; charset=euc-kr',
		  success : function(data){
			  console.log(data);
			  
			  $('.output'+seq).empty();
			  $('.output'+seq).html(event.results[0][0].transcript);
			  
			  $serverContent = $('<div class="serverContent">');
			  $serverImg = $('<img class="serverImg" src="/studyplus/resources/images/common/operator.png">');
			  $phrase = $('<div class="phrase">').append(data.questionInfo.infoMessage);
			  
			  if(data.questionInfo.pageUrl != null){
				  console.log(data.questionInfo.pageUrl);
				  window.opener.location.href='' + data.questionInfo.pageUrl + '';
			  }
			  
			  if(data.questionInfo.infoMessage != null){
				  $serverContent = $('<div class="serverContent">');
				  $serverImg = $('<img class="serverImg" src="/studyplus/resources/images/common/operator.png">');
				  $phrase = $('<div class="phrase">').append(data.questionInfo.infoMessage);
				  
				  $serverContent.append($serverImg);
				  $serverContent.append($phrase);
				  
				  $('.chatBotArea').append($serverContent);
			  }
			  
			  if(data.questionInfo.infoImgNames != null){
				  $serverContent = $('<div class="serverContent">');
				  $serverImg = $('<img class="serverImg" src="/studyplus/resources/images/common/operator.png">');
				  
				  $serverContent.append($serverImg);
				  
				  for(var key in data){
					  if(infoImgNames = 'infoImgNames'){
						  for(var imgNames in data[key]){
							  for(var imgName in data[key][imgNames]){
								  $serverInfoImg = $('<img class="serverInfoImg" src="/studyplus/resources/images/member/' + data[key][imgNames][imgName].FILES_NAME + '">');
								  
								  $serverContent.append($serverInfoImg);
							  }
						  }
					  }  
				  }
				  
				  $('.chatBotArea').append($serverContent);
			  }
			  
			  var chatBotBottomFocus = document.getElementsByClassName("chatBotArea")[0];

			  chatBotBottomFocus.scrollTop = chatBotBottomFocus.scrollHeight - 300;
			  
			  seq++;
		  },
		  error : function(){
			  $('.output'+seq).empty();
			  $('.output'+seq).html(event.results[0][0].transcript);
			  
			  seq++;
			  
			  $serverContent = $('<div class="serverContent">');
			  $serverImg = $('<img class="serverImg" src="/studyplus/resources/images/common/operator.png">');
			  $phrase = $('<div class="phrase">').append('죄송해요 이해를 못 했어요. 다시 한 번 더 말씀해 주세요.(error)');
			  
			  $serverContent.append($serverImg);
			  $serverContent.append($phrase);
			  
			  $('.chatBotArea').append($serverContent);
		  }
	  });
  }

  recognition.onspeechend = function() {
	    recognition.stop();
	    testBtn.disabled = false;
	    $('.voiceMakingGif').attr('src','');
	}

  /*recognition.onerror = function(event) {
    testBtn.disabled = false;
    testBtn.textContent = 'Start new test';
  }
  
  recognition.onaudiostart = function(event) {
      //Fired when the user agent has started to capture audio.
      console.log('SpeechRecognition.onaudiostart');
  }
  
  recognition.onaudioend = function(event) {
      //Fired when the user agent has finished capturing audio.
      console.log('SpeechRecognition.onaudioend');
  }
  
  recognition.onend = function(event) {
      //Fired when the speech recognition service has disconnected.
      console.log('SpeechRecognition.onend');
  }
  
  recognition.onnomatch = function(event) {
      //Fired when the speech recognition service returns a final result with no significant recognition. This may involve some degree of recognition, which doesn't meet or exceed the confidence threshold.
      console.log('SpeechRecognition.onnomatch');
  }
  
  recognition.onsoundstart = function(event) {
      //Fired when any sound — recognisable speech or not — has been detected.
      console.log('SpeechRecognition.onsoundstart');
  }
  
  recognition.onsoundend = function(event) {
      //Fired when any sound — recognisable speech or not — has stopped being detected.
      console.log('SpeechRecognition.onsoundend');
  }
  
  recognition.onspeechstart = function (event) {
      //Fired when sound that is recognised by the speech recognition service as speech has been detected.
      console.log('SpeechRecognition.onspeechstart');
  }
  recognition.onstart = function(event) {
      //Fired when the speech recognition service has begun listening to incoming audio with intent to recognize grammars associated with the current SpeechRecognition.
      console.log('SpeechRecognition.onstart');
  }*/
}

testBtn.addEventListener('click', testSpeech);
