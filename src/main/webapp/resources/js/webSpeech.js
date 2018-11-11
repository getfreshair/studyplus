var SpeechRecognition = SpeechRecognition || webkitSpeechRecognition;
var SpeechGrammarList = SpeechGrammarList || webkitSpeechGrammarList;
var SpeechRecognitionEvent = SpeechRecognitionEvent || webkitSpeechRecognitionEvent;

var phrasePara = document.querySelector('.phrase');

var testBtn = document.querySelector('.chatBotMicImg');
var seq = 1;
function testSpeech() {
  testBtn.disabled = true;
  $('.chatBotMicImg').attr('src','/studyplus/resources/images/common/microphoneOff.png');

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
  recognition.lang = 'en-US';
  recognition.interimResults = false;
  recognition.maxAlternatives = 1;
  
  recognition.start();
  
  recognition.onresult = function(event) { 
    var speechResult = event.results[0][0].transcript;
    $('.output'+seq).empty();
    $('.output'+seq).html(speechResult);
    seq++;
  }

  recognition.onspeechend = function() {
    recognition.stop();
    testBtn.disabled = false;
    $('.chatBotMicImg').attr('src','/studyplus/resources/images/common/microphoneOn.png');
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
