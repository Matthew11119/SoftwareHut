window.onload = function(){
  var record = document.getElementById("record");
  var stopRecord = document.getElementById("stopRecord");

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
