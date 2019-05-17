// JAVASCRIPT for OSCE page

window.onload = function(){
  var timerButton = document.getElementById("startTimer");
  startTimer.onclick = runTimer;
  var timerButton = document.getElementById("record");
  record.onclick = countUp;
  var recTimer = document.getElementById("timer2");
  recTimer.onclick = countUp;
  var resBut = document.getElementById("resultButton");
  resBut.onclick = changePass;
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


$(function() {
  $("#selectAll").select_all();
});
