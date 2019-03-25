window.onload = function(){
  var record = document.getElementById("record");
  var stopRecord = document.getElementById("stopRecord");
  var timerButton = document.getElementById("startTimer");
  startTimer.onclick = runTimer;
  record.onclick = countUp;
  var recTimer = document.getElementById("timer2");
  recTimer.onclick = countUp;
  var resBut = document.getElementById("resultButton");
  resBut.onclick = changePass;



  navigator.mediaDevices.getUserMedia({audio:true})
        .then(stream => {handlerFunction(stream)})


  function handlerFunction(stream) {
    rec = new MediaRecorder(stream);
    rec.ondataavailable = e => {
      audioChunks.push(e.data);
      if (rec.state == "inactive"){
        let blob = new Blob(audioChunks,{type:'audio/mp3'});
        recordedAudio.src = URL.createObjectURL(blob);
        recordedAudio.controls=true;
        recordedAudio.autoplay=true;
        sendData(blob)
      }
    }
  }
  function sendData(data) {
    var link = document.getElementById("download");
    link.download = data;
    link.href = recordedAudio.src;
    link.click();
  }

  record.onclick = e => {
    console.log('I was clicked')
    record.disabled = true;
    record.style.backgroundColor = "blue"
    stopRecord.disabled=false;
    audioChunks = [];
    rec.start();
  }
  stopRecord.onclick = e => {
    console.log("I was clicked")
    record.disabled = false;
    stop.disabled=true;
    record.style.backgroundColor = "red"
    rec.stop();

  }
}

function runTimer(){
  var countDownDate = new Date().getTime() + (20 * 60 * 1000);
  var x = setInterval(function(){
    timeLeft(countDownDate);
  },1000);
}

function timeLeft(countDownDate){
  var now = new Date().getTime();

  // Find the distance between now and the count down date
  var distance = countDownDate - now;

  // Time calculations for days, hours, minutes and seconds
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
  if (seconds < 10){
    seconds = "0" + seconds;
  }

  // Display the result in the element with id="demo"
  document.getElementById("demo").innerHTML = "Time remaining - " + minutes + ":" + seconds + "s";
  // If the count down is finished, write some text
  if (distance < 0) {
    clearInterval(x);
    document.getElementById("demo").innerHTML = "EXPIRED";
  }
}


function countUp(){
  var origTime = new Date().getTime()
  var intValue = setInterval(function(){
    loopCount(origTime, intValue);
  },1000);
}

function loopCount(origTime, intValue){
  var newTime = new Date().getTime();
  var diff = newTime - origTime;

  var minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((diff % (1000 * 60)) / 1000);
  if (seconds < 10){
    seconds = "0" + seconds;
  }

  document.getElementById("timer2").innerHTML = "Recording - " + minutes + " : " + seconds;
  var stopButton = document.getElementById("stopRecord")
  stopButton.onclick = function(){
    stopRec(intValue);
  }
}

function stopRec(intValue){
  clearInterval(intValue);
  document.getElementById("timer2").innerHTML = "Recording finished";
  document.getElementById("record").onclick = countUp;
}

function changePass()
{
    if (this.value=="Pass"){
      this.value = "Fail";
      document.getElementById("resultButton").innerHTML = "Fail";
    } else {
      this.value = "Pass";
      document.getElementById("resultButton").innerHTML = "Pass";
    }
}
