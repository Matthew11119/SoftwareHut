
window.onload = function(){
  var timerButton = document.getElementById("startTimer");
  startTimer.onclick = runTimer;
  var timerButton = document.getElementById("record");
  record.onclick = countUp;
  var fullButton = document.getElementById("full");
  fullButton.onclick = changeFull;
  var partButton = document.getElementById("part");
  partButton.onclick = changePart;
  var notButton = document.getElementById("not");
  notButton.onclick = changeNot;
  //These will be removed / refactored when OCSEs are available
  var fullButton = document.getElementById("full2");
  fullButton.onclick = changeFull2;
  var partButton = document.getElementById("part2");
  partButton.onclick = changePart2;
  var notButton = document.getElementById("not2");
  notButton.onclick = changeNot2;

  var recTimer = document.getElementById("timer2");
  recTimer.onclick = countUp;
  var resBut = document.getElementById("resultButton");
  resBut.onclick = changePass;
}



function changeFull(){
  document.getElementById("fullbox").style.backgroundColor = '#00AAAA';
  document.getElementById("partbox").style.backgroundColor = '#333388';
  document.getElementById("notbox").style.backgroundColor = '#333388';
}

function changePart(){
  document.getElementById("fullbox").style.backgroundColor = '#333388';
  document.getElementById("partbox").style.backgroundColor = '#00AAAA';
  document.getElementById("notbox").style.backgroundColor = '#333388';
}

function changeNot() {
  document.getElementById("fullbox").style.backgroundColor = '#333388';
  document.getElementById("partbox").style.backgroundColor = '#333388';
  document.getElementById("notbox").style.backgroundColor = '#00AAAA';
}

function changeFull2(){
  document.getElementById("fullbox2").style.backgroundColor = '#00AAAA';
  document.getElementById("partbox2").style.backgroundColor = '#333388';
  document.getElementById("notbox2").style.backgroundColor = '#333388';
}

function changePart2(){
  document.getElementById("fullbox2").style.backgroundColor = '#333388';
  document.getElementById("partbox2").style.backgroundColor = '#00AAAA';
  document.getElementById("notbox2").style.backgroundColor = '#333388';
}

function changeNot2() {
  document.getElementById("fullbox2").style.backgroundColor = '#333388';
  document.getElementById("partbox2").style.backgroundColor = '#333388';
  document.getElementById("notbox2").style.backgroundColor = '#00AAAA';
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
