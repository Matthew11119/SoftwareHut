
window.onload = function(){
  var timerButton = document.getElementById("startTimer");
  startTimer.onclick = runTimer;

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
